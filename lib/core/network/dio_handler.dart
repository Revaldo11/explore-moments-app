import 'package:dio/dio.dart';

import '../errors/app_exception.dart';
import '../errors/app_exception_mapper.dart';

class DioHandler {
  const DioHandler({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> getData({
    required String url,
    Map<String, dynamic>? queryParams,
    bool isRefresh = false,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        url,
        queryParameters: queryParams,
        options: Options(
          extra: {'isRefresh': isRefresh},
          validateStatus: (value) => (value ?? 0) < 600,
        ),
      );

      final statusCode = response.statusCode ?? 500;
      final payload = response.data;

      if (statusCode == 200 && payload != null) {
        return payload;
      }

      final serverMessage = _extractErrorMessage(payload);
      throw AppException(serverMessage);
    } on DioException catch (error) {
      throw AppExceptionMapper.fromDioException(error);
    } on AppException catch (error) {
      throw error;
    } catch (_) {
      throw const AppException('Unexpected error. Please try again.');
    }
  }

  String _extractErrorMessage(Map<String, dynamic>? payload) {
    if (payload == null) {
      return 'Unexpected server error. Please try again.';
    }

    final message = payload['message']?.toString();
    if (message != null && message.isNotEmpty) {
      return message;
    }

    final error = payload['error']?.toString();
    if (error != null && error.isNotEmpty) {
      return error;
    }

    return 'Unexpected server error. Please try again.';
  }
}
