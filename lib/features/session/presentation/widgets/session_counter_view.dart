import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class SessionCounterView extends StatelessWidget {
  const SessionCounterView({
    required this.completedSessionsToday,
    super.key,
  });

  final int completedSessionsToday;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // Счётчик — второстепенный элемент, поэтому подложка очень мягкая.
        color: AppColors.surfaceDark.withValues(alpha: 0.34),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.08),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        child: Text(
          'Сессий сегодня: $completedSessionsToday',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}