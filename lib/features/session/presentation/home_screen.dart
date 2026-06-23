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

                final topSpacerFlex = isCompactHeight ? 2 : 3;
                final bottomSpacerFlex = isCompactHeight ? 2 : 3;

                // Отступ между Рио и таймером нужен, чтобы карточки не слипались.
                final catTimerGap = isCompactHeight ? 18.0 : 24.0;
                final timerButtonGap = isCompactHeight ? 22.0 : 28.0;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Spacer(flex: topSpacerFlex),

                      // Рио находится в основной композиции экрана,
                      // поэтому таймер больше не может налезть на котика.
                      const _RioPlaceholder(),

                      SizedBox(height: catTimerGap),

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

class _RioPlaceholder extends StatelessWidget {
  const _RioPlaceholder();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 132,
        height: 132,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // Карточка Рио остаётся тёплой и мягкой, но теперь она компактнее.
          color: const Color(0xFF2B2420).withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(38),
          border: Border.all(
            color: const Color(0xFFF5E9D7).withValues(alpha: 0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const Text(
          '🐈',
          style: TextStyle(
            fontSize: 72,
            height: 1,
          ),
        ),
      ),
    );
  }
}