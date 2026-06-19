import '../entities/moment_entity.dart';

typedef FetchMoments = Future<List<MomentEntity>> Function();

class GetMomentsUseCase {
  const GetMomentsUseCase({required this.fetchMoments});

  final FetchMoments fetchMoments;

  Future<List<MomentEntity>> call() => fetchMoments();
}
