import '../entities/details_model.dart';
import '../repositories/feed_repository.dart';

class GetFeedDetailsUseCase {
  final FeedRepository repository;

  GetFeedDetailsUseCase({required this.repository});

  Future<DetailsModel> call() async {
    return await repository.getFeedDetails();
  }
}
