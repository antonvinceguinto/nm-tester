import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/add_c_bloc/add_customer_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/address_field.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/widgets/job_list_tile.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

enum ExpiryEnum {
  ofTheFollowingMonth,
  daysAfterTheQuoteDate,
  daysAfterTheEndOfTheQuoteMonth,
  ofTheCurrentMonth;

  String get value {
    switch (this) {
      case ExpiryEnum.ofTheFollowingMonth:
        return '0';
      case ExpiryEnum.daysAfterTheQuoteDate:
        return '1';
      case ExpiryEnum.daysAfterTheEndOfTheQuoteMonth:
        return '2';
      case ExpiryEnum.ofTheCurrentMonth:
        return '3';
    }
  }
}

@RoutePage()
class JobsAddCustomerPage extends StatelessWidget {
  const JobsAddCustomerPage({
    super.key,
    this.isSite = false,
    this.parentContactId,
  });

  final bool isSite;
  final int? parentContactId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddCustomerBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          ),
        ),
        BlocProvider<ContactTypesBloc>.value(
          value: context.read<ContactTypesBloc>()
            ..add(const ContactTypesFetchEvent()),
        ),
      ],
      child: JobsAddCustomerView(
        isSite: isSite,
        parentContactId: parentContactId,
      ),
    );
  }
}

class JobsAddCustomerView extends StatefulWidget {
  const JobsAddCustomerView({
    super.key,
    required this.isSite,
    this.parentContactId,
  });

  final bool isSite;
  final int? parentContactId;

  @override
  State<JobsAddCustomerView> createState() => _JobsAddCustomerViewState();
}

class _JobsAddCustomerViewState extends State<JobsAddCustomerView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController displayNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController businessNameController;
  late TextEditingController codeController;

  late TextEditingController pAddressAutoController;
  late TextEditingController pAddressManualController;
  bool pAddressAuto = true;

  late TextEditingController bAddressAutoController;
  late TextEditingController bAddressManualController;
  bool bAddressAuto = true;
  bool sameAsPhysical = false;

  late TextEditingController emailController;
  late TextEditingController invoicesEmailController;

  late TextEditingController websiteController;

  late TextEditingController specialNotesController;

  late TextEditingController ddiController;
  late TextEditingController workController;
  late TextEditingController mobileController;
  late TextEditingController homeController;
  late TextEditingController faxController;

  bool isCustomQuoteExpiry = false;
  bool isCustomDueDate = false;

  late TextEditingController quoteExpiryController;
  late TextEditingController dueDateController;

  String quoteExpiryValue = ExpiryEnum.ofTheFollowingMonth.value;
  String dueDateValue = ExpiryEnum.ofTheFollowingMonth.value;

  @override
  void initState() {
    super.initState();
    displayNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    businessNameController = TextEditingController();
    codeController = TextEditingController();

    pAddressAutoController = TextEditingController();
    pAddressManualController = TextEditingController();
    bAddressAutoController = TextEditingController();
    bAddressManualController = TextEditingController();

    emailController = TextEditingController();
    invoicesEmailController = TextEditingController();

    websiteController = TextEditingController();

    specialNotesController = TextEditingController();

    ddiController = TextEditingController();
    workController = TextEditingController();
    mobileController = TextEditingController();
    homeController = TextEditingController();
    faxController = TextEditingController();

    quoteExpiryController = TextEditingController();
    dueDateController = TextEditingController();

    final cb = context.read<ContactTypesBloc>();

    if (widget.isSite && cb.state.contactTypes.isNotEmpty) {
      cb.add(
        ContactTypesAddEvent(
          contactType: cb.state.contactTypes.firstWhere(
            (element) => element.contacttype_name?.toLowerCase() == 'site',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    displayNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    businessNameController.dispose();
    codeController.dispose();
    pAddressAutoController.dispose();
    pAddressManualController.dispose();
    bAddressAutoController.dispose();
    bAddressManualController.dispose();
    emailController.dispose();
    invoicesEmailController.dispose();
    websiteController.dispose();
    specialNotesController.dispose();
    ddiController.dispose();
    workController.dispose();
    mobileController.dispose();
    homeController.dispose();
    faxController.dispose();
    quoteExpiryController.dispose();
    dueDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer '),
        actions: [
          NMCupertinoButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              if (isCustomQuoteExpiry &&
                  quoteExpiryController.text.trim().isEmpty) {
                showOkAlertDialog(
                  context: context,
                  message: 'Please enter a custom quote expiry',
                );
                return;
              }

              if (isCustomDueDate && dueDateController.text.trim().isEmpty) {
                showOkAlertDialog(
                  context: context,
                  message: 'Please enter a custom due date',
                );
                return;
              }

              context.read<AddCustomerBloc>().add(
                    AddCustomerEvent(
                      contactNameDisplay: displayNameController.text.trim(),
                      contactNameBusiness:
                          businessNameController.text.trim().isEmpty
                              ? null
                              : businessNameController.text.trim(),
                      contactNameFirst: firstNameController.text.trim().isEmpty
                          ? null
                          : firstNameController.text.trim(),
                      contactNameLast: lastNameController.text.trim().isEmpty
                          ? null
                          : lastNameController.text.trim(),
                      contactCode: codeController.text.trim().isEmpty
                          ? null
                          : codeController.text.trim(),
                      contactAddress: pAddressAuto
                          ? pAddressAutoController.text.trim().isEmpty
                              ? null
                              : pAddressAutoController.text.trim()
                          : pAddressManualController.text.trim().isEmpty
                              ? null
                              : pAddressManualController.text.trim(),
                      contactBillingAddress: bAddressAuto
                          ? bAddressAutoController.text.trim().isEmpty
                              ? null
                              : bAddressAutoController.text.trim()
                          : bAddressManualController.text.trim().isEmpty
                              ? null
                              : bAddressManualController.text.trim(),
                      contactEmail: emailController.text.trim().isEmpty
                          ? null
                          : emailController.text.trim(),
                      contactEmailForInvoices:
                          invoicesEmailController.text.trim().isEmpty
                              ? null
                              : invoicesEmailController.text.trim(),
                      contactWebSite: websiteController.text.trim().isEmpty
                          ? null
                          : websiteController.text.trim(),
                      contactSpecialNotes:
                          specialNotesController.text.trim().isEmpty
                              ? null
                              : specialNotesController.text.trim(),
                      contactPhoneDdi: ddiController.text.trim().isEmpty
                          ? null
                          : ddiController.text.trim(),
                      contactPhoneWork: workController.text.trim().isEmpty
                          ? null
                          : workController.text.trim(),
                      contactPhoneMobile: mobileController.text.trim().isEmpty
                          ? null
                          : mobileController.text.trim(),
                      contactPhoneHome: homeController.text.trim().isEmpty
                          ? null
                          : homeController.text.trim(),
                      contactPhoneFax: faxController.text.trim().isEmpty
                          ? null
                          : faxController.text.trim(),
                      contactHasQuoteExpiryRule: isCustomQuoteExpiry,
                      contactHasInvoiceDueRule: isCustomDueDate,
                      contactQuoteExpiryRule: isCustomQuoteExpiry
                          ? int.parse(quoteExpiryValue)
                          : null,
                      contactInvoiceDueRule:
                          isCustomDueDate ? int.parse(dueDateValue) : null,
                      contactQuoteExpiryDays: isCustomQuoteExpiry
                          ? int.parse(quoteExpiryController.text.trim())
                          : null,
                      contactInvoiceDueDays: isCustomDueDate
                          ? int.parse(dueDateController.text.trim())
                          : null,
                      contactTypes: context
                          .read<ContactTypesBloc>()
                          .state
                          .selectedContactTypes
                          .map((e) => e.contacttype_id!)
                          .toList(),
                      contactParentId:
                          widget.isSite ? widget.parentContactId : null,
                    ),
                  );

              context.router.pop('Apply');
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: NMBlocConsumer<ContactTypesBloc, ContactTypesState>(
        builder: (context, state) {
          return AlwaysScroll(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  JobListTile(
                    onTap: state.contactTypes.isEmpty
                        ? null
                        : () {
                            context.router.push(
                              const ContactTypesRoute(),
                            );
                          },
                    title: 'Contact Types',
                    subtitle: state.selectedContactTypes
                            .map((e) => e.contacttype_name)
                            .join(', ')
                            .isEmpty
                        ? state.contactTypes
                            .map(
                              (e) => e.contacttype_isdefault!
                                  ? e.contacttype_name
                                  : '',
                            )
                            .join()
                        : context.select(
                            (ContactTypesBloc bloc) => bloc
                                .state.selectedContactTypes
                                .map((e) => e.contacttype_name)
                                .join(', '),
                          ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 8),
                  _buildTitle('Contact Details'),
                  _buildField(
                    label: 'Display Name*',
                    controller: displayNameController,
                  ),
                  _buildField(
                    label: 'First Name',
                    controller: firstNameController,
                  ),
                  _buildField(
                    label: 'Last Name',
                    controller: lastNameController,
                  ),
                  _buildField(
                    label: 'Business Name',
                    controller: businessNameController,
                  ),
                  _buildField(
                    label: 'Code',
                    controller: codeController,
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Address'),
                  AddressField(
                    label: 'Physical Address',
                    autoController: pAddressAutoController,
                    manualController: pAddressManualController,
                    isAuto: pAddressAuto,
                    onAutoChanged: (value) {
                      setState(() {
                        pAddressAuto = value!;
                      });
                    },
                  ),
                  AddressField(
                    key: const ValueKey('billingAddress'),
                    label: 'Billing Address',
                    autoController: bAddressAutoController,
                    manualController: bAddressManualController,
                    isAuto: bAddressAuto,
                    sameAsPhysical: sameAsPhysical,
                    onSameAsPhysical: (value) {
                      setState(() {
                        sameAsPhysical = value!;

                        if (value) {
                          bAddressAuto = false;
                        }

                        if (!value) {
                          bAddressManualController.text = '';
                          return;
                        }

                        bAddressManualController.text = pAddressAutoController
                                    .text
                                    .trim()
                                    .isNotEmpty &&
                                pAddressAuto
                            ? pAddressAutoController.text
                            : pAddressManualController.text.trim().isNotEmpty
                                ? pAddressManualController.text
                                : '';
                      });
                    },
                    onAutoChanged: (value) {
                      bAddressAuto = value!;

                      if (value) {
                        sameAsPhysical = false;
                        bAddressManualController.text = '';
                      }

                      setState(() {});
                    },
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Email Address'),
                  _buildField(
                    label: 'Contact Email',
                    controller: emailController,
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Email Address for Invoices'),
                  Text(
                    'Multiple email addresses allowed, separated by commas.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  _buildField(
                    label: 'Send Invoices To',
                    controller: invoicesEmailController,
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Website'),
                  _buildField(
                    label: 'Website',
                    controller: websiteController,
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Special Notes'),
                  _buildField(
                    label: 'Notes',
                    controller: specialNotesController,
                    maxLines: 5,
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Contact Numbers'),
                  _buildField(
                    label: 'DDI',
                    controller: ddiController,
                  ),
                  _buildField(
                    label: 'Work',
                    controller: workController,
                  ),
                  _buildField(
                    label: 'Mobile',
                    controller: mobileController,
                  ),
                  _buildField(
                    label: 'Home',
                    controller: homeController,
                  ),
                  _buildField(
                    label: 'Fax',
                    controller: faxController,
                  ),
                  const Divider(thickness: 1),
                  _buildTitle('Quote Default Expiry Date'),
                  _buildDate(
                    label: 'Quote Default Expiry Date',
                    controller: quoteExpiryController,
                    isCustom: isCustomQuoteExpiry,
                  ),
                  const SizedBox(height: 8),
                  const Divider(thickness: 1),
                  _buildTitle('Invoice Default Due Date'),
                  _buildDate(
                    label: 'Invoice Default Due Date',
                    controller: dueDateController,
                    isCustom: isCustomDueDate,
                  ),
                  const SizedBox(height: 8),
                  const Divider(thickness: 1),
                  const SizedBox(height: 32),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDate({
    required String label,
    required TextEditingController controller,
    required bool isCustom,
  }) {
    final isQuote = label.contains('Quote');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          onChanged: (value) {
            if (isQuote) {
              isCustomQuoteExpiry = value ?? false;
            } else {
              isCustomDueDate = value ?? false;
            }
            setState(() {});
          },
          value: isCustom,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            'Use custom ${isQuote ? 'expiry' : 'due'} date for this customer',
            style: NMTextStyles.b2(context),
          ),
        ),
        if (isCustom)
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  style: NMTextStyles.b2(context),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    labelText: 'Due',
                    counterText: '',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 4,
                  validator: isCustom ? InputValidator.isEmpty : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: IgnorePointer(
                  ignoring: !isCustom,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: isQuote ? quoteExpiryValue : dueDateValue,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                    style: NMTextStyles.b2(context),
                    items: [
                      DropdownMenuItem(
                        value: ExpiryEnum.ofTheFollowingMonth.value,
                        child: const FittedBox(
                          child: Text('of the following month'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ExpiryEnum.daysAfterTheQuoteDate.value,
                        child: const FittedBox(
                          child: Text('day(s) after the quote/expiry date'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ExpiryEnum.daysAfterTheEndOfTheQuoteMonth.value,
                        child: const FittedBox(
                          child: Text(
                            'day(s) after the end of the quote/invoice month',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ExpiryEnum.ofTheCurrentMonth.value,
                        child: const FittedBox(
                          child: Text('of the current month'),
                        ),
                      ),
                    ],
                    // onChanged: onChanged,
                    onChanged: (value) {
                      if (isQuote) {
                        quoteExpiryValue = value ?? '';
                      } else {
                        dueDateValue = value ?? '';
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: NMTextStyles.b2(context),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: label,
            alignLabelWithHint: true,
          ),
          validator: label.contains('*') ? InputValidator.isEmpty : null,
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: NMTextStyles.b2(context)?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ).paddingOnly(bottom: 8);
  }
}
