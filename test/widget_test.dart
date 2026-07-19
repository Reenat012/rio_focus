import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focus_with_rio/app/app.dart';
import 'package:focus_with_rio/features/session/application/session_controller.dart';
import 'package:focus_with_rio/features/session/domain/session_mode.dart';
import 'package:focus_with_rio/features/session/domain/session_status.dart';

void main() {
  testWidgets('START, PAUSE, RESUME and STOP update focus session state', (
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
      expect(find.text('STOP'), findsNothing);

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
      expect(find.text('PAUSE'), findsOneWidget);
      expect(find.text('STOP'), findsOneWidget);

      await tester.tap(find.text('PAUSE'));
      await tester.pump();

      final pausedState = container.read(sessionControllerProvider);

      expect(pausedState.mode, SessionMode.focus);
      expect(pausedState.status, SessionStatus.paused);
      expect(pausedState.startedAt, runningState.startedAt);
      expect(pausedState.endsAt, isNull);
      expect(pausedState.pausedRemaining, isNotNull);

      // Сразу после паузы на экране остаётся почти полная сессия.
      expect(find.text('25:00'), findsOneWidget);
      expect(find.text('Пауза'), findsOneWidget);
      expect(find.text('Рио ждёт. Можно продолжить позже.'), findsOneWidget);
      expect(find.text('RESUME'), findsOneWidget);
      expect(find.text('STOP'), findsOneWidget);

      final pausedRemaining = pausedState.pausedRemaining;

      await tester.tap(find.text('RESUME'));
      await tester.pump();

      final resumedState = container.read(sessionControllerProvider);

      expect(resumedState.mode, SessionMode.focus);
      expect(resumedState.status, SessionStatus.running);
      expect(resumedState.startedAt, runningState.startedAt);
      expect(resumedState.endsAt, isNotNull);
      expect(resumedState.pausedRemaining, isNull);
      expect(pausedRemaining, isNotNull);

      expect(find.text('Фокус идёт'), findsOneWidget);
      expect(find.text('Рио спит. Ты в рабочей сессии.'), findsOneWidget);
      expect(find.text('PAUSE'), findsOneWidget);
      expect(find.text('STOP'), findsOneWidget);

      await tester.tap(find.text('STOP'));
      await tester.pump();

      final stoppedState = container.read(sessionControllerProvider);

      expect(stoppedState.mode, SessionMode.idle);
      expect(stoppedState.status, SessionStatus.stopped);
      expect(stoppedState.startedAt, isNull);
      expect(stoppedState.endsAt, isNull);
      expect(stoppedState.pausedRemaining, isNull);

      expect(find.text('25:00'), findsOneWidget);
      expect(find.text('Фокус'), findsOneWidget);
      expect(find.text('Рио рядом. Можно начинать.'), findsOneWidget);
      expect(find.text('START'), findsOneWidget);
      expect(find.text('STOP'), findsNothing);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      container.dispose();
    }
  });
}
