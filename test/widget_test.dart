import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focus_with_rio/app/app.dart';
import 'package:focus_with_rio/features/session/application/session_controller.dart';
import 'package:focus_with_rio/features/session/domain/session_mode.dart';
import 'package:focus_with_rio/features/session/domain/session_status.dart';

void main() {
  testWidgets('START shows static running focus UI', (
    WidgetTester tester,
  ) async {
    final container = ProviderContainer();

    try {
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const RioFocusApp(),
        ),
      );

      expect(find.text('🐈'), findsOneWidget);
      expect(find.text('25:00'), findsOneWidget);
      expect(find.text('START'), findsOneWidget);
      expect(find.text('Сессий сегодня: 0'), findsOneWidget);

      expect(container.read(sessionControllerProvider).mode, SessionMode.idle);
      expect(
        container.read(sessionControllerProvider).status,
        SessionStatus.stopped,
      );

      await tester.tap(find.text('START'));
      await tester.pump();

      final runningState = container.read(sessionControllerProvider);

      expect(runningState.mode, SessionMode.focus);
      expect(runningState.status, SessionStatus.running);
      expect(runningState.startedAt, isNotNull);
      expect(runningState.endsAt, isNotNull);
      expect(
        runningState.endsAt!.difference(runningState.startedAt!),
        const Duration(minutes: 25),
      );

      // На старте сессии таймер показывает полные 25 минут.
      expect(find.text('25:00'), findsOneWidget);
      expect(find.text('Фокус идёт'), findsOneWidget);
      expect(find.text('Рио спит. Ты в рабочей сессии.'), findsOneWidget);
      expect(find.text('FOCUSING'), findsOneWidget);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      container.dispose();
    }
  });
}
