import 'package:get/get.dart';
import 'package:domain/repositories/feed_repository.dart';
import 'package:domain/usecases/get_feed_usecase.dart';
import 'package:domain/usecases/get_feed_details_usecase.dart';
import 'package:domain/usecases/get_feed_details_by_id_usecase.dart';

/// Initializes and registers domain layer dependencies
/// Requires data layer dependencies to be initialized first
void initDomainDependencies() {
  // Register use cases
  Get.put<GetFeedUseCase>(
    GetFeedUseCase(repository: Get.find<FeedRepository>()),
  );

  Get.put<GetFeedDetailsUseCase>(
    GetFeedDetailsUseCase(repository: Get.find<FeedRepository>()),
  );

  Get.put<GetFeedDetailsByIdUseCase>(
    GetFeedDetailsByIdUseCase(repository: Get.find<FeedRepository>()),
  );
}
