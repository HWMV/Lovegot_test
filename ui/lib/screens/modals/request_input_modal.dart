import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //show jsonDecode, utf8, jsonEncode;
import 'request_result_modal.dart';

Future<void> showRequestInputModal(BuildContext context) async {
  final controller = TextEditingController();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("요청할 말을 넣어주세요", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ex) 오늘은 내가 먼저 연락하고 싶어!",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final input = controller.text.trim();
                if (input.isEmpty) return;

                final res = await http.post(
                  Uri.parse('http://127.0.0.1:8000/generate'),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode({'user_input': input}),
                );

                if (res.statusCode == 200) {
                  final data = jsonDecode(utf8.decode(res.bodyBytes));
                  Navigator.pop(context);
                  showRequestResultModal(context, input, data);
                }
              },
              child: const Text("보내기"),
            )
          ],
        ),
      );
    },
  );
}
