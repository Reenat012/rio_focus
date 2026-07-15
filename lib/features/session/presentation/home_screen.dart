import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_with_rio/features/session/presentation/widgets/session_counter_view.dart';

import '../../../app/ui_tokens.dart';
import '../application/session_controller.dart';
import '../domain/session_mode.dart';
import '../domain/session_status.dart';
import 'widgets/cat_view.dart';
import 'widgets/cozy_space_view.dart';
import 'widgets/primary_action_button.dart';
import 'widgets/timer_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(sessionControllerProvider);
    final isFocusRunning =
        sessionState.mode == SessionMode.focus &&
        sessionState.status == SessionStatus.running;
    final isFocusPaused =
        sessionState.mode == SessionMode.focus &&
        sessionState.status == SessionStatus.paused;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Уютная зона отвечает только за атмосферу экрана.
            const CozySpaceView(),

            // LayoutBuilder нужен только для базовой адаптивности MVP.
            LayoutBuilder(
              builder: (context, constraints) {
                final isCompactHeight = constraints.maxHeight < 720;

                final horizontalPadding = constraints.maxWidth < 380
                    ? AppSpacing.large
                    : AppSpacing.xLarge;

                final topSpacerFlex = isCompactHeight ? 2 : 3;
                final bottomSpacerFlex = isCompactHeight ? 2 : 3;

                // Отступ между Рио и таймером нужен, чтобы элементы не слипались.
                final catTimerGap = isCompactHeight
                    ? AppSpacing.large
                    : AppSpacing.xLarge;
                final timerButtonGap = isCompactHeight
                    ? AppSpacing.xLarge
                    : AppSpacing.xxLarge;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      Spacer(flex: topSpacerFlex),

                      // Рио теперь имеет собственный компонент.
                      const CatView(),

                      SizedBox(height: catTimerGap),

                      // Таймер пока статичный, но UI уже реагирует на running state.
                      TimerView(
                        timeText: _formatTimeText(
                          endsAt: sessionState.endsAt,
                          pausedRemaining: sessionState.pausedRemaining,
                        ),
                        modeLabel: isFocusPaused
                            ? 'Пауза'
                            : isFocusRunning
                            ? 'Фокус идёт'
                            : 'Фокус',
                        helperText: isFocusPaused
                            ? 'Рио ждёт. Можно продолжить позже.'
                            : isFocusRunning
                            ? 'Рио спит. Ты в рабочей сессии.'
                            : 'Рио рядом. Можно начинать.',
                      ),

                      const SizedBox(height: AppSpacing.small),

                      // Пока это только UI-заготовка без реального состояния сессии.
                      const SessionCounterView(completedSessionsToday: 0),

                      SizedBox(height: timerButtonGap),

                      PrimaryActionButton(
                        text: isFocusPaused
                            ? 'PAUSED'
                            : isFocusRunning
                            ? 'PAUSE'
                            : 'START',
                        onPressed: () {
                          final controller = ref.read(
                            sessionControllerProvider.notifier,
                          );

                          if (isFocusRunning) {
                            controller.pause();
                          } else if (!isFocusPaused) {
                            controller.startFocus();
                          }
                        },
                      ),

                      Spacer(flex: bottomSpacerFlex),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

String _formatTimeText({
  required DateTime? endsAt,
  required Duration? pausedRemaining,
}) {
  if (pausedRemaining != null) {
    return _formatDuration(pausedRemaining);
  }

  if (endsAt == null) {
    return '25:00';
  }

  final remaining = endsAt.difference(DateTime.now());

  return _formatDuration(remaining);
}

String _formatDuration(Duration duration) {
  final totalSeconds = duration.inMilliseconds <= 0
      ? 0
      : (duration.inMilliseconds / 1000).ceil();

  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;

  return '${minutes.toString().padLeft(2, '0')}:'
      '${seconds.toString().padLeft(2, '0')}';
}
