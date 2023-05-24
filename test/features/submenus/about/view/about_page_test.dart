import 'dart:io';

import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/core/utils/enums.dart';
import 'package:nextminute/features/menu/sub_menus/about/view/about_page.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../../../helpers/helpers.dart';

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

void main() {
  late MockUrlLauncher mockUrlLauncher;

  late Box<JobsListModel> box1;
  late Box<bool> box2;

  Future<void> initBoxes() async {
    final temp = await Directory.systemTemp.createTemp();
    Hive.init(temp.path);
    box1 = await Hive.openBox<JobsListModel>(BoxType.boxJobsList.name());
    await box1.clear();

    box2 = await Hive.openBox<bool>(BoxType.boxDarkMode.name());
    await box2.clear();
  }

  tearDown(() async {
    await Helper.deleteHiveBoxes();
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(const LaunchOptions());
    mockUrlLauncher = MockUrlLauncher();

    await initBoxes();
  });

  testWidgets('should render about page and launch url - success',
      (tester) async {
    await tester.pumpApp(const AboutPage());
    expect(find.byType(AboutPage), findsOneWidget);

    final privacyPolicyButton =
        find.byKey(const Key('__aboutPage_privacyPolicyButton__'));

    expect(privacyPolicyButton, findsOneWidget);

    final url = Uri.parse('https://nextminute.com/privacy-policy/');

    when(
      () => mockUrlLauncher.launchUrl(
        url.toString(),
        any(),
      ),
    ).thenAnswer((_) async => true);

    await tester.tap(privacyPolicyButton);
    await tester.pumpAndSettle();
  });

  // testWidgets('should launch url - error', (tester) async {
  //   await tester.pumpApp(const AboutPage());
  //   expect(find.byType(AboutPage), findsOneWidget);

  //   final privacyPolicyButton =
  //       find.byKey(const Key('__aboutPage_privacyPolicyButton__'));

  //   expect(privacyPolicyButton, findsOneWidget);

  //   final url = Uri.parse('someerrorlink');

  //   // when(
  //   //   () => launchUrl(url),
  //   // ).thenAnswer((_) async => throw Exception('Could not launch $url'));

  //   await tester.tap(privacyPolicyButton);
  //   await tester.pumpAndSettle();
  // });
}
