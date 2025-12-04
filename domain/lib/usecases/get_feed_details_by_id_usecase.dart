import '../entities/details_model.dart';
import '../repositories/feed_repository.dart';

class GetFeedDetailsByIdUseCase {
  final FeedRepository repository;

  GetFeedDetailsByIdUseCase({required this.repository});

  Future<DetailsModel> call(String courseId) async {
    return await repository.getFeedDetailsById(courseId);
  }
}
