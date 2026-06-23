import '../entities/post.dart';

abstract interface class FeedRepository {
  Future<List<Post>> getFeed();
}
