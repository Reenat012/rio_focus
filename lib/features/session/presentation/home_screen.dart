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
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CatView(),

                    const SizedBox(height: 36),

                    const TimerView(timeText: '25:00'),

                    const SizedBox(height: 28),

                    PrimaryActionButton(
                      text: 'START',
                      onPressed: () {},
                    ),

                    const SizedBox(height: 20),

                    const SessionCounterView(completedSessionsToday: 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}