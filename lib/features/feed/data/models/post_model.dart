import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.author,
    required super.caption,
    required super.likes,
  });
}
