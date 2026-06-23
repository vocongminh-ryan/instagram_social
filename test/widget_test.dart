import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_social/app/app.dart';
import 'package:instagram_social/features/feed/data/datasources/feed_local_data_source.dart';
import 'package:instagram_social/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:instagram_social/features/feed/domain/usecases/get_feed.dart';

void main() {
  testWidgets('displays posts loaded by FeedCubit', (tester) async {
    final getFeed = GetFeed(FeedRepositoryImpl(FeedLocalDataSource()));

    await tester.pumpWidget(InstagramSocialApp(getFeed: getFeed));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('minh.nguyen'), findsOneWidget);
    expect(find.text('flutter.daily'), findsOneWidget);
  });
}
