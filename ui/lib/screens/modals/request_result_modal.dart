import 'package:flutter/material.dart';

Future<void> showRequestResultModal(
    BuildContext context, String userInput, Map<String, dynamic> data) async {
  final List<String> answers = [
    data['Answer1'] ?? '',
    data['Answer2'] ?? '',
    data['Answer3'] ?? '',
  ];

  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("추천 응답을 선택해주세요"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: answers.map((answer) {
          return ListTile(
            title: Text(answer),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("선택된 요청"),
                  content: Text(answer),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("확인"))
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    ),
  );
}
