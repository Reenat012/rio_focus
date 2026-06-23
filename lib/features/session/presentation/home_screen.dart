import 'package:flutter/material.dart';

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
            // Уютная зона отвечает за атмосферу экрана и placeholder Рио.
            const CozySpaceView(),

            // LayoutBuilder нужен только для базовой адаптивности MVP.
            LayoutBuilder(
              builder: (context, constraints) {
                final isCompactHeight = constraints.maxHeight < 720;

                final horizontalPadding = constraints.maxWidth < 380
                    ? 20.0
                    : 24.0;

                final topSpacerFlex = isCompactHeight ? 3 : 4;
                final bottomSpacerFlex = isCompactHeight ? 2 : 3;
                final timerButtonGap = isCompactHeight ? 22.0 : 28.0;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Spacer(flex: topSpacerFlex),

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