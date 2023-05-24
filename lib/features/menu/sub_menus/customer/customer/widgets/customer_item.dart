import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

const popResult = 'add_job_customer';

class CustomerItem extends StatelessWidget {
  const CustomerItem({
    super.key,
    required this.customer,
    this.isAssignCustomer = false,
    this.isSelection = false,
    this.isSite = false,
    this.onTap,
    this.isOnMenu = false,
  });

  final CustomerDatum customer;
  final bool isAssignCustomer;
  final bool isSelection;
  final bool isSite;
  final void Function(CustomerDatum)? onTap;
  final bool isOnMenu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () {
              onTap!(customer);
              if (!isOnMenu) {
                if (!context.mounted) return;
                context.router.pop(popResult);
              }
            }
          : () {
              if (isSite) {
                context.read<JobsFilterCubit>().selectSite(
                      customer,
                    );
                context.router.pop(popResult);
                return;
              }
              if (isSelection) {
                context.router.push(
                  CustomerDetailsRoute(
                    id: customer.contact_id!,
                  ),
                );
                return;
              }
              context.read<JobsFilterCubit>().addCustomer(
                    customer,
                    isAssignCustomer: isAssignCustomer,
                  );
              context.router.pop(popResult);
            },
      child: Card(
        color: (customer.contact_is_access_disabled ?? false)
            ? context.isDarkMode
                ? Colors.grey.shade700
                : Colors.grey.shade300
            : context.isDarkMode
                ? NMColors.black
                : Colors.white,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        toBeginningOfSentenceCase(
                              customer.contact_name_display ?? '',
                            ) ??
                            '',
                        style: NMTextStyles.b2(context)?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (customer.contact_logo_uri != null) ...{
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://app.nextminute.com/${customer.contact_logo_uri}',
                          width: 120,
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                          errorWidget: (context, url, error) =>
                              const SizedBox.shrink(),
                        ),
                      )
                    }
                  ],
                ),
                if (customer.contact_name_business != null &&
                    customer.contact_name_business != '') ...{
                  Text(
                    '${customer.contact_name_business}',
                    style: NMTextStyles.b2(context)?.copyWith(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                },
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (customer.contact_address != null &&
                        customer.contact_address != '') ...{
                      Expanded(
                        child: Text(
                          '${customer.contact_address}',
                          style: NMTextStyles.b2(context)?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    },
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (customer.contact_phone_work != null &&
                              customer.contact_phone_work != '')
                            Text(
                              'Work: ${customer.contact_phone_work}',
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          if (customer.contact_phone_mobile != null &&
                              customer.contact_phone_mobile != '')
                            Text(
                              'Mobile: ${customer.contact_phone_mobile}',
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          if (customer.contact_email != null &&
                              customer.contact_email != '')
                            FittedBox(
                              child: Text(
                                '${customer.contact_email}',
                                textAlign: TextAlign.end,
                                style: NMTextStyles.b2(context)?.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.red,
                  thickness: 1,
                ),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    if (customer.contact_subrole_name != null) ...{
                      NMChip(
                        label: customer.contact_subrole_name!,
                      ),
                    },
                    if (customer.contact_is_access_disabled ?? true) ...{
                      const NMChip(
                        label: 'Access Disabled',
                      ),
                    },
                    ...customer.contact_types.map(
                      (e) => NMChip(
                        label: e.contacttype_name ?? '',
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(16),
            if (isSelection)
              Positioned(
                right: 0,
                top: 0,
                child: BlocBuilder<JobsFilterCubit, JobsFilterState>(
                  builder: (context, state) {
                    return Checkbox(
                      value: state.selectedAssignedTos.contains(customer),
                      onChanged: (value) {
                        if (value == null) return;
                        if (value) {
                          context.read<JobsFilterCubit>().addCustomer(
                                customer,
                                isAssignCustomer: isAssignCustomer,
                              );
                        } else {
                          context.read<JobsFilterCubit>().removeCustomer(
                                customer,
                                isAssignCustomer: isAssignCustomer,
                              );
                        }
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
