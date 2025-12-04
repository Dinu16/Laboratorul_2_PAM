import '../entities/home_model.dart';
import '../entities/details_model.dart';

abstract class FeedRepository {
  Future<HomeModel> getFeed();
  Future<DetailsModel> getFeedDetails();
  Future<DetailsModel> getFeedDetailsById(String courseId);
}
