import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  const MessageList({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = [];

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  Future loadMessageList() async {
    final content = await rootBundle.loadString('data/messages.json');
    final collection = jsonDecode(content);

    setState(() {
      messages = collection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (ctx, i) => ListTile(
          isThreeLine: true,
          leading: const CircleAvatar(
            child: Text('A'),
          ),
          title: Text(messages[i]['subject']!),
          subtitle: Text(
            messages[i]['body']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
