import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focus_with_rio/app/app.dart';
import 'package:focus_with_rio/features/session/application/session_controller.dart';
import 'package:focus_with_rio/features/session/domain/session_mode.dart';
import 'package:focus_with_rio/features/session/domain/session_status.dart';

void main() {
  testWidgets('START changes session state to running focus', (
    WidgetTester tester,
  ) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

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

    expect(container.read(sessionControllerProvider).mode, SessionMode.focus);
    expect(
      container.read(sessionControllerProvider).status,
      SessionStatus.running,
    );
  });
}
