import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String body;

  const MessageDetail({
    super.key,
    required this.subject,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Text(body),
      ),
    );
  }
}
