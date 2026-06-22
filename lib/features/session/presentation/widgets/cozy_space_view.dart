import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

class CozySpaceView extends StatelessWidget {
  const CozySpaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
        color: AppColors.backgroundDark, child: SizedBox.expand(),
    );
  }
}