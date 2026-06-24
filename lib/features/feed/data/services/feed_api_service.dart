import '../models/post_model.dart';

/// Boundary for remote or platform-specific feed calls.
class FeedApiService {
  Future<List<PostModel>> getPosts() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [
      PostModel(
        id: '1',
        author: 'minh.nguyen',
        caption: 'Chào mừng đến Instagram Social!',
        likes: 128,
      ),
      PostModel(
        id: '2',
        author: 'flutter.daily',
        caption: 'MVVM keeps the UI focused on rendering.',
        likes: 64,
      ),
    ];
  }
}
