import 'package:get/get.dart';

import '../../../../core/errors/app_exception.dart';
import '../../domain/entities/moment_entity.dart';
import '../../domain/usecases/get_moments_usecase.dart';

class MomentsController extends GetxController {
  MomentsController({required this.getMomentsUseCase});

  final GetMomentsUseCase getMomentsUseCase;

  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final moments = <MomentEntity>[].obs;

  Future<void> loadMoments() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final result = await getMomentsUseCase();
      moments.assignAll(result);
    } on AppException catch (error) {
      moments.clear();
      errorMessage.value = error.message;
    } catch (_) {
      moments.clear();
      errorMessage.value = 'Unexpected error. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
}
