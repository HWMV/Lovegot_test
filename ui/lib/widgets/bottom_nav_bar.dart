
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.chat, color: Colors.black),
          Icon(Icons.calendar_today, color: Colors.black),
          Icon(Icons.person, color: Colors.black),
        ],
      ),
    );
  }
}
