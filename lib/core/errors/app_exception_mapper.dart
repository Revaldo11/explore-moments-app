import 'package:dio/dio.dart';

import 'app_exception.dart';

class AppExceptionMapper {
  const AppExceptionMapper._();

  static AppException fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const AppException('Connection timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return const AppException('Request timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return const AppException('Response timeout. Please try again.');
      case DioExceptionType.badCertificate:
        return const AppException('Invalid security certificate.');
      case DioExceptionType.badResponse:
        return AppException(_messageFromStatusCode(exception.response?.statusCode));
      case DioExceptionType.cancel:
        return const AppException('Request was cancelled.');
      case DioExceptionType.connectionError:
        return const AppException(
          'No internet connection. Please check your network.',
        );
      case DioExceptionType.unknown:
        return const AppException('Unexpected error. Please try again.');
    }
  }

  static String _messageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized request.';
      case 403:
        return 'Access forbidden.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Server error. Please try later.';
      default:
        return 'Unexpected server error. Please try again.';
    }
  }
}
