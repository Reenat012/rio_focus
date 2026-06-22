import 'package:flutter/material.dart';

class SessionCounterView extends StatelessWidget {
  const SessionCounterView({
    required this.completedSessionsToday,
    super.key,
  });

  final int completedSessionsToday;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Сессий сегодня: $completedSessionsToday',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}