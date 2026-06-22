import 'package:flutter/material.dart';

import 'widgets/cat_view.dart';
import 'widgets/cozy_space_view.dart';
import 'widgets/primary_action_button.dart';
import 'widgets/session_counter_view.dart';
import 'widgets/timer_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CozySpaceView(),

            // LayoutBuilder нужен, чтобы аккуратно менять отступы
            // на маленьких и высоких экранах без скролла.
            LayoutBuilder(
              builder: (context, constraints) {
                final isCompactHeight = constraints.maxHeight < 720;

                final horizontalPadding = constraints.maxWidth < 380
                    ? 20.0
                    : 24.0;

                final catTimerGap = isCompactHeight ? 24.0 : 36.0;
                final timerButtonGap = isCompactHeight ? 22.0 : 28.0;
                final buttonCounterGap = isCompactHeight ? 14.0 : 20.0;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      const Spacer(),

                      const CatView(),

                      SizedBox(height: catTimerGap),

                      const TimerView(timeText: '25:00'),

                      SizedBox(height: timerButtonGap),

                      PrimaryActionButton(
                        text: 'START',
                        onPressed: () {},
                      ),

                      SizedBox(height: buttonCounterGap),

                      const SessionCounterView(
                        completedSessionsToday: 0,
                      ),

                      // Нижний Spacer чуть меньше верхнего, чтобы композиция
                      // визуально стояла ближе к рабочему столу, а не висела в воздухе.
                      const Spacer(flex: 2),
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