import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_social/app/app.dart';

void main() {
  testWidgets('displays posts loaded by FeedViewModel', (tester) async {
    await tester.pumpWidget(App());
    await tester.pump(const Duration(milliseconds: 300));
  });
}
