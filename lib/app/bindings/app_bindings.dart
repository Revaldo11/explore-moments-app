import 'package:get/get.dart';

import '../../core/network/dio_client.dart';
import '../../core/network/dio_handler.dart';
import '../../features/moments/data/repositories/moments_repository.dart';
import '../../features/moments/data/services/moments_api_service.dart';
import '../../features/moments/domain/usecases/get_moments_usecase.dart';
import '../../features/moments/presentation/controllers/moments_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    const baseUrl = 'https://jsonplaceholder.typicode.com';

    Get.lazyPut<DioClient>(() => DioClient(baseUrl: baseUrl));
    Get.lazyPut<DioHandler>(() => DioHandler(dio: Get.find<DioClient>().dio));
    Get.lazyPut<MomentsApiService>(
      () => MomentsApiService(dioHandler: Get.find<DioHandler>()),
    );
    Get.lazyPut<MomentsRepository>(
      () => MomentsRepository(apiService: Get.find<MomentsApiService>()),
    );
    Get.lazyPut<GetMomentsUseCase>(
      () => GetMomentsUseCase(
        fetchMoments: Get.find<MomentsRepository>().fetchMoments,
      ),
    );
    Get.put<MomentsController>(
      MomentsController(getMomentsUseCase: Get.find<GetMomentsUseCase>()),
    );
  }
}
