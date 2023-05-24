import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

class OnSiteHistoryExpansion extends StatelessWidget {
  const OnSiteHistoryExpansion({
    super.key,
    required this.onsiteHistoryList,
    this.job,
    this.task,
  });

  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;
  final List<dynamic> onsiteHistoryList;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          'On-Site History',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        textColor: NMColors.black,
        children: onsiteHistoryList
            .map(
              (e) => ListTile(
                onTap: () {
                  if (e['location'] == null) {
                    return;
                  }

                  context.router.push(
                    SimpleMapRoute(
                      job: job,
                      task: task,
                      statusChangeLocation: LatLng(
                        (e['location'] as Map<String, dynamic>)['latitude']
                            as double,
                        (e['location'] as Map<String, dynamic>)['longitude']
                            as double,
                      ),
                      statusContactName: e['contact_name_display'] as String,
                    ),
                  );
                },
                title: Text(
                  '${(e as Map<String, dynamic>)['contact_name_display']} '
                  '${e['location_address'] == null ? '' : '(GPS)'}',
                  style: NMTextStyles.b2(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateTime.parse(
                    e['created'] as String,
                  ).formatSEJobDetails(),
                ),
                trailing: NMChip(
                  label: e['contact_initials'] as String,
                  color: Color(
                    (e['contact_color'] as String).toHexColor(),
                  ).withOpacity(0.5),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
