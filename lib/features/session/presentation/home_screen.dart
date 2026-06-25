import 'package:flutter/material.dart';

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
                    ? 20.0
                    : 24.0;

                final topSpacerFlex = isCompactHeight ? 2 : 3;
                final bottomSpacerFlex = isCompactHeight ? 2 : 3;

                // Отступ между Рио и таймером нужен, чтобы элементы не слипались.
                final catTimerGap = isCompactHeight ? 18.0 : 24.0;
                final timerButtonGap = isCompactHeight ? 22.0 : 28.0;

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