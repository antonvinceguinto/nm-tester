import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';

class CustomerFilterExpansionItem extends StatefulWidget {
  const CustomerFilterExpansionItem({
    super.key,
    required this.label,
    required this.selectedCustomers,
    required this.selectedEnabledCustomers,
    this.isAssignCustomer = false,
    required this.onClear,
    this.onCustomerSelect,
    this.isCreatedBy = false,
    required this.onCheckboxChanged,
    required this.onExpansionChanged,
    required this.isEnabled,
    this.isSupplier = false,
  });

  final String label;
  final List<CustomerDatum> selectedCustomers;
  final List<CustomerDatum> selectedEnabledCustomers;
  final bool isAssignCustomer;
  final void Function()? onClear;
  final void Function(CustomerDatum)? onCustomerSelect;
  final void Function(CustomerDatum) onCheckboxChanged;
  final void Function(bool) onExpansionChanged;
  final bool isEnabled;
  final bool isCreatedBy; // This is for Tasks filter
  final bool isSupplier;

  @override
  State<CustomerFilterExpansionItem> createState() =>
      _CustomerFilterExpansionItemState();
}

class _CustomerFilterExpansionItemState
    extends State<CustomerFilterExpansionItem> {
  bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        final isExpanded = widget.isEnabled;

        return ExpansionTile(
          title: Text(widget.label),
          trailing: IgnorePointer(
            child: CupertinoSwitch(
              value: isSwitched ?? true && isExpanded,
              onChanged: (_) {},
            ),
          ),
          onExpansionChanged: (val) {
            setState(() {
              isSwitched = val;
            });

            widget.onExpansionChanged(val);
          },
          initiallyExpanded: isExpanded,
          textColor: context.isDarkMode ? Colors.white : Colors.black,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: widget.onClear,
                      child: const Text('Clear'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (widget.isAssignCustomer) {
                          context.router.push(
                            JobsAssignCustomerRoute(
                              onCustomerSelect: widget.onCustomerSelect,
                              isCreatedBy: widget.isCreatedBy,
                            ),
                          );
                          return;
                        }
                        context.router.push(
                          JobsSelectCustomerRoute(
                            onCustomerSelect: widget.onCustomerSelect,
                            isSupplier: widget.isSupplier,
                            separateHardwareSuppliers: true,
                          ),
                        );
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ).paddingAll(12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.selectedCustomers.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  itemBuilder: (context, index) {
                    final c = widget.selectedCustomers[index];

                    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
                      builder: (context, jstate) {
                        return CheckboxListTile(
                          value: widget.selectedEnabledCustomers.contains(c),
                          onChanged: (value) {
                            widget.onCheckboxChanged(c);
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          title: Text(c.contact_name_display ?? '-'),
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        );
      },
    );
  }
}
