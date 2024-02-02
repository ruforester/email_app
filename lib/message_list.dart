import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:email_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final dio = Dio();

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
  List<Message> messages = [];

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  Future loadMessageList() async {
    // final content = await rootBundle.loadString('data/messages.json');
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    print(response.data);
    final collection = response.data;

    final loadedMessages = collection.map((e) => Message.fromJson(e)).toList();

    // final loadedMessages = [
    //   for (final item in collection)
    //     Message(subject: item['subject'], body: item['body'])
    // ];

    setState(() {
      messages = loadedMessages;
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
          title: Text(messages[i].subject),
          subtitle: Text(
            messages[i].body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
