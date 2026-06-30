import 'package:flutter/material.dart';
import 'package:focus_with_rio/features/session/presentation/widgets/session_counter_view.dart';

import '../../../app/ui_tokens.dart';
import 'widgets/cat_view.dart';
import 'widgets/cozy_space_view.dart';
import 'widgets/primary_action_button.dart';
import 'widgets/timer_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Spacer(flex: topSpacerFlex),

                      // Рио теперь имеет собственный компонент.
                      const CatView(),

                      SizedBox(height: catTimerGap),

                      // Пока таймер остаётся статичным.
                      const TimerView(timeText: '25:00'),

                      const SizedBox(height: AppSpacing.small),

                      // Пока это только UI-заготовка без реального состояния сессии.
                      const SessionCounterView(
                        completedSessionsToday: 0,
                      ),

                      SizedBox(height: timerButtonGap),

                      PrimaryActionButton(
                        text: 'START',
                        // В рамках MVP кнопка только нажимается, но не запускает таймер.
                        onPressed: () {},
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
