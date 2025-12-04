import 'package:domain/entities/home_model.dart';
import 'package:domain/entities/details_model.dart';
import 'package:domain/repositories/feed_repository.dart';
import '../datasources/feed_remote_datasource.dart';
import '../mappers/home_mapper.dart';
import '../mappers/details_mapper.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource remoteDataSource;

  FeedRepositoryImpl({required this.remoteDataSource});

  @override
  Future<HomeModel> getFeed() async {
    final dto = await remoteDataSource.getFeed();
    return HomeMapper.toDomain(dto);
  }

  @override
  Future<DetailsModel> getFeedDetails() async {
    final dto = await remoteDataSource.getFeedDetails();
    return DetailsMapper.toDomain(dto);
  }

  @override
  Future<DetailsModel> getFeedDetailsById(String courseId) async {
    final dto = await remoteDataSource.getFeedDetailsById(courseId);
    return DetailsMapper.toDomain(dto);
  }
}
