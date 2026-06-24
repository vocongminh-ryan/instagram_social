import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'features/feed/data/repositories/feed_repository.dart';
import 'features/feed/data/services/feed_api_service.dart';

void main() {
  final repository = FeedRepository(FeedApiService());
  runApp(InstagramSocialApp(feedRepository: repository));
}
