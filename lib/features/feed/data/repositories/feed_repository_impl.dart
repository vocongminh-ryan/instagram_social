import '../../domain/entities/post.dart';
import '../../domain/repositories/feed_repository.dart';
import '../datasources/feed_local_data_source.dart';

class FeedRepositoryImpl implements FeedRepository {
  const FeedRepositoryImpl(this._localDataSource);

  final FeedLocalDataSource _localDataSource;

  @override
  Future<List<Post>> getFeed() => _localDataSource.getPosts();
}
