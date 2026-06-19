import 'package:dio/dio.dart';

import 'api_interceptor.dart';

class DioClient {
  DioClient({required String baseUrl, String Function()? tokenProvider})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
        ),
      ) {
    dio.interceptors.add(ApiInterceptor(tokenProvider: tokenProvider));
  }

  final Dio dio;
}
