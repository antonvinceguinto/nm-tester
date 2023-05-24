import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NMRepositoryImpl {
  NMRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<Either<Exception, ListWeeklySummaryModel>> getSheetWeeklyResults(
          DateTime startDate) async =>
      await _apiService.getWeeklySheetResults(startDate);

  // ********************************
  // * Start of Jobs
  // ********************************
  Future<Either<Exception, JobsListModel>> getJobsList([
    Map<String, dynamic>? filterData,
    String? search,
    int take = 200,
    int skip = 0,
  ]) async =>
      await _apiService.getJobsList(
        filterData,
        search,
        take,
        skip,
      );

  Future<Either<Exception, Map<String, dynamic>>> getRelatedBlobCounts(
    int jobId,
  ) async =>
      await _apiService.getRelatedBlobCounts(jobId: jobId);

  Future<Either<Exception, JobInfoLevelModel>> getJobInfoLevel(
    int jobId,
    String infoLevel,
  ) async =>
      await _apiService.getJobInfoLevel(
        jobId: jobId,
        infoLevel: infoLevel,
      );

  Future<Either<Exception, void>> deleteJob({
    required int jobId,
    bool deleteTask = false,
  }) async =>
      await _apiService.deleteJob(
        jobId: jobId,
        deleteTask: deleteTask,
      );

  Future<Either<Exception, void>> addOnsiteLocation({
    String? bookKey,
    int? jobId,
    required double latitude,
    required double longitude,
  }) async =>
      await _apiService.addOnsiteLocation(
        bookKey: bookKey,
        jobId: jobId,
        latitude: latitude,
        longitude: longitude,
      );

  Future<Either<Exception, CustomerModel>> getCustomerList(
    int currPage, {
    String? search,
    required bool isCustomer,
    required bool isUser,
    required bool isSite,
    required bool isSupplier,
    int? parentContactId,
    bool excludeArchived = false,
    bool excludeDisabled = false,
    bool includeDeleted = false,
    bool includeUsers = false,
    bool includeAdmins = false,
    List<int>? roleIds,
    List<int>? contactTypeIds,
    final bool separateHardwareSuppliers = false,
  }) async =>
      await _apiService.getCustomerList(
        currPage: currPage,
        search: search,
        isCustomer: isCustomer,
        isUser: isUser,
        isSite: isSite,
        isSupplier: isSupplier,
        parentContactId: parentContactId,
        excludeArchived: excludeArchived,
        excludeDisabled: excludeDisabled,
        includeDeleted: includeDeleted,
        roleIds: roleIds,
        includeUsers: includeUsers,
        includeAdmins: includeAdmins,
        contactTypeIds: contactTypeIds,
        separateHardwareSuppliers: separateHardwareSuppliers,
      );

  // Future<Either<Exception, List<UserRoleModel>>> getUserRoles() async =>
  //     await _apiService.getUserRoles();

  Future<Either<Exception, List<ContactTypeModel>>> getContactTypes() async =>
      await _apiService.getContactTypes();

  Future<Either<Exception, List<FStatusModel>>>
      getJobStatusFilterList() async =>
          await _apiService.getJobStatusFilterList();

  Future<Either<Exception, List<FTypeModel>>> getJobTypeFilterList() async =>
      await _apiService.getJobTypeFilterList();

  Future<Either<Exception, List<FPricingTypeModel>>>
      getPricingTypeFilterList() async =>
          await _apiService.getPricingTypeFilterList();

  Future<Either<Exception, List<FPriorityModel>>>
      getPriorityFilterList() async =>
          await _apiService.getPriorityFilterList();

  Future<void> updateContactTypes({
    required List<ContactTypeModel> contactTypes,
  }) async =>
      await _apiService.updateContactTypes(
        contactTypes: contactTypes,
      );

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
  }) async =>
      await _apiService.addCustomer(
        contactNameDisplay: contactNameDisplay,
        contactNameBusiness: contactNameBusiness,
        contactNameFirst: contactNameFirst,
        contactNameLast: contactNameLast,
        contactCode: contactCode,
        contactAddress: contactAddress,
        contactBillingAddress: contactBillingAddress,
        contactSpecialNotes: contactSpecialNotes,
        contactPhoneHome: contactPhoneHome,
        contactPhoneWork: contactPhoneWork,
        contactPhoneDdi: contactPhoneDdi,
        contactPhoneMobile: contactPhoneMobile,
        contactPhoneFax: contactPhoneFax,
        contactEmail: contactEmail,
        contactEmailForInvoices: contactEmailForInvoices,
        contactHasInvoiceDueRule: contactHasInvoiceDueRule,
        contactInvoiceDueRule: contactInvoiceDueRule,
        contactInvoiceDueDays: contactInvoiceDueDays,
        contactHasQuoteExpiryRule: contactHasQuoteExpiryRule,
        contactQuoteExpiryRule: contactQuoteExpiryRule,
        contactQuoteExpiryDays: contactQuoteExpiryDays,
        contactWebSite: contactWebSite,
        contactTypes: contactTypes,
        contactParentId: contactParentId,
      );

  Future<Either<Exception, List<String>>> getRecentResponses() async =>
      await _apiService.getRecentResponses();

  Future<void> updateAcceptanceResponse(
    String acceptanceStatusInitial,
    String acceptanceComment,
    int id,
    bool isTask,
  ) async =>
      await _apiService.updateAcceptanceResponse(
        acceptanceStatusInitial,
        acceptanceComment,
        id,
        isTask,
      );

  Future<void> updateJobStatuses({
    required List<FStatusModel> jobStatuses,
  }) async =>
      await _apiService.updateJobStatuses(
        jobStatuses: jobStatuses,
      );

  Future<Either<Exception, void>> updateJobStatus({
    required int jobId,
    required int jobStatusId,
    double? longitude,
    double? latitude,
  }) async =>
      await _apiService.updateJobStatus(
        jobId: jobId,
        jobStatusId: jobStatusId,
        longitude: longitude,
        latitude: latitude,
      );

  Future<Either<Exception, void>> removeLinkedTask({
    required int jobId,
    bool isDeleteBooking = false,
  }) async =>
      await _apiService.removeLinkedTask(
        jobId: jobId,
        isDeleteBooking: isDeleteBooking,
      );

  Future<void> updateJobTypes({
    required List<FTypeModel> jobTypes,
  }) async =>
      await _apiService.updateJobTypes(
        jobTypes: jobTypes,
      );

  Future<void> updatePricingTypes({
    required List<FPricingTypeModel> pricingTypes,
  }) async =>
      await _apiService.updatePricingTypes(
        pricingTypes: pricingTypes,
      );

  Future<void> updatePriorities({
    required List<FPriorityModel> priorities,
  }) async =>
      await _apiService.updatePriorities(
        priorities: priorities,
      );

  Future<void> updateUserCategories({
    required List<CategoryFilterModel> categories,
  }) async =>
      await _apiService.updateUserCategories(
        categories: categories,
      );

  Future<Either<Exception, void>> addNewJob({
    required JobInfoLevelModel job,
    bool isUpdate = false,
    int? jobId,
  }) async {
    return await _apiService.addNewJob(
      job: job,
      isUpdate: isUpdate,
      jobId: jobId,
    );
  }

  // ********************************
  // * End of Jobs
  // ********************************

  Future<Either<Exception, CustomerDatum>> getContactDetails({
    required int contactId,
  }) async =>
      await _apiService.getContactDetails(
        contactId: contactId,
      );

  Future<Either<Exception, UserPermissionsModel>> getUserPermissions() async =>
      await _apiService.getUserPermissions();

  Future<Either<Exception, Map<String, int>>> getVisibleRecordCounts() async =>
      await _apiService.getVisibleRecordCounts();

  Future<Either<Exception, Map<String, int>>> getUnreadMessagesCount() async =>
      await _apiService.getUnreadMessagesCount();

  Future<Either<Exception, List<UserSubscription>>>
      getUserSubscriptions() async => await _apiService.getUserSubscriptions();

  Future<Either<Exception, List<VersionHistoryModel>>> getVersionHistory({
    required String versionId,
  }) async =>
      await _apiService.getVersionHistory(versionId: versionId);

  Future<Either<Exception, TaskListModel>> getExistingTasks({
    int? currPage,
    String? search,
    List<int?>? bookingStatus,
    List<String>? acceptanceStatus,
    List<int?>? priorityIds,
    List<int?>? taskCategoryIds,
    List<int>? bookingClient,
    List<int>? bookingContacts,
    List<int>? bookingCreatedByContacts,
    bool? isExcludeArchive,
    bool isFromJobs = false,
    int? jobId,
    DateTime? startDate,
    DateTime? endDate,
    bool isArchived = false,
    DateTime? originDate,
  }) async =>
      await _apiService.getExistingTasks(
        currPage: currPage,
        search: search,
        bookingStatus: bookingStatus,
        acceptanceStatus: acceptanceStatus,
        priorityIds: priorityIds,
        taskCategoryIds: taskCategoryIds,
        bookingClient: bookingClient,
        bookingContacts: bookingContacts,
        bookingCreatedByContacts: bookingCreatedByContacts,
        isExcludeArchive: isExcludeArchive,
        isFromJobs: isFromJobs,
        jobId: jobId,
        startDate: startDate,
        endDate: endDate,
        isArchived: isArchived,
        originDate: originDate,
      );

  Future<Either<Exception, List<TaskStatusModel>>> getTaskStatuses() async =>
      await _apiService.getTaskStatuses();

  Future<Either<Exception, List<CategoryFilterModel>>>
      getCategoryFilters() async => await _apiService.getCategoryFilters();

  Future<Either<Exception, TaskInfoLevelModel>> getTaskInfoLevel(
    int taskId,
    String infoLevel, {
    required String bookOccurrenceKey,
  }) async =>
      await _apiService.getTaskInfoLevel(
        taskId: taskId,
        infoLevel: infoLevel,
        bookOccurrenceKey: bookOccurrenceKey,
      );

  Future<Either<Exception, Map<String, dynamic>>> getTaskBlobs(
    int taskId,
  ) async =>
      await _apiService.getTaskBlobs(
        taskId,
      );

  Future<Either<Exception, void>> addNewTask({
    String updateMode = '',
    required BuildContext context,
    required TaskInfoLevelModel taskInfoLevelModel,
  }) async =>
      await _apiService.addNewTask(
        taskInfoLevelModel: taskInfoLevelModel,
        updateMode: updateMode,
        context: context,
      );

  Future<Either<Exception, void>> deleteTask(
    int taskId,
    DateTime selectedDate,
    String occurrenceType,
  ) async =>
      await _apiService.deleteTask(
        taskId,
        selectedDate,
        occurrenceType,
      );

  Future<Either<Exception, void>> updateTaskCurrentStatus({
    required int taskId,
    required int statusId,
    double? longitude,
    double? latitude,
  }) async =>
      await _apiService.updateTaskCurrentStatus(
        taskId: taskId,
        statusId: statusId,
        longitude: longitude,
        latitude: latitude,
      );

  Future<Either<Exception, BillableInfoLevelModel>> getBillablesInfoLevel({
    required int id,
    required bool isJob,
    required String infoLevel,
  }) async =>
      await _apiService.getBillablesInfoLevel(
        id: id,
        isJob: isJob,
        infoLevel: infoLevel,
      );

  Future<Either<Exception, QuotesModel>> getQuotes({
    required String type,
    int? currPage = 1,
    String? search,
    Map<String, dynamic> filter = const {},
  }) async =>
      await _apiService.getQuotes(
        type: type,
        currPage: currPage,
        search: search,
        filter: filter,
      );

  Future<Either<Exception, BillableDetailsModel>> getBillableDetails({
    required int billableId,
    required String infoLevel,
  }) async =>
      await _apiService.getBillableDetails(
        billableId: billableId,
        infoLevel: infoLevel,
      );
}
