import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var header = prefs.get("Header");

      options.headers.addAll({"Header": "$header${DateTime.now()}"});

      return options;
    }
  }

  @override
  FutureOr<dynamic> onError(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) {
    if (dioError.message.contains("ERROR_001")) {
      // navigatorKey.currentState
      // .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
    }

    return dioError;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {}
}
