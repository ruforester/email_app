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
  late Future<List<Message>> messages;

  @override
  void initState() {
    messages = Message.browse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                messages = Message.browse();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: messages,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong.'),
                );
              }
              final messages = snapshot.data;
              return ListView.builder(
                itemCount: messages!.length,
                itemBuilder: (ctx, i) => ListTile(
                  isThreeLine: true,
                  leading: const CircleAvatar(
                    child: Text('A'),
                  ),
                  title: Text(messages![i].subject),
                  subtitle: Text(
                    messages[i].body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
