import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 184,
      height: 184,
      decoration: BoxDecoration(
        // Мягкая тёплая подложка, чтобы котик был частью сцены, а не случайным emoji.
        color: AppColors.surfaceDark.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(48),
        border: Border.all(
          color: AppColors.accentWarm.withValues(alpha: 0.16),
        ),
        boxShadow: [
          BoxShadow(
            // Тень под котиком визуально ставит его на поверхность сцены.
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            // Лёгкое тёплое свечение связывает котика с общей атмосферой.
            color: AppColors.accentWarm.withValues(alpha: 0.12),
            blurRadius: 34,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Внутреннее мягкое пятно делает подложку менее плоской.
          Container(
            width: 132,
            height: 132,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundDark.withValues(alpha: 0.36),
            ),
          ),

          // Временный fallback-котик.
          // Позже заменим на PNG/WebP, Rive или Lottie, но экран уже не зависит от assets.
          const Text(
            '🐈',
            style: TextStyle(
              fontSize: 92,
              height: 1,
            ),
          ),

          // Небольшая "тень" внутри карточки, чтобы котик не висел в воздухе.
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
    );
  }
}