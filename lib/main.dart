import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'features/feed/data/datasources/feed_local_data_source.dart';
import 'features/feed/data/repositories/feed_repository_impl.dart';
import 'features/feed/domain/usecases/get_feed.dart';

void main() {
  final repository = FeedRepositoryImpl(FeedLocalDataSource());
  runApp(InstagramSocialApp(getFeed: GetFeed(repository)));
}
