import 'dart:convert';
import 'dart:io';

import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/enums.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nm_repository/nm_repository.dart';

import '../features/forgot_password/view/forgot_password_page_test.dart';

class MockNMRepository extends Mock implements NMRepositoryImpl {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    final appRouter = AppRouter();

    SharedPreferences.setMockInitialValues({});
    final sf = await SharedPreferences.getInstance();
    final sharedPrefs = SharedPrefs(sharedPrefs: sf);

    final NMRepositoryImpl nmRepositoryImpl = MockNMRepository();
    final AuthenticationRepositoryImpl authenticationRepositoryImpl =
        MockAuthenticationRepositoryImpl();

    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
          RepositoryProvider.value(
            value: nmRepositoryImpl,
          ),
          RepositoryProvider.value(
            value: authenticationRepositoryImpl,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TabCubit>(
              create: (_) => TabCubit(sharedPrefs: sharedPrefs),
            ),
          ],
          child: MaterialApp.router(
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (_, __) {
              return Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (_) => StackRouterScope(
                      controller: appRouter,
                      stateHash: 0,
                      child: widget,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MockJobsListModelAdapter extends Mock
    implements TypeAdapter<JobsListModel> {}

class MockJobsDatumAdapter extends Mock
    implements TypeAdapter<JobInfoLevelModel> {}

class MockJobContactAdapter extends Mock implements TypeAdapter<JobContact> {}

class Helper {
  static Future<dynamic> readJson(String path) async {
    final response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    return data;
  }

  static void registerAdapters() {
    // Hive
    //   ..registerAdapter<JobsListModel>(JobsListModelAdapter())
    //   ..registerAdapter<JobInfoLevelModel>(JobInfoLevelModelAdapter())
    //   ..registerAdapter<ActualChargesTotals>(ActualChargesTotalsAdapter())
    //   ..registerAdapter<JobContact>(JobContactAdapter());
  }

  static Future<void> initHive() async {
    final temp = await Directory.systemTemp.createTemp();
    Hive.init(temp.path);

    // Box<JobsListModel> box1;
    Box<bool> box2;

    // box1 = await Hive.openBox<JobsListModel>(BoxType.boxJobsList.name());
    // await box1.clear();

    box2 = await Hive.openBox<bool>(BoxType.boxDarkMode.name());
    await box2.clear();
  }

  static Future<void> deleteHiveBoxes() async {
    // final box1 = Hive.box<JobsListModel>(BoxType.boxJobsList.name());
    final box2 = Hive.box<bool>(BoxType.boxDarkMode.name());
    // await box1.deleteFromDisk();
    await box2.deleteFromDisk();
  }
}
