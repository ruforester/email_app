import 'package:email_app/message_list.dart';

class Message {
  final String subject;
  final String body;

  Message({
    required this.subject,
    required this.body,
  });

  Message.fromJson(Map<String, dynamic> json)
      : subject = json['title'],
        body = json['body'];

  static Future<List<Message>> browse() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    final collection = response.data;

    final List<Message> messages =
        collection.map<Message>((e) => Message.fromJson(e)).toList();

    return messages;
  }
}
