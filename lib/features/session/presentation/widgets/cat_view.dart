import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        width: 204,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 176,
              height: 176,
              decoration: BoxDecoration(
                // Тёплая подложка делает место Рио частью вечерней сцены.
                color: AppColors.surfaceDark.withValues(alpha: 0.86),
                borderRadius: BorderRadius.circular(52),
                border: Border.all(
                  // Мягкая граница отделяет место Рио от фона без лишнего контраста.
                  color: AppColors.accentWarm.withValues(alpha: 0.20),
                ),
                boxShadow: [
                  BoxShadow(
                    // Основная тень визуально ставит карточку на поверхность сцены.
                    color: Colors.black.withValues(alpha: 0.28),
                    blurRadius: 28,
                    offset: const Offset(0, 16),
                  ),
                  BoxShadow(
                    // Тёплое свечение связывает Рио с общей атмосферой приложения.
                    color: AppColors.accentWarm.withValues(alpha: 0.16),
                    blurRadius: 42,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Внутреннее мягкое пятно добавляет глубину, но не спорит с котиком.
                  Container(
                    width: 126,
                    height: 126,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.backgroundDark.withValues(alpha: 0.34),
                    ),
                  ),

                  // Временный fallback-котик.
                  // Позже здесь появится полноценный визуал Рио.
                  const Text(
                    '🐈',
                    style: TextStyle(
                      fontSize: 88,
                      height: 1,
                    ),
                  ),

                  // Небольшая тень внутри карточки, чтобы котик не висел в воздухе.
                  Positioned(
                    bottom: 34,
                    child: Container(
                      width: 88,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Рио здесь',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                // Подпись тихая: добавляет эмоцию, но не превращает экран в onboarding.
                color: AppColors.textSecondary.withValues(alpha: 0.82),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}