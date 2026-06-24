import '../models/post_model.dart';
import '../services/feed_api_service.dart';

/// Coordinates caching, mapping and error handling for feed data.
class FeedRepository {
  FeedRepository(this._apiService);

  final FeedApiService _apiService;
  List<PostModel>? _cachedPosts;

  Future<List<PostModel>> getFeed({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedPosts != null) return _cachedPosts!;

    try {
      final posts = await _apiService.getPosts();
      _cachedPosts = List.unmodifiable(posts);
      return _cachedPosts!;
    } catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const FeedRepositoryException('Unable to load feed.'),
        stackTrace,
      );
    }
  }
}

class FeedRepositoryException implements Exception {
  const FeedRepositoryException(this.message);

  final String message;

  @override
  String toString() => message;
}
