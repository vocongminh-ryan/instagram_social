import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post.dart';
import '../../domain/usecases/get_feed.dart';

enum FeedStatus { initial, loading, success, failure }

class FeedState {
  const FeedState({this.status = FeedStatus.initial, this.posts = const [], this.errorMessage});

  final FeedStatus status;
  final List<Post> posts;
  final String? errorMessage;
}

class FeedCubit extends Cubit<FeedState> {
  FeedCubit(this._getFeed) : super(const FeedState());

  final GetFeed _getFeed;

  Future<void> loadFeed() async {
    emit(const FeedState(status: FeedStatus.loading));
    try {
      final posts = await _getFeed();
      emit(FeedState(status: FeedStatus.success, posts: posts));
    } catch (_) {
      emit(const FeedState(status: FeedStatus.failure, errorMessage: 'Không thể tải bảng tin.'));
    }
  }
}
