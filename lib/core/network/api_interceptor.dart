import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({this.tokenProvider});

  final String Function()? tokenProvider;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';

    final token = tokenProvider?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    log('[REQ] ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('[RES] ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      '[ERR] ${err.response?.statusCode ?? '-'} ${err.requestOptions.uri} ${err.message}',
    );
    handler.next(err);
  }
}
