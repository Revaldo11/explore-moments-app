import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/app_exception_mapper.dart';
import '../../../../core/network/dio_handler.dart';
import '../models/moment_list_response_model.dart';

class MomentsApiService {
  const MomentsApiService({required this.dioHandler});

  final DioHandler dioHandler;

  Future<List<MomentData>> getMomentList({
    required int limit,
    bool? isRefresh,
  }) async {
    try {
      final response = await dioHandler.getData(
        url: '/posts',
        queryParams: {'limit': limit},
        isRefresh: isRefresh ?? false,
      );
      final responseModel = MomentListResponseModel.fromJson(response);
      if (!responseModel.success) {
        throw AppException(
          responseModel.message.isNotEmpty
              ? responseModel.message
              : 'Failed to fetch moments.',
        );
      }

      return responseModel.data
          .take(limit)
          .toList(growable: false);
    } on AppException catch (error) {
      throw error;
    } on DioException catch (error) {
      throw AppExceptionMapper.fromDioException(error);
    } catch (_) {
      throw const AppException('Unexpected error. Please try again.');
    }
  }
}
