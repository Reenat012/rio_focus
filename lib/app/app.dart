import 'package:flutter/material.dart';

import '../features/session/presentation/home_screen.dart';
import 'theme.dart';

class RioFocusApp extends StatelessWidget {
  const RioFocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рио Фокус',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomeScreen(),
    );
  }
}