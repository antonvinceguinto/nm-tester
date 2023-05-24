import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer_details/bloc/customer_details_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer_details/widgets/cd_header.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer_details/widgets/contact_address.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/widgets/row_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/widgets/job_list_tile.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerDetailsBloc>(
      create: (context) => CustomerDetailsBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(
          CustomerDetailsFetchEvent(
            id: id,
          ),
        ),
      child: const CustomerDetailsView(),
    );
  }
}

class CustomerDetailsView extends StatefulWidget {
  const CustomerDetailsView({super.key});

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsViewState();
}

class _CustomerDetailsViewState extends State<CustomerDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
      ),
      body: NMBlocConsumer<CustomerDetailsBloc, CustomerDetailsState>(
        builder: (context, state) {
          final item = state.contactDetails;

          if (item == null) {
            return const Center(
              child: Text('No data'),
            );
          }

          return AlwaysScroll(
            child: Column(
              children: [
                CDHeader(contactDetails: item),
                JobListTile(
                  title: 'Contact Types',
                  subtitle: item.contact_types.isEmpty
                      ? 'Not assigned'
                      : item.contact_types
                          .map((e) => e.contacttype_name)
                          .join(', '),
                  hasChevron: false,
                ),
                _buildDivider(),
                if (item.contact_address != null) ...{
                  ContactAddress(
                    contactDetail: item,
                  ),
                  _buildDivider(),
                },
                JobListTile(
                  title: 'Billing Address',
                  subtitle: item.contact_billing_address == null ||
                          item.contact_billing_address!.isEmpty
                      ? 'No billing address'
                      : item.contact_billing_address ?? 'Not assigned',
                  hasChevron: false,
                ),
                _buildDivider(),
                JobListTile(
                  title: 'Email Address',
                  subtitle: item.contact_email == null ||
                          (item.contact_email?.isEmpty ?? false)
                      ? 'Not assigned'
                      : item.contact_email,
                  isBlueSubtitle: item.contact_email != null &&
                      item.contact_email!.isNotEmpty,
                ),
                _buildDivider(),
                JobListTile(
                  title: 'Email Address for Invoices',
                  subtitle: item.contact_email_for_invoices == null ||
                          (item.contact_email_for_invoices?.isEmpty ?? false)
                      ? 'Not assigned'
                      : item.contact_email_for_invoices,
                  isBlueSubtitle: item.contact_email_for_invoices != null &&
                      item.contact_email_for_invoices!.isNotEmpty,
                ),
                _buildDivider(),
                JobListTile(
                  title: 'Website',
                  subtitle: item.contact_web_site == null ||
                          (item.contact_web_site?.isEmpty ?? false)
                      ? 'Not assigned'
                      : item.contact_web_site,
                  isBlueSubtitle: item.contact_web_site != null &&
                      item.contact_web_site!.isNotEmpty,
                  hasChevron: false,
                ),
                _buildDivider(),
                JobListTile(
                  title: 'Special Notes',
                  subtitle: item.contact_special_notes == null ||
                          (item.contact_special_notes?.isEmpty ?? false)
                      ? '-'
                      : item.contact_special_notes,
                  hasChevron: false,
                ),
                _buildDivider(),
                _buildPaddingChild(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Numbers',
                        style: _boldText,
                      ),
                      const SizedBox(height: 8),
                      RowItem(
                        label: 'DDI',
                        value: item.contact_phone_ddi != null &&
                                item.contact_phone_ddi!.isNotEmpty
                            ? item.contact_phone_ddi!
                            : 'Not assigned',
                        isBlueSubtitle: item.contact_phone_ddi != null &&
                            item.contact_phone_ddi!.isNotEmpty,
                      ),
                      const SizedBox(height: 4),
                      RowItem(
                        label: 'Work',
                        value: item.contact_phone_work != null &&
                                item.contact_phone_work!.isNotEmpty
                            ? item.contact_phone_work!
                            : 'Not assigned',
                        isBlueSubtitle: item.contact_phone_work != null &&
                            item.contact_phone_work!.isNotEmpty,
                      ),
                      const SizedBox(height: 4),
                      RowItem(
                        label: 'Mobile',
                        value: item.contact_phone_mobile != null &&
                                item.contact_phone_mobile!.isNotEmpty
                            ? item.contact_phone_mobile!
                            : 'Not assigned',
                        isBlueSubtitle: item.contact_phone_mobile != null &&
                            item.contact_phone_mobile!.isNotEmpty,
                      ),
                      const SizedBox(height: 4),
                      RowItem(
                        label: 'Home',
                        value: item.contact_phone_home != null &&
                                item.contact_phone_home!.isNotEmpty
                            ? item.contact_phone_home!
                            : 'Not assigned',
                        isBlueSubtitle: item.contact_phone_home != null &&
                            item.contact_phone_home!.isNotEmpty,
                      ),
                      const SizedBox(height: 4),
                      RowItem(
                        label: 'Fax',
                        value: item.contact_phone_fax != null &&
                                item.contact_phone_fax!.isNotEmpty
                            ? item.contact_phone_fax!
                            : 'Not assigned',
                        isBlueSubtitle: item.contact_phone_fax != null &&
                            item.contact_phone_fax!.isNotEmpty,
                      ),
                    ],
                  ),
                ),
                _buildDivider(),
                JobListTile(
                  title: 'Quote Default Expiry Date',
                  subtitle: item.contact_quote_expiry_rule?.toString() ??
                      'Use subscription defaults',
                  hasChevron: false,
                ),
                _buildDivider(),
                JobListTile(
                  title: 'Invoice Default Due Date',
                  subtitle: item.contact_quote_expiry_rule?.toString() ??
                      'Use subscription defaults',
                  hasChevron: false,
                ),
                _buildDivider(),
                _buildPaddingChild(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Record Update Info',
                        style: _boldText,
                      ),
                      const SizedBox(height: 8),
                      RowItem(
                        label: 'Created By',
                        value: item.contact_created_by_contact_name_display ??
                            'Not assigned',
                      ),
                      RowItem(
                        label: 'Created Date',
                        value:
                            item.contact_created_date?.formatToStartEndTime() ??
                                'Not assigned',
                      ),
                      RowItem(
                        label: 'Last Updated By',
                        value:
                            item.contact_updated_by_contact_name_display ?? '',
                      ),
                      RowItem(
                        label: 'Last Updated Date',
                        value:
                            item.contact_updated_date?.formatToStartEndTime() ??
                                'Not assigned',
                      ),
                    ],
                  ),
                ),
                if (Platform.isIOS) const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaddingChild({required Widget child}) {
    return child.paddingSymmetric(horizontal: 16, vertical: 8);
  }

  TextStyle? get _boldText => NMTextStyles.b2(context)?.copyWith(
        fontWeight: FontWeight.bold,
      );

  Divider _buildDivider() => const Divider(
        thickness: 1,
        height: 1,
      );
}
