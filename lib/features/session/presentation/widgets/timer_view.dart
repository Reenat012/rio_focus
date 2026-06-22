import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    required this.timeText,
    super.key,
  });

  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      timeText,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}