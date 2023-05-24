import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

class StatusHistoryExpansion extends StatelessWidget {
  const StatusHistoryExpansion({
    super.key,
    required this.historyStatusList,
    this.job,
    this.task,
  });

  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;
  final List<dynamic> historyStatusList;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          'Status History',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        textColor: NMColors.black,
        children: historyStatusList
            .map(
              (e) => ListTile(
                onTap: () {
                  if (e['status_change_location'] == null) {
                    return;
                  }

                  context.router.push(
                    SimpleMapRoute(
                      job: job,
                      task: task,
                      statusChangeLocation: LatLng(
                        (e['status_change_location']
                            as Map<String, dynamic>)['latitude'] as double,
                        (e['status_change_location']
                            as Map<String, dynamic>)['longitude'] as double,
                      ),
                      statusContactName:
                          e['status_changed_by_contact_name_display'] as String,
                    ),
                  );
                },
                title: Text(
                  '${(e as Map<String, dynamic>)['status_name']} '
                  '${e['status_change_address'] == null ? '' : '(GPS)'}',
                  style: NMTextStyles.b2(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateTime.parse(
                    e['status_change_date'] as String,
                  ).formatSEJobDetails(),
                ),
                trailing: NMChip(
                  label: e['status_changed_by_contact_initials'] as String,
                  color: Color(
                    (e['status_changed_by_contact_brush_colour_argb'] as String)
                        .toHexColor(),
                  ).withOpacity(0.5),
                ),
                // Chip(
                //   backgroundColor: Color(
                //     (e['status_changed_by_contact_brush_colour_argb']
                //as String)
                //         .toHexColor(),
                //   ).withOpacity(0.2),
                //   label: Text(
                //     e['status_changed_by_contact_initials'] as String,
                //   ),
                // ),
              ),
            )
            .toList(),
      ),
    );
  }
}
