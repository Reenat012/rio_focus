import 'package:flutter_test/flutter_test.dart';
import 'package:focus_with_rio/app/app.dart';

void main() {
  testWidgets('RioFocusApp starts with home screen skeleton', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(const RioFocusApp());

    expect(find.text('🐈'), findsOneWidget);
    expect(find.text('25:00'), findsOneWidget);
    expect(find.text('START'), findsOneWidget);
    expect(find.text('Сессий сегодня: 0'), findsOneWidget);
  });
}