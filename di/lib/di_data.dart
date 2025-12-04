import 'package:get/get.dart';
import 'package:data/datasources/feed_remote_datasource.dart';
import 'package:data/repositories/feed_repository_impl.dart';
import 'package:domain/repositories/feed_repository.dart';

/// Initializes and registers data layer dependencies
void initDataDependencies() {
  // Register remote data source
  Get.put<FeedRemoteDataSource>(FeedRemoteDataSource());

  // Register repository implementation
  Get.put<FeedRepository>(
    FeedRepositoryImpl(remoteDataSource: Get.find<FeedRemoteDataSource>()),
  );
}
