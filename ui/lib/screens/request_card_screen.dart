import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestCardScreen extends StatefulWidget {
  const RequestCardScreen({super.key});

  @override
  State<RequestCardScreen> createState() => _RequestCardScreenState();
}

class _RequestCardScreenState extends State<RequestCardScreen> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _submitRequest() async {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      final jsonData = {'user_input': message}; // ✅ 백엔드 요구 구조 맞춤

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/generate'), // ← 여기에 실제 서버 주소 입력
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("응답 데이터: \$data"); // 필요 시 응답 결과 사용
        Navigator.pop(context);
      } else {
        print("❌ 실패: \${response.statusCode}");
      }
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
                hintText: "ex) 치약 좀 가운데부터 짜지마!",
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitRequest,
              child: const Text("보내기"),
            )
          ],
        ),
      ),
    );
  }
}
