import 'package:flutter/material.dart';

import '../../../app/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Временный placeholder котика.
                    // На следующих этапах заменим на отдельный CatView.
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceDark,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '🐈',
                        style: TextStyle(
                          fontSize: 88,
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Временный статичный таймер.
                    // Реальную Pomodoro-логику подключим позже.
                    Text(
                      '25:00',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),

                    const SizedBox(height: 28),

                    // Временная кнопка запуска.
                    // Пока ничего не делает.
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentWarm,
                          foregroundColor: AppColors.backgroundDark,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'START',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Временный счётчик завершённых сессий.
                    // Реальные данные появятся после SessionController.
                    Text(
                      'Сессий сегодня: 0',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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