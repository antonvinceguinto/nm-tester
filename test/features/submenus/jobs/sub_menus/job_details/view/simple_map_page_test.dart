import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/view/simple_map_page.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';

import '../../../../../../helpers/helpers.dart';

class MockJobInfoLevelModel extends Mock implements JobInfoLevelModel {}

class MockTaskInfoLevelModel extends Mock implements TaskInfoLevelModel {}

void main() {
  final mockJob = MockJobInfoLevelModel();
  final mockTask = MockTaskInfoLevelModel();

  group('SimpleMapPage widget test', () {
    setUp(() async {
      await Helper.initHive();
    });

    tearDown(Helper.deleteHiveBoxes);

    testWidgets('Should display the Google Map', (WidgetTester tester) async {
      await tester.pumpWidget(_buildSimpleMapPage(mockJob, mockTask));

      final googleMapFinder = find.byType(GoogleMap);

      expect(googleMapFinder, findsOneWidget);
    });

    testWidgets('Should initially display a loading indicator',
        (WidgetTester tester) async {
      await tester.pumpWidget(_buildSimpleMapPage(mockJob, mockTask));

      final loadingIndicatorFinder = find.byType(NMSmallLoadingIndicator).last;

      expect(loadingIndicatorFinder, findsOneWidget);
    });
  });
}

Widget _buildSimpleMapPage(JobInfoLevelModel? job, TaskInfoLevelModel? task) {
  return MaterialApp(
    home: SimpleMapPage(
      statusChangeLocation: const LatLng(0, 0),
      statusContactName: 'contactName',
      job: job,
      task: task,
    ),
  );
}
