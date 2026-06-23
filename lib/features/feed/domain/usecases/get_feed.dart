import '../entities/post.dart';
import '../repositories/feed_repository.dart';

class GetFeed {
  const GetFeed(this._repository);

  final FeedRepository _repository;

  Future<List<Post>> call() => _repository.getFeed();
}
