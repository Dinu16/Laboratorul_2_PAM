import '../entities/home_model.dart';
import '../repositories/feed_repository.dart';

class GetFeedUseCase {
  final FeedRepository repository;

  GetFeedUseCase({required this.repository});

  Future<HomeModel> call() async {
    return await repository.getFeed();
  }
}
