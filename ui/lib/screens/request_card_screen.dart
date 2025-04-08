
import 'package:flutter/material.dart';
import 'dart:convert';

class RequestCardScreen extends StatefulWidget {
  const RequestCardScreen({super.key});

  @override
  State<RequestCardScreen> createState() => _RequestCardScreenState();
}

class _RequestCardScreenState extends State<RequestCardScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitPraise() {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      final jsonData = jsonEncode({'type': 'request', 'message': message});
      // TODO: send jsonData to backend
      print('Sending JSON: \$jsonData');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("요청 카드 작성")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("요청할 말을 넣어주세요", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ex) 오늘 너무 따뜻하게 대해줘서 고마워!",
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitPraise,
              child: const Text("보내기"),
            )
          ],
        ),
      ),
    );
  }
}
