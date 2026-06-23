import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class CozySpaceView extends StatelessWidget {
  const CozySpaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Базовый тёплый фон сцены.
        const ColoredBox(
          color: AppColors.backgroundDark,
          child: SizedBox.expand(),
        ),

        // Мягкий общий градиент, чтобы экран не выглядел плоской заливкой.
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2B211D),
                AppColors.backgroundDark,
                Color(0xFF171310),
              ],
            ),
          ),
          child: SizedBox.expand(),
        ),

        // Тёплое свечение лампы в правой верхней части комнаты.
        Positioned(
          top: -120,
          right: -90,
          child: _WarmGlow(
            size: 310,
            opacity: 0.34,
          ),
        ),

        // Более слабое свечение в районе стола.
        Positioned(
          bottom: 110,
          left: -100,
          child: _WarmGlow(
            size: 260,
            opacity: 0.16,
          ),
        ),

        // Декоративное окно на заднем плане.
        const Positioned(
          top: 52,
          left: 28,
          right: 28,
          child: _Window(),
        ),

        // Лампа справа. Пока это простая UI-форма без assets.
        const Positioned(
          top: 88,
          right: 42,
          child: _Lamp(),
        ),

        // Placeholder Рио. Это не CatState и не анимация, а временная визуальная заглушка.
        const Align(
          alignment: Alignment(0, -0.18),
          child: _RioPlaceholder(),
        ),

        // Нижняя поверхность стола, на которой визуально живёт сцена.
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _DeskSurface(),
        ),

        // Небольшая чашка как первое ощущение живого пространства.
        const Positioned(
          left: 42,
          bottom: 74,
          child: _Cup(),
        ),

        // Мягкое размытие поверх фона, чтобы декор не спорил с таймером.
        const _SoftVignette(),
      ],
    );
  }
}

class _RioPlaceholder extends StatelessWidget {
  const _RioPlaceholder();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 152,
        height: 152,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.surfaceDark.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(42),
          border: Border.all(
            color: AppColors.textPrimary.withValues(alpha: 0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: const Text(
          '🐈',
          style: TextStyle(
            fontSize: 82,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _WarmGlow extends StatelessWidget {
  const _WarmGlow({
    required this.size,
    required this.opacity,
  });

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              AppColors.accentWarm.withValues(alpha: opacity),
              AppColors.accentWarm.withValues(alpha: opacity * 0.28),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}

class _Window extends StatelessWidget {
  const _Window();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: 0.34,
        child: Container(
          height: 118,
          decoration: BoxDecoration(
            color: const Color(0xFF151A20),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: AppColors.textSecondary.withValues(alpha: 0.12),
            ),
          ),
          child: Stack(
            children: [
              // Перемычка окна по вертикали.
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 2,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  color: AppColors.textSecondary.withValues(alpha: 0.08),
                ),
              ),

              // Перемычка окна по горизонтали.
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  color: AppColors.textSecondary.withValues(alpha: 0.08),
                ),
              ),

              // Маленькие звёзды за окном.
              const Positioned(
                top: 24,
                left: 34,
                child: _Star(size: 3),
              ),
              const Positioned(
                top: 44,
                right: 48,
                child: _Star(size: 2),
              ),
              const Positioned(
                bottom: 28,
                left: 112,
                child: _Star(size: 2.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withValues(alpha: 0.72),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Lamp extends StatelessWidget {
  const _Lamp();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: 0.78,
        child: Column(
          children: [
            // Абажур лампы.
            Container(
              width: 58,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.accentWarm.withValues(alpha: 0.58),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),

            // Ножка лампы.
            Container(
              width: 6,
              height: 72,
              color: AppColors.accentWarm.withValues(alpha: 0.22),
            ),

            // Основание лампы.
            Container(
              width: 52,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.accentWarm.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeskSurface extends StatelessWidget {
  const _DeskSurface();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.24),
              blurRadius: 28,
              offset: const Offset(0, -12),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cup extends StatelessWidget {
  const _Cup();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: 0.54,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Основная часть чашки.
            Container(
              width: 46,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.textSecondary.withValues(alpha: 0.24),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),

            // Ручка чашки.
            Positioned(
              right: -12,
              top: 8,
              child: Container(
                width: 18,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.textSecondary.withValues(alpha: 0.22),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            // Лёгкий пар над чашкой.
            Positioned(
              top: -20,
              left: 12,
              child: _SteamLine(height: 14),
            ),
            Positioned(
              top: -26,
              left: 26,
              child: _SteamLine(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _SteamLine extends StatelessWidget {
  const _SteamLine({
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.textSecondary.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _SoftVignette extends StatelessWidget {
  const _SoftVignette();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: BackdropFilter(
        // Очень лёгкое размытие: оно делает фон мягче, но не превращает экран в мыло.
        filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.05,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.18),
              ],
            ),
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}