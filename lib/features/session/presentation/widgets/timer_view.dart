import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    required this.timeText,
    super.key,
  });

  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        // Мягкая подложка отделяет таймер от фона, но не делает его тяжёлой карточкой.
        color: AppColors.surfaceDark.withValues(alpha: 0.46),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.textPrimary.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            // Лёгкая тень помогает таймеру читаться на тёплом фоне.
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Text(
        timeText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 64,
          fontWeight: FontWeight.w800,
          height: 1,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}