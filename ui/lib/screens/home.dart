import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
// import '../widgets/action_card.dart';
import '../screens/modals/request_input_modal.dart';
import 'praise_card_screen.dart';
import 'request_card_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F8),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'LoveGot',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.mail_outline, size: 28, color: Colors.black),
                ],
              ),
            ),

            // Profile Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05), blurRadius: 10),
                ],
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('나❤️그대',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Lv.3',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            // D-Day & Highlight
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('D-99',
                        style: TextStyle(fontSize: 28, color: Colors.white)),
                    SizedBox(height: 8),
                    Text('우리 커플이 함께한 시간 💖',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Action Buttons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ActionCard(
                      icon: Icons.card_giftcard,
                      label: '칭찬 카드',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PraiseCardScreen()))),
                  _ActionCard(
                      icon: Icons.request_page,
                      label: '요청 카드',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RequestCardScreen()))),
                  _ActionCard(
                      icon: Icons.timer,
                      label: '타이머',
                      onTap: () {
                        // TODO: Timer 기능 연결
                      }),
                  _ActionCard(
                      icon: Icons.card_giftcard,
                      label: '요청 카드',
                      onTap: () {
                        showRequestInputModal(context);
                      }),
                ],
              ),
            ),

            const Spacer(),

            // Bottom NavBar
            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionCard({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Icon(icon, size: 28, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
