import '../../domain/entities/moment_entity.dart';
import '../services/moments_api_service.dart';

class MomentsRepository {
  const MomentsRepository({required this.apiService});

  final MomentsApiService apiService;

  Future<List<MomentEntity>> fetchMoments() async {
    final data = await apiService.getMomentList(limit: 20);
    return data.map((item) => item.toMomentModel()).toList(growable: false);
  }
}
