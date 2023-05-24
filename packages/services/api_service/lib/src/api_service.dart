import 'dart:convert';
import 'dart:developer';
import 'package:api_service/api_service.dart';
import 'package:api_service/src/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:intl/intl.dart';

enum ApiMethodEnum { GET, POST, PUT, DELETE }

class ApiService {
  ApiService({
    required Dio dio,
    required this.baseUrl,
  }) : _dio = dio;

  final Dio _dio;
  final String baseUrl;

  // ********************************
  // * Start of Authentication
  // ********************************
  Future<Either<Exception, UserModel>> login({
    required String email,
    required String password,
  }) async {
    String credentials = "${email}:${password}";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedCredentials = stringToBase64.encode(credentials);

    final response = await _dioRequest(
      '/Authentication/Login',
      ApiMethodEnum.POST,
      isAuthorized: false,
      data: {
        'basic_auth': encodedCredentials,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = await compute(
          (data) => UserModel.fromJson(data),
          r.data,
        );

        await _saveUserLogin(parsedResponse, password);

        await _notifyNewSessionEvent();

        return right(parsedResponse);
      },
    );
  }

  Future<void> _notifyNewSessionEvent() async {
    await _dioRequest(
      '/HubSpot/NotifyNewUserSession',
      ApiMethodEnum.POST,
    );
  }

  Future<Either<Exception, PasswordResetModel>> forgotPassword({
    required String email,
  }) async {
    final response = await _dioRequest(
      '/Authentication/ForgotPassword',
      ApiMethodEnum.POST,
      isAuthorized: false,
      data: {
        'username': email,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = await compute(
          (data) => PasswordResetModel.fromJson(data),
          r.data,
        );

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, PasswordResetModel>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await _dioRequest(
      '/Authentication/ChangePassword',
      ApiMethodEnum.POST,
      data: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => PasswordResetModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  // ********************************
  // * End of Authentication
  // ********************************

  Future<Either<Exception, ListWeeklySummaryModel>> getWeeklySheetResults(
    DateTime startDate,
  ) async {
    final tz = await FlutterTimezone.getLocalTimezone();

    final response = await _dioRequest(
      '/Timesheets/ListWeeklySummary',
      ApiMethodEnum.GET,
      queryParameters: {
        'startDate': startDate.formatForAPI(),
        'contactId': '',
        'timeZone': tz,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => ListWeeklySummaryModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  // ********************************
  // * Start of Jobs List
  // ********************************
  Future<Either<Exception, JobsListModel>> getJobsList([
    Map<String, dynamic>? filterData,
    String? search,
    int take = 200,
    int skip = 0,
  ]) async {
    final response = await _dioRequest(
      '/Jobs/List',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
        'take': take,
        'skip': skip,
        'recent': true,
        // 'infoLevel': 'Details ChargesTotals',
        ...filterData?.map((key, value) => MapEntry(key, value)) ?? {},
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => JobsListModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> getRelatedBlobCounts({
    required int jobId,
  }) async {
    final blobCountRes = await _dioRequest(
      '/Jobs/GetRelatedBlobCounts/$jobId',
      ApiMethodEnum.GET,
    );

    final statusHistoryRes = await _dioRequest(
      '/jobs/$jobId/statushistory',
      ApiMethodEnum.GET,
    );

    final onSiteHistoryRes = await _dioRequest(
      '/jobs/$jobId/onsitehistory',
      ApiMethodEnum.GET,
    );

    final recordCountRes = await _dioRequest(
      '/Jobs/GetRelatedRecordCounts/$jobId',
      ApiMethodEnum.GET,
    );

    return recordCountRes.fold(
      (l) => left(l),
      (r) => right({
        ...r.data,
        ...blobCountRes.foldRight(r.data, (r, previous) => r.data),
        ...{
          'statusHistory': statusHistoryRes.fold((l) => l, (r) => r.data),
          'onSiteHistory': onSiteHistoryRes.fold((l) => l, (r) => r.data)
        }
      }),
    );
  }

  Future<Either<Exception, JobInfoLevelModel>> getJobInfoLevel({
    required int jobId,
    required String infoLevel,
  }) async {
    final response = await _dioRequest(
      '/Jobs/Get/$jobId',
      ApiMethodEnum.GET,
      queryParameters: {
        'infoLevel': infoLevel,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => JobInfoLevelModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, void>> addOnsiteLocation({
    String? bookKey,
    int? jobId,
    required double latitude,
    required double longitude,
  }) async {
    return await _dioRequest(
      '/onsitehistory/add',
      ApiMethodEnum.POST,
      data: {
        'book_key': bookKey,
        'job_id': jobId,
        'location': {
          'latitude': latitude,
          'longitude': longitude,
        },
      },
    );
  }

  Future<Either<Exception, void>> deleteJob({
    required int jobId,
    bool deleteTask = false,
  }) async {
    return await _dioRequest(
      '/Jobs/Delete/$jobId',
      ApiMethodEnum.DELETE,
      queryParameters: {
        'taskAction': deleteTask ? 'Delete' : 'Unassign',
      },
    );
  }

  Future<Either<Exception, List<ContactTypeModel>>> getContactTypes() async {
    final jobSubId = await _getJobSubId();

    final response = await _dioRequest(
      '/ContactTypes/ListBySubscription/$jobSubId',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => data
              .map<ContactTypeModel>(
                (e) => ContactTypeModel.fromJson(e),
              )
              .toList(),
          r.data,
        );

        return right(res);
      },
    );
  }

  // ---- Assignee filter
  // Future<Either<Exception, List<UserRoleModel>>> getUserRoles() async {
  //   final jobSubId = await _getJobSubId();

  //   final response = await _dioRequest(
  //     '/Roles/ListBySubscription/$jobSubId',
  //     ApiMethodEnum.GET,
  //     queryParameters: {
  //       'ts': '',
  //     },
  //   );

  //   return response.fold(
  //     (l) => left(l),
  //     (r) async {
  //       final parsedResponse = await compute(
  //         (data) => data
  //             .map<UserRoleModel>(
  //               (e) => UserRoleModel.fromJson(e),
  //             )
  //             .toList(),
  //         r.data,
  //       );
  //       return right(parsedResponse);
  //     },
  //   );
  // }

  Future<Either<Exception, CustomerModel>> getCustomerList({
    bool separateHardwareSuppliers = false,
    bool isIntegratedSuppliersOnly = false,
    required bool isCustomer,
    required bool isUser,
    required bool isSite,
    required bool isSupplier,
    int? parentContactId,
    int currPage = 1,
    required String? search,
    bool excludeArchived = false,
    bool excludeDisabled = false,
    bool includeDeleted = false,
    bool includeUsers = false,
    bool includeAdmins = false,
    List<int>? roleIds,
    List<int>? contactTypeIds,
  }) async {
    final contactTypesRes = await getContactTypes();

    final contactTypes = contactTypesRes.fold(
      (l) => throw l,
      (r) => r,
    );

    var customerContactTypeId;

    if (isCustomer) {
      customerContactTypeId = contactTypes.firstWhere(
        (element) =>
            element.contacttype_name?.toLowerCase() == 'customer' &&
            element.contacttype_isbuiltin == true,
      );
    } else if (isSite) {
      customerContactTypeId = contactTypes.firstWhere(
        (element) =>
            element.contacttype_name?.toLowerCase() == 'site' &&
            element.contacttype_isbuiltin == true,
      );
    } else if (isSupplier) {
      customerContactTypeId = contactTypes.firstWhere(
        (element) =>
            element.contacttype_name?.toLowerCase() == 'supplier' &&
            element.contacttype_isbuiltin == true,
      );
    }

    final response = await _dioRequest(
      '/Contacts/List',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
        'take': 50,
        'skip': (currPage - 1) * 50,
        'page': currPage,
        'pageSize': 50,
        'separateHardwareSuppliers': separateHardwareSuppliers,
        if (search != null && search.isNotEmpty) 'search': search,
        if (isCustomer || isSite || isSupplier) ...{
          'contactTypes': customerContactTypeId.contacttype_id,
          'isIntegratedSuppliersOnly': isIntegratedSuppliersOnly
        },
        if (isUser) ...{
          'includeUsers': true,
          'includeAdmins': true,
        },
        if (excludeArchived) ...{
          'excludeArchived': true,
        },
        if (excludeDisabled) ...{
          'excludeDisabled': true,
        },
        if (includeDeleted) ...{
          'includeDeleted': true,
        },
        if (!includeUsers || !includeAdmins) ...{
          if (roleIds != null) ...{
            'roles': roleIds.join(','),
          },
        },
        if (contactTypeIds != null && !isCustomer) ...{
          'contactTypes': contactTypeIds.join(','),
        },
        if (includeUsers) ...{
          'includeUsers': true,
        },
        if (includeAdmins) ...{
          'includeAdmins': true,
        },
        if (parentContactId != null) ...{
          'parentContactId': parentContactId,
        }
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => CustomerModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  // ********************************
  // * Start of Job Filters
  // ********************************
  Future<Either<Exception, List<FStatusModel>>> getJobStatusFilterList() async {
    final jobSubId = await _getJobSubId();

    final response = await _dioRequest(
      '/JobStatuses/ListBySubscription/$jobSubId',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = await compute(
          (data) => data
              .map<FStatusModel>(
                (e) => FStatusModel.fromJson(e),
              )
              .toList(),
          r.data,
        );

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, List<FTypeModel>>> getJobTypeFilterList() async {
    final jobSubId = await _getJobSubId();

    final response = await _dioRequest(
      '/JobTypes/ListBySubscription/$jobSubId',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = await compute(
          (data) => data
              .map<FTypeModel>(
                (e) => FTypeModel.fromJson(e),
              )
              .toList(),
          r.data,
        );

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, List<FPricingTypeModel>>>
      getPricingTypeFilterList() async {
    final response = await _dioRequest(
      '/PricingTypes/ListBySubscription',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = await compute(
          (data) => data
              .map<FPricingTypeModel>(
                (e) => FPricingTypeModel.fromJson(e),
              )
              .toList(),
          r.data,
        );

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, List<FPriorityModel>>>
      getPriorityFilterList() async {
    final jobSubId = await _getJobSubId();

    final response = await _dioRequest(
      '/Priorities/ListBySubscription/$jobSubId',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = await compute(
          (data) => data
              .map<FPriorityModel>(
                (e) => FPriorityModel.fromJson(e),
              )
              .toList(),
          r.data,
        );

        return right(parsedResponse);
      },
    );
  }

  Future<void> updateContactTypes({
    required List<ContactTypeModel> contactTypes,
  }) async {
    final jobSubId = await _getJobSubId();

    final parsedContactTypes = contactTypes
        .map((e) => {
              'contacttype_id': e.contacttype_id == null
                  ? "\"\""
                  : (e.contacttype_id ?? 0) < 0
                      ? null
                      : e.contacttype_id,
              'contacttype_name': '\"${e.contacttype_name}\"',
              'null': null,
              if (e.isdeleted != null) ...{
                'isdeleted': e.isdeleted,
              }
            })
        .toList();

    await _dioRequest(
      '/ContactTypes/UpdateContactTypesForSubscription/${jobSubId}',
      ApiMethodEnum.POST,
      data: parsedContactTypes.toString(),
    );
  }

  Future<Either<Exception, void>> addCustomer({
    required String contactNameDisplay,
    required String? contactNameBusiness,
    required String? contactNameFirst,
    required String? contactNameLast,
    required String? contactCode,
    required String? contactAddress,
    required String? contactBillingAddress,
    required String? contactSpecialNotes,
    required String? contactPhoneHome,
    required String? contactPhoneWork,
    required String? contactPhoneDdi,
    required String? contactPhoneMobile,
    required String? contactPhoneFax,
    required String? contactEmail,
    required String? contactEmailForInvoices,
    required bool contactHasInvoiceDueRule,
    required int? contactInvoiceDueRule,
    required int? contactInvoiceDueDays,
    required bool contactHasQuoteExpiryRule,
    required int? contactQuoteExpiryRule,
    required int? contactQuoteExpiryDays,
    required String? contactWebSite,
    required List<int> contactTypes,
    required int? contactParentId,
  }) async {
    final formData = {
      'contact_name_display': contactNameDisplay,
      'contact_name_business': contactNameBusiness,
      'contact_name_first': contactNameFirst,
      'contact_name_last': contactNameLast,
      'contact_code': contactCode,
      'contact_address': contactAddress,
      'contact_billing_address': contactBillingAddress,
      'contact_special_notes': contactSpecialNotes,
      'contact_phone_home': contactPhoneHome,
      'contact_phone_work': contactPhoneWork,
      'contact_phone_ddi': contactPhoneDdi,
      'contact_phone_mobile': contactPhoneMobile,
      'contact_phone_fax': contactPhoneFax,
      'contact_email': contactEmail,
      'contact_email_for_invoices': contactEmailForInvoices,
      'contact_has_invoice_due_rule': contactHasInvoiceDueRule,
      'contact_invoice_due_rule': contactInvoiceDueRule,
      'contact_invoice_due_days': contactInvoiceDueDays,
      'contact_has_quote_expiry_rule': contactHasQuoteExpiryRule,
      'contact_quote_expiry_rule': contactQuoteExpiryRule,
      'contact_quote_expiry_days': contactQuoteExpiryDays,
      'contact_web_site': contactWebSite,
      'contact_types': contactTypes.map((e) => {'contacttype_id': e}).toList(),
      'contact_parent_contact_id': contactParentId,
    };

    return await _dioRequest(
      '/Contacts/Add',
      ApiMethodEnum.POST,
      data: formData,
    );
  }
  // ********************************
  // * End of Job Filters
  // ********************************

  Future<Either<Exception, List<String>>> getRecentResponses() async {
    final response = await _dioRequest(
      '/BookingContacts/ListRecentAcceptanceComments',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return response.fold(
      (l) => left(l),
      (r) {
        final parsedResponse = r.data
            .map<String>(
              (e) => e.toString(),
            )
            .toList();

        return right(parsedResponse);
      },
    );
  }

  Future<void> updateAcceptanceResponse(
    String acceptanceStatusInitial,
    String acceptanceComment,
    int id,
    bool isTask,
  ) async {
    if (isTask) {
      await _dioRequest(
        '/Bookings/UpdateBookingAcceptance/$id',
        ApiMethodEnum.POST,
        data: {
          "bookcont_acceptance_status": acceptanceStatusInitial.toUpperCase(),
          "bookcont_acceptance_comment": acceptanceComment
        },
      );

      return;
    }

    await _dioRequest(
      '/Jobs/UpdateJobAcceptance/$id',
      ApiMethodEnum.POST,
      data: {
        "jobcont_acceptance_status": acceptanceStatusInitial.toUpperCase(),
        "jobcont_acceptance_comment": acceptanceComment
      },
    );
  }

  // ********************************
  // * Add Job Requests
  // ********************************

  Future<void> updateJobStatuses({
    required List<FStatusModel> jobStatuses,
  }) async {
    final jobSubId = await _getJobSubId();

    final parsedRes = jobStatuses
        .map((e) => {
              'jobstatus_id': e.id == null
                  ? "\"\""
                  : (e.id ?? 0) < 0
                      ? null
                      : e.id,
              'jobstatus_name': '\"${e.name}\"',
              'jobstatus_brush_colour_argb': '\"${e.color}\"',
              if (e.isdeleted != null) ...{
                'isdeleted': e.isdeleted,
              }
            })
        .toList();

    await _dioRequest(
      '/JobStatuses/UpdateJobStatusesForSubscription/${jobSubId}',
      ApiMethodEnum.POST,
      data: parsedRes.toString(),
    );
  }

  Future<Either<Exception, void>> updateJobStatus({
    required int jobId,
    required int jobStatusId,
    double? longitude,
    double? latitude,
  }) async {
    return await _dioRequest(
      '/Jobs/UpdateJobStatus/${jobId}',
      ApiMethodEnum.POST,
      queryParameters: {
        'jobStatusId': jobStatusId,
        'longitude': longitude,
        'latitude': latitude,
      },
    );
  }

  Future<Either<Exception, void>> removeLinkedTask({
    required int jobId,
    bool isDeleteBooking = false,
  }) async {
    return await _dioRequest(
      '/Jobs/TaskLink/${jobId}',
      ApiMethodEnum.DELETE,
      data: {
        if (isDeleteBooking) 'delete_booking': isDeleteBooking,
      },
    );
  }

  Future<Either<Exception, void>> updateJobTypes({
    required List<FTypeModel> jobTypes,
  }) async {
    final jobSubId = await _getJobSubId();

    final parsedRes = jobTypes
        .map((e) => {
              'jobtype_id': e.id == null
                  ? "\"\""
                  : (e.id ?? 0) < 0
                      ? null
                      : e.id,
              'jobtype_name': '\"${e.name}\"',
              'jobtype_brush_colour_argb': '\"${e.color}\"',
              if (e.isdeleted != null) ...{
                'isdeleted': e.isdeleted,
              }
            })
        .toList();

    return await _dioRequest(
      '/JobTypes/UpdateJobTypesForSubscription/${jobSubId}',
      ApiMethodEnum.POST,
      data: parsedRes.toString(),
    );
  }

  Future<void> updatePricingTypes({
    required List<FPricingTypeModel> pricingTypes,
  }) async {
    final jobSubId = await _getJobSubId();

    final parsedRes = pricingTypes
        .map((e) => {
              'pricingtype_id': e.id == null
                  ? "\"\""
                  : (e.id ?? 0) < 0
                      ? null
                      : e.id,
              'pricingtype_name': '\"${e.name}\"',
              if (e.isdeleted != null) ...{
                'isdeleted': e.isdeleted,
              }
            })
        .toList();

    await _dioRequest(
      '/PricingTypes/UpdatePricingTypesForSubscription/${jobSubId}',
      ApiMethodEnum.POST,
      data: parsedRes.toString(),
    );
  }

  Future<void> updateUserCategories({
    required List<CategoryFilterModel> categories,
  }) async {
    final jobSubId = await _getJobSubId();

    final parsedRes = categories
        .map((e) => {
              'usercategory_id': e.id == null
                  ? "\"\""
                  : (e.id ?? 0) < 0
                      ? null
                      : e.id,
              'usercategory_name': '\"${e.name}\"',
              'usercategory_brush_colour_argb': '\"${e.color}\"',
              if (e.isdeleted != null) ...{
                'isdeleted': e.isdeleted,
              }
            })
        .toList();

    await _dioRequest(
      '/UserCategories/UpdateUserCategoriesForSubscription/${jobSubId}',
      ApiMethodEnum.POST,
      data: parsedRes.toString(),
    );
  }

  Future<void> updatePriorities({
    required List<FPriorityModel> priorities,
  }) async {
    final jobSubId = await _getJobSubId();

    final parsedRes = priorities
        .map((e) => {
              'priority_id': e.id == null
                  ? "\"\""
                  : (e.id ?? 0) < 0
                      ? null
                      : e.id,
              'priority_name': '\"${e.name}\"',
              'priority_brush_colour_argb': '\"${e.color}\"',
              if (e.isdeleted != null) ...{
                'isdeleted': e.isdeleted,
              }
            })
        .toList();

    await _dioRequest(
      '/Priorities/UpdatePrioritiesForSubscription/${jobSubId}',
      ApiMethodEnum.POST,
      data: parsedRes.toString(),
    );
  }

  Future<Either<Exception, void>> addNewJob({
    required JobInfoLevelModel job,
    bool isUpdate = false,
    int? jobId,
  }) async {
    final parsedRes = job.toJson();

    parsedRes['job_start'] = job.job_start?.toIso8601String();
    parsedRes['job_end'] = job.job_end?.toIso8601String();
    parsedRes['job_due'] = job.job_due?.toIso8601String();

    if (isUpdate) {
      return _dioRequest(
        '/Jobs/Update/${jobId}',
        ApiMethodEnum.POST,
        data: parsedRes,
      );
    }

    return _dioRequest(
      '/Jobs/Add',
      ApiMethodEnum.POST,
      data: parsedRes,
    );
  }

  // ********************************
  // * End of Jobs List
  // ********************************

  Future<Either<Exception, CustomerDatum>> getContactDetails({
    required int contactId,
  }) async {
    final res = await _dioRequest(
      '/Contacts/Get/${contactId.toString()}',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => CustomerDatum.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, UserPermissionsModel>> getUserPermissions() async {
    final res = await _dioRequest(
      '/Security/GetUserPermissions',
      ApiMethodEnum.GET,
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => UserPermissionsModel.fromJson(data),
          r.data,
        );

        final sharedPrefs =
            SharedPrefs(sharedPrefs: await SharedPreferences.getInstance());

        if (res.subscriptions?.isNotEmpty ?? false) {
          final currentEmail = sharedPrefs.username;

          // Get the current subscription using the email address
          final currSub = res.subscriptions?.firstWhere(
            (element) => element.contact!.contact_email == currentEmail,
            orElse: () => res.subscriptions![0],
          );

          sharedPrefs.contactId = currSub?.contact_id.toString() ?? '';
          sharedPrefs.subscriptionId =
              currSub?.subscription_id.toString() ?? '';
        }

        return right(res);
      },
    );
  }

  Future<Either<Exception, Map<String, int>>> getUnreadMessagesCount() async {
    final sharedPrefs = SharedPrefs(
      sharedPrefs: await SharedPreferences.getInstance(),
    );

    final res = await _dioRequest(
      '/Messages/GetUnreadMessagesCount/${sharedPrefs.subscriptionId}',
      ApiMethodEnum.GET,
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => Map<String, int>.from(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, Map<String, int>>> getVisibleRecordCounts() async {
    final sharedPrefs = SharedPrefs(
      sharedPrefs: await SharedPreferences.getInstance(),
    );

    final now = DateTime.now().toUtc().toIso8601String();

    final res = await _dioRequest(
      '/Subscriptions/GetVisibleRecordCounts/${sharedPrefs.subscriptionId}',
      ApiMethodEnum.GET,
      queryParameters: {
        'type': '',
        'dueDate': now,
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => Map<String, int>.from(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, List<UserSubscription>>>
      getUserSubscriptions() async {
    final res = await _dioRequest(
      '/Subscriptions/ListAllSubscriptionsForUser',
      ApiMethodEnum.GET,
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => List<UserSubscription>.from(
            data.map(
              (r) => UserSubscription.fromJson(r),
            ),
          ),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, List<VersionHistoryModel>>> getVersionHistory({
    required String versionId,
  }) async {
    final res = await _dioRequest(
      '/ApplicationVersions/List',
      ApiMethodEnum.GET,
      queryParameters: {
        'to': versionId,
        'appMode': 'phone',
      },
    );

    return res.fold(
      (l) => left(l),
      (r) {
        final parsedResponse = r.data
            .map<VersionHistoryModel>(
              (e) => VersionHistoryModel.fromJson(e),
            )
            .toList();

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, TaskListModel>> getExistingTasks({
    int? currPage = 1,
    String? search,
    List<String>? acceptanceStatus,
    List<int?>? bookingStatus,
    List<int?>? priorityIds,
    List<int?>? taskCategoryIds,
    List<int>? bookingClient, // Customer
    List<int>? bookingContacts, // Assigned To
    List<int>? bookingCreatedByContacts,
    int? jobId,
    bool? isExcludeArchive,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? originDate,
    bool isFromJobs = false,
    bool isArchived = false,
  }) async {
    var _startDate;
    var _endDate;
    var _originDate;

    if (startDate != null && endDate != null) {
      final t = startDate.subtract(Duration(days: 1));
      final year = t.year;
      final month = t.month.toString().padLeft(2, '0');
      final day = t.day.toString().padLeft(2, '0');
      _startDate = '$year-$month-${day}T11:00:00.000Z';

      final year2 = endDate.year;
      final month2 = endDate.month.toString().padLeft(2, '0');
      final day2 = endDate.day.toString().padLeft(2, '0');
      _endDate = '$year2-$month2-${day2}T10:59:59.999Z';
    }

    if (originDate != null) {
      final t = originDate.subtract(Duration(days: 1));
      final year = t.year;
      final month = t.month.toString().padLeft(2, '0');
      final day = t.day.toString().padLeft(2, '0');
      _originDate = '$year-$month-${day}T11:00:00.000Z';
    }

    final tz = await FlutterTimezone.getLocalTimezone();

    final res = await _dioRequest(
      isFromJobs && jobId != null
          ? '/Bookings/ListBookingSummariesByJob2/$jobId'
          : '/Bookings/ListBookingSummariesForUser2',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
        if (originDate == null && startDate == null) ...{
          'take': 50,
          'skip': (currPage! - 1) * 50,
          'page': currPage,
          'pageSize': 50,
          'expandOccurrences': 'false',
        },
        'timezone': tz,
        if (search != null && search.isNotEmpty) 'search': search,
        if (bookingStatus != null && bookingStatus.isNotEmpty)
          'bookingStatus': bookingStatus.join(','),
        if (acceptanceStatus != null && acceptanceStatus.isNotEmpty)
          'acceptanceStatus': acceptanceStatus.join(','),
        if (priorityIds != null && priorityIds.isNotEmpty)
          'priority': priorityIds.join(','),
        if (taskCategoryIds != null && taskCategoryIds.isNotEmpty)
          'category': taskCategoryIds.join(','),
        if (isExcludeArchive != null && isExcludeArchive) 'isComplete': false,
        if (bookingClient != null && bookingClient.isNotEmpty)
          'bookingClient': bookingClient.join(','),
        if (bookingContacts != null && bookingContacts.isNotEmpty)
          'bookingContacts': bookingContacts.join(','),
        if (bookingCreatedByContacts != null &&
            bookingCreatedByContacts.isNotEmpty)
          'bookingCreatedByContacts': bookingCreatedByContacts.join(','),
        'isComplete': isArchived,
        if (startDate != null) 'startDate': _startDate,
        if (endDate != null) 'endDate': _endDate,
        if (originDate != null) ...{
          'origin': _originDate,
          'before': 20,
          'after': 80,
        },
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => TaskListModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, List<TaskStatusModel>>> getTaskStatuses() async {
    final jobSubId = await _getJobSubId();

    final res = await _dioRequest(
      '/BookingStatuses/ListBySubscription/$jobSubId',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = r.data
            .map<TaskStatusModel>(
              (e) => TaskStatusModel.fromJson(e),
            )
            .toList();

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, List<CategoryFilterModel>>>
      getCategoryFilters() async {
    final jobSubId = await _getJobSubId();

    final res = await _dioRequest(
      '/UserCategories/ListBySubscription/$jobSubId',
      ApiMethodEnum.GET,
      queryParameters: {
        'ts': '',
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final parsedResponse = r.data
            .map<CategoryFilterModel>(
              (e) => CategoryFilterModel.fromJson(e),
            )
            .toList();

        return right(parsedResponse);
      },
    );
  }

  Future<Either<Exception, TaskInfoLevelModel>> getTaskInfoLevel({
    required int taskId,
    required String infoLevel,
    required String bookOccurrenceKey,
  }) async {
    Either<Exception, Response<dynamic>> response;

    response = await _dioRequest(
      bookOccurrenceKey.isEmpty
          ? '/Bookings/Get/$taskId'
          : '/Bookings/Get/$bookOccurrenceKey',
      ApiMethodEnum.GET,
      queryParameters: {
        'infoLevel': infoLevel,
      },
    );

    return response.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => TaskInfoLevelModel.fromJson(data),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> getTaskBlobs(
      int taskId) async {
    final blobCountRes = await _dioRequest(
      '/Bookings/GetRelatedBlobCounts/$taskId',
      ApiMethodEnum.GET,
    );

    final statusHistoryRes = await _dioRequest(
      '/bookings/$taskId/statushistory',
      ApiMethodEnum.GET,
    );

    final onSiteHistoryRes = await _dioRequest(
      '/bookings/$taskId/onsitehistory',
      ApiMethodEnum.GET,
    );

    final recordCountRes = await _dioRequest(
      '/Bookings/GetRelatedRecordCounts/$taskId',
      ApiMethodEnum.GET,
    );

    return recordCountRes.fold(
      (l) => left(l),
      (r) => right({
        ...r.data,
        ...blobCountRes.foldRight(r.data, (r, previous) => r.data),
        ...{
          'statusHistory': statusHistoryRes.fold((l) => l, (r) => r.data),
          'onSiteHistory': onSiteHistoryRes.fold((l) => l, (r) => r.data)
        }
      }),
    );
  }

  Future<Either<Exception, void>> addNewTask({
    String updateMode = '',
    required BuildContext context,
    required TaskInfoLevelModel taskInfoLevelModel,
  }) async {
    final parsedRes = taskInfoLevelModel.toJson();

    final tz = await FlutterTimezone.getLocalTimezone();

    parsedRes['book_time_zone'] = tz;

    // Parse the date time to UTC
    parsedRes['book_start'] =
        taskInfoLevelModel.book_start?.toUtc().toIso8601String();
    parsedRes['book_end'] =
        taskInfoLevelModel.book_end?.toUtc().toIso8601String();

    if (updateMode != 'Occurrence' &&
        taskInfoLevelModel.book_recurrence_pattern != null &&
        taskInfoLevelModel.book_recurrence_pattern!.isNotEmpty) {
      parsedRes['book_recurrence_pattern'] =
          taskInfoLevelModel.book_recurrence_pattern;
      parsedRes['book_recurrence_text'] =
          taskInfoLevelModel.book_recurrence_text;
      parsedRes['book_recurrence_pattern_specified'] = true;
    }

    // if book_id is not null, then we are updating a task
    if (taskInfoLevelModel.book_id != null) {
      parsedRes['book_updated_date'] =
          taskInfoLevelModel.book_updated_date?.toIso8601String();

      final isValid = await _dioRequest(
        updateMode == 'EntireSeries'
            ? '/Bookings/Validate/${taskInfoLevelModel.book_id}'
            : '/Bookings/Validate/${taskInfoLevelModel.book_key ?? taskInfoLevelModel.book_id}',
        ApiMethodEnum.POST,
        data: parsedRes,
        queryParameters: updateMode.isEmpty
            ? null
            : {
                'updateMode': updateMode,
              },
      );

      return isValid.fold(
        (l) => left(l),
        (r) async {
          return await validateTask(
            context,
            r,
            parsedRes,
            updateMode,
            taskInfoLevelModel,
          );
        },
      );
    }

    final res = await _dioRequest(
      '/Bookings/Add',
      ApiMethodEnum.POST,
      data: parsedRes,
    );

    return res.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  Future<Either<Exception, Response<dynamic>>> validateTask(
    BuildContext context,
    Response<dynamic> r,
    Map<String, dynamic> parsedRes,
    String updateMode,
    TaskInfoLevelModel taskInfoLevelModel,
  ) async {
    final itemRes = r.data['Items'] as List<dynamic>;

    if (itemRes.isNotEmpty) {
      // loop through the items and check if there is a warning or an error
      for (var i = 0; i < itemRes.length; i++) {
        // if the status is a warning, then we need to ask the user if they want to continue
        if (itemRes[i]['Status'].contains('Warning')) {
          String message;

          if (itemRes[i]['Message'].contains('conflict')) {
            message =
                '${itemRes[i]['Message']}\n\nDo you wish to continue saving the task and overwrite the changes performed by ${itemRes[i]['Subject']}?';
          } else {
            message = itemRes[i]['Message'];
          }

          final dialogRes = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Warning'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Yes'),
                ),
              ],
            ),
          );

          if (dialogRes == true) {
            String dateValue = (itemRes[0]['Value'] ?? '') as String;

            parsedRes['book_updated_date'] = '\"$dateValue\"';

            return await _dioRequest(
              updateMode == 'EntireSeries'
                  ? '/Bookings/Update/${taskInfoLevelModel.book_id}'
                  : '/Bookings/Update/${taskInfoLevelModel.book_key ?? taskInfoLevelModel.book_id}',
              ApiMethodEnum.POST,
              data: parsedRes,
              queryParameters: updateMode.isEmpty
                  ? null
                  : {
                      'updateMode': updateMode,
                    },
            );
          } else {
            return left(Exception(''));
          }
        }

        // if the status is an error, then we need to show the error message to the user
        if (itemRes[i]['Status'].contains('Error')) {
          final dialogRes = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text(itemRes[i]['Message']),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Ok'),
                ),
              ],
            ),
          );

          if (dialogRes == false) {
            return left(Exception(''));
          }
        }
      }
    }

    return _dioRequest(
      updateMode == 'EntireSeries'
          ? '/Bookings/Update/${taskInfoLevelModel.book_id}'
          : '/Bookings/Update/${taskInfoLevelModel.book_key ?? taskInfoLevelModel.book_id}',
      ApiMethodEnum.POST,
      data: parsedRes,
      queryParameters: updateMode.isEmpty
          ? null
          : {
              'updateMode': updateMode,
            },
    );
  }

  Future<Either<Exception, void>> updateTaskCurrentStatus({
    required int taskId,
    required int statusId,
    double? longitude,
    double? latitude,
  }) async {
    return await _dioRequest(
      '/Bookings/UpdateBookingStatus/${taskId}',
      ApiMethodEnum.POST,
      queryParameters: {
        'bookingStatusId': statusId,
        'longitude': longitude,
        'latitude': latitude,
      },
    );
  }

  Future<Either<Exception, void>> deleteTask(
    int taskId,
    DateTime selectedDate,
    String occurrenceType,
  ) async {
    final res = await _dioRequest(
      occurrenceType.isEmpty
          ? '/Bookings/Delete/$taskId'
          : '/Bookings/Delete/$taskId/$occurrenceType/${DateFormat("yyyyMMdd'T'HHmmss'Z'").format(selectedDate)}',
      ApiMethodEnum.DELETE,
      data: {
        'book_id': taskId,
      },
    );

    return res.fold(
      (l) => left(l),
      (r) => right(null),
    );
  }

  Future<Either<Exception, BillableInfoLevelModel>> getBillablesInfoLevel({
    required int id,
    required bool isJob,
    required String infoLevel,
  }) async {
    final res = await _dioRequest(
        '/Billables/${isJob ? 'GetActualChargesForJob' : 'GetActualChargesForBooking'}/$id',
        ApiMethodEnum.GET,
        queryParameters: {
          'infoLevel': infoLevel,
          'withRollUp': true,
          'mergeAfterRollUp': true,
        });

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => BillableInfoLevelModel.fromJson(data ?? {}),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, QuotesModel>> getQuotes({
    required String type,
    int? currPage = 1,
    String? search,
    Map<String, dynamic> filter = const {},
  }) async {
    final subId = await _getJobSubId();

    Map<String, dynamic> tempFilter = Map.of(filter);

    final dateKeys = [
      'DueDateFrom',
      'DueDateTo',
      'BillableDateFrom',
      'BillableDateTo',
      'CreateDateFrom',
      'CreateDateTo',
      'UpdateDateFrom',
      'UpdateDateTo',
    ];

    dateKeys.forEach((key) {
      if (tempFilter.containsKey(key)) {
        tempFilter[key] = '\"${filter[key]}\"';
      }
    });

    tempFilter
      ..remove('QuoteDateOn')
      ..remove('CustomDateOn');

    final res = await _dioRequest(
      '/Billables/ListBySubscription/$subId',
      ApiMethodEnum.GET,
      queryParameters: {
        'type': type,
        'ts': '',
        'take': 50,
        'skip': (currPage! - 1) * 50,
        'page': currPage,
        'pageSize': 50,
        if (search != null && search.isNotEmpty) 'search': search,
        'filter': tempFilter.toString(),
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => QuotesModel.fromJson(data ?? {}),
          r.data,
        );

        return right(res);
      },
    );
  }

  Future<Either<Exception, BillableDetailsModel>> getBillableDetails({
    required int billableId,
    required String infoLevel,
  }) async {
    final res = await _dioRequest(
      '/Billables/Get/$billableId',
      ApiMethodEnum.GET,
      queryParameters: {
        'infoLevel': infoLevel,
      },
    );

    return res.fold(
      (l) => left(l),
      (r) async {
        final res = await compute(
          (data) => BillableDetailsModel.fromJson(data ?? {}),
          r.data,
        );

        return right(res);
      },
    );
  }

  // ------------ Shared dio request method ------------
  Future<Either<Exception, Response>> _dioRequest(
    String path,
    ApiMethodEnum method, {
    bool isAuthorized = true,
    dynamic data,
    dynamic queryParameters,
    Options? options,
  }) async {
    final sharedPrefsInstance =
        SharedPrefs(sharedPrefs: await SharedPreferences.getInstance());

    final isLoginPath = path == '/Authentication/Login';

    try {
      final token = sharedPrefsInstance.token;

      options = Options(
        method: method.name,
        headers: isAuthorized
            ? {
                'Authorization': 'JWT ${token}',
              }
            : {},
      );

      log('URL request: $baseUrl$path query: ${queryParameters} data: $data');

      final response = await _dio.request(
        '$baseUrl$path',
        data: data == null ? null : data,
        queryParameters: queryParameters == null ? null : queryParameters,
        options: options,
      );

      if (isLoginPath && sharedPrefsInstance.userPin.isNotEmpty) {
        sharedPrefsInstance.authStatus = 'authenticated';
      }

      return right(response);
    } on DioError catch (e) {
      log('DioError: ${e.response?.statusCode} ${e.response?.realUri}');

      final res = e.response;

      switch (res?.statusCode) {
        case 401:
          sharedPrefsInstance.authStatus = 'temporarilyAuthenticated';
          return left(UnauthorizedException('Please login again'));
        case 403:
          return left(BadRequestException('Please try again'));
        case 400:
          return left(BadRequestException('Please try again'));
        case 500:
          return left(BadRequestException('Please try again'));
        default:
          return left(BadRequestException('Please try again'));
      }
    } catch (e) {
      log('(Api Service) ${path} _dioRequest exception: $e');
      return left(Exception('Something went wrong. Please try again'));
    }
  }
}

Future<String> _getJobSubId() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  return SharedPrefs(sharedPrefs: sharedPrefs).subscriptionId;
}

Future<void> _saveUserLogin(
  UserModel res,
  String password,
) async {
  // Save the user data to shared preferences
  final sharedPrefsInstance =
      SharedPrefs(sharedPrefs: await SharedPreferences.getInstance());

  sharedPrefsInstance
    ..token = res.token
    ..username = res.user_data.username
    ..subscriberEmail = res.user_data.subscriber_email
    ..password = password
    ..subscriberNameDisplay = res.user_data.subscriber_name_display;
}
