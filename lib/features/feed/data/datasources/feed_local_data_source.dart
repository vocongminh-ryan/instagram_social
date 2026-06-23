import '../models/post_model.dart';

class FeedLocalDataSource {
  Future<List<PostModel>> getPosts() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [
      PostModel(id: '1', author: 'minh.nguyen', caption: 'Chào mừng đến Instagram Social!', likes: 128),
      PostModel(id: '2', author: 'flutter.daily', caption: 'Clean Architecture keeps features independent.', likes: 64),
    ];
  }
}
