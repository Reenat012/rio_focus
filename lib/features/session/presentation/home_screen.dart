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
                        timeText: '25:00',
                        modeLabel: isFocusRunning ? 'Фокус идёт' : 'Фокус',
                        helperText: isFocusRunning
                            ? 'Рио спит. Ты в рабочей сессии.'
                            : 'Рио рядом. Можно начинать.',
                      ),

                      const SizedBox(height: AppSpacing.small),

                      // Пока это только UI-заготовка без реального состояния сессии.
                      const SessionCounterView(completedSessionsToday: 0),

                      SizedBox(height: timerButtonGap),

                      PrimaryActionButton(
                        text: isFocusRunning ? 'FOCUSING' : 'START',
                        // Пока меняем только состояние. Отсчёт появится позже.
                        onPressed: () {
                          ref
                              .read(sessionControllerProvider.notifier)
                              .startFocus();
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
