import 'package:flutter/material.dart';
import 'package:ui/widgets/bottom_nav_bar.dart';
import 'screens/home.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const LoveGottApp());
}

class LoveGottApp extends StatelessWidget {
  const LoveGottApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoveGott UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard', //
        scaffoldBackgroundColor: const Color(0xFFFFF8F8),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
