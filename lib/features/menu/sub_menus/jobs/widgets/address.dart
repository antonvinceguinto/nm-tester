import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/utils/jobs_helper.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_maps/view/job_maps_page.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';

class Address extends StatefulWidget {
  const Address({
    super.key,
    required this.address,
    this.job,
    this.task,
  });

  final String address;
  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool isGettingDirections = false;

  @override
  Widget build(BuildContext context) {
    final hasAddress =
        widget.address != 'Not Assigned' && widget.address.trim().isNotEmpty;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: _boldText,
                    ),
                    Text(
                      widget.address,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: !hasAddress
                    ? const SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (widget.task != null) {
                                context.router.push(
                                  JobMapsRoute(
                                    tasks: [widget.task!],
                                  ),
                                );
                                return;
                              }

                              context.router.push(
                                JobMapsRoute(
                                  jobs: [widget.job!],
                                ),
                              );
                            },
                            key: const Key('__view_on_map_btn__'),
                            child: const Text('View on Map'),
                          ),
                          TextButton(
                            onPressed: isGettingDirections
                                ? null
                                : () async {
                                    if (context
                                        .read<SharedPrefs>()
                                        .defaultMaps
                                        .isEmpty) {
                                      setState(() {
                                        isGettingDirections = true;
                                      });
                                    }

                                    await JobsHelper.getDirections(
                                      context,
                                      widget.address,
                                    );
                                    setState(() {
                                      isGettingDirections = false;
                                    });
                                  },
                            child: isGettingDirections
                                ? Container(
                                    width: 20,
                                    alignment: Alignment.centerRight,
                                    child: const NMSmallLoadingIndicator(
                                      color: NMColors.orange,
                                      margin: EdgeInsets.zero,
                                    ),
                                  )
                                : const Text('Get Directions'),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        if (!hasAddress)
          const SizedBox.shrink()
        else
          GestureDetector(
            onTap: () {
              if (widget.task != null) {
                context.router.push(
                  JobMapsRoute(
                    tasks: [widget.task!],
                  ),
                );
                return;
              }

              context.router.push(
                JobMapsRoute(
                  jobs: [widget.job!],
                ),
              );
            },
            child: Container(
              color: Colors.grey[300],
              height: 150,
              child: JobMapsPage(
                jobs: widget.job != null ? [widget.job!] : const [],
                tasks: widget.task != null ? [widget.task!] : const [],
                isEmbedded: true,
              ),
            ),
          ),
      ],
    );
  }

  TextStyle? get _boldText => NMTextStyles.b2(context)?.copyWith(
        fontWeight: FontWeight.bold,
      );
}
