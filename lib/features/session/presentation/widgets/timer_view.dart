import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../app/ui_tokens.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    required this.timeText,
    this.modeLabel = 'Фокус',
    this.helperText = 'Рио рядом. Можно начинать.',
    super.key,
  });

  final String timeText;
  final String modeLabel;
  final String helperText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        // Чуть больше воздуха под три строки: режим, время и мягкая подпись
        horizontal: AppSpacing.xxxLarge,
        vertical: AppSpacing.large,
      ),
      decoration: BoxDecoration(
        // Мягкая подложка отделяет таймер от фона, но не делает его тяжёлой карточкой.
        color: AppColors.surfaceDark.withValues(alpha: 0.46),
        borderRadius: BorderRadius.circular(AppRadii.panel),
        border: Border.all(
          color: AppColors.textPrimary.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            // Лёгкая тень помогает таймеру читаться на тёплом фоне.
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: AppElevation.softBlur,
            offset: AppElevation.softOffset,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            modeLabel,
            textAlign: TextAlign.center,
            style: const TextStyle(
              // Спокойная подпись задает контекст, но не добавляет реальный SessionMode
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            timeText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              // Время остается главным фунциональным элементом внутри TimerView
              color: AppColors.textPrimary,
              fontSize: 68,
              fontWeight: FontWeight.w800,
              height: 1,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            helperText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              // Второстепенная подпись добавляет уют без давления на пользователя
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
