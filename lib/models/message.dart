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
}
