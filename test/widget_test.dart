import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_social/app/app.dart';
import 'package:instagram_social/features/feed/data/repositories/feed_repository.dart';
import 'package:instagram_social/features/feed/data/services/feed_api_service.dart';

void main() {
  testWidgets('displays posts loaded by FeedViewModel', (tester) async {
    final repository = FeedRepository(FeedApiService());

    await tester.pumpWidget(InstagramSocialApp(feedRepository: repository));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('minh.nguyen'), findsOneWidget);
    expect(find.text('flutter.daily'), findsOneWidget);
  });
}
