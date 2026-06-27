import 'package:flutter_test/flutter_test.dart';
import 'package:focus_with_rio/app/app.dart';

void main() {
  testWidgets('RioFocusApp starts with main screen structure', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RioFocusApp());

    // Проверяем placeholder Рио внутри уютной зоны.
    expect(find.text('🐈'), findsOneWidget);

    // Таймер пока статичный: настоящего отсчёта в этой фиче нет.
    expect(find.text('25:00'), findsOneWidget);

    // Кнопка есть, но пока не запускает настоящую сессию.
    expect(find.text('START'), findsOneWidget);

    // На этом этапе счетчик остается статичной UI-заготовкой
    expect(find.text('Сессий сегодня: 0'), findsOneWidget);
  });
}
