import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';
import '../../data/repositories/feed_repository.dart';

enum FeedStatus { initial, loading, success, failure }

class FeedState {
  const FeedState({
    this.status = FeedStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  final FeedStatus status;
  final List<PostModel> posts;
  final String? errorMessage;
}

/// Exposes UI state and commands called by the View.
class FeedViewModel extends Cubit<FeedState> {
  FeedViewModel(this._repository) : super(const FeedState());

  final FeedRepository _repository;

  Future<void> loadFeed() => _load(forceRefresh: false);

  Future<void> refreshFeed() => _load(forceRefresh: true);

  Future<void> _load({required bool forceRefresh}) async {
    emit(const FeedState(status: FeedStatus.loading));
    try {
      final posts = await _repository.getFeed(forceRefresh: forceRefresh);
      emit(FeedState(status: FeedStatus.success, posts: posts));
    } on FeedRepositoryException catch (error) {
      emit(FeedState(status: FeedStatus.failure, errorMessage: error.message));
    } catch (_) {
      emit(const FeedState(
        status: FeedStatus.failure,
        errorMessage: 'Không thể tải bảng tin.',
      ));
    }
  }
}
