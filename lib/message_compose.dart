import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  const MessageCompose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message compose'),
      ),
      body: const Center(
        child: Text('Message compose'),
      ),
    );
  }
}
