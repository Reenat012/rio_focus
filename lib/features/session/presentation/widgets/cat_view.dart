import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}