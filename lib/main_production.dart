import 'dart:async';
import 'dart:io';

import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextminute/app/view/app.dart';
import 'package:nextminute/bootstrap.dart';
import 'package:nextminute/core/app_config.dart';
import 'package:nextminute/core/utils/enums.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nm_repository/nm_repository.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: NMColors.orange,
    ),
  );

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  await initHive();

  final dio = Dio();

  final sfInstance = await SharedPreferences.getInstance();

  final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

  await initDioInterceptors(dio, sharedPrefs);

  final apiService = ApiService(
    dio: dio,
    baseUrl: AppConfig.production,
  );

  final authenticationRepository = AuthenticationRepositoryImpl(
    apiService: apiService,
  );

  final nmRepository = NMRepositoryImpl(apiService: apiService);

  await bootstrap(
    () => Phoenix(
      child: App(
        authenticationRepository: authenticationRepository,
        nmRepository: nmRepository,
        sharedPrefs: sharedPrefs,
      ),
    ),
  );
}

Future<void> initDioInterceptors(
  Dio dio,
  SharedPrefs sharedPrefs,
) async {
  final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;

  dio.interceptors.addAll(
    [
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(tempPath),
          policy: CachePolicy.refreshForceCache,
          priority: CachePriority.high,
          hitCacheOnErrorExcept: [401, 403],
          keyBuilder: (request) => CustomCacheKeyBuilder().buildKey(
            request,
            sharedPrefs,
          ),
        ),
      ),
    ],
  );
}

Future<void> initHive() async {
  await Hive.initFlutter();

  // Hive
  //   ..registerAdapter<JobsListModel>(JobsListModelAdapter())
  //   ..registerAdapter<JobInfoLevelModel>(JobInfoLevelModelAdapter())
  //   ..registerAdapter<ActualChargesTotals>(ActualChargesTotalsAdapter())
  //   ..registerAdapter<JobContact>(JobContactAdapter());

  // await Hive.openBox<JobsListModel>(BoxType.boxJobsList.name());
  await Hive.openBox<bool>(BoxType.boxDarkMode.name());
}

class CustomCacheKeyBuilder {
  String buildKey(
    RequestOptions options,
    SharedPrefs sharedPrefs,
  ) {
    if (options.queryParameters.containsKey('ts')) {
      bool? isOffline;

      Connectivity().checkConnectivity().then((value) {
        if (value == ConnectivityResult.none) {
          isOffline = true;
        } else {
          isOffline = false;
        }
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        if (isOffline != null && isOffline!) {
          final cachedTimestamp = sharedPrefs.currentTimestamp;
          options.queryParameters['ts'] = cachedTimestamp;
        } else {
          final nowTs = DateTime.now().millisecondsSinceEpoch.toString();
          sharedPrefs.currentTimestamp = nowTs;
          options.queryParameters['ts'] = nowTs;
        }

        final res = options
          ..queryParameters.removeWhere((key, value) => key != 'ts');

        return res.uri.toString();
      });
    }

    options.queryParameters.clear();

    return options.uri.toString();
  }
}
