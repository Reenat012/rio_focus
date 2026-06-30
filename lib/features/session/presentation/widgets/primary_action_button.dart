import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../app/ui_tokens.dart';

class PrimaryActionButton extends StatefulWidget {
  const PrimaryActionButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  State<PrimaryActionButton> createState() => _PrimaryActionButtonState();
}

class _PrimaryActionButtonState extends State<PrimaryActionButton> {
  bool _isPressed = false;

  void _setPressed(bool value) {
    if (_isPressed == value) return;

    setState(() {
      // Храним только визуальное состояние нажатия.
      // Никакой логики таймера здесь нет.
      _isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapCancel: () => _setPressed(false),
      onTapUp: (_) => _setPressed(false),
      child: AnimatedScale(
        // Мягкий отклик: кнопка слегка “прожимается” под пальцем.
        scale: _isPressed ? 0.98 : 1,
        duration: const Duration(milliseconds: 110),
        curve: Curves.easeOut,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadii.control),
            boxShadow: [
              BoxShadow(
                // Тёплая тень делает START заметным, но не превращает кнопку в неон.
                color: AppColors.accentWarm.withValues(
                  alpha: _isPressed ? 0.18 : 0.32,
                ),
                blurRadius: _isPressed ? 18 : 28,
                offset: Offset(0, _isPressed ? 7 : 12),
              ),
              BoxShadow(
                // Мягкая нижняя тень добавляет глубину без тяжёлого CTA-эффекта.
                color: Colors.black.withValues(
                  alpha: _isPressed ? 0.18 : 0.26,
                ),
                blurRadius: _isPressed ? 16 : 24,
                offset: Offset(0, _isPressed ? 9 : 14),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            height: AppSizes.primaryActionHeight,
            child: ElevatedButton(
              // Пока кнопка только нажимается, но не запускает Pomodoro-сессию.
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentWarm,
                foregroundColor: AppColors.backgroundDark,
                elevation: 0,
                shadowColor: Colors.transparent,
                overlayColor: AppColors.textPrimary.withValues(alpha: 0.10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.control),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xxLarge,
                  vertical: AppSpacing.medium,
                ),
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  // START должен читаться мгновенно: это главное действие экрана.
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.8,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
