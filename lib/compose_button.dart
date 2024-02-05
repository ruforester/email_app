import 'package:email_app/message_compose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  const ComposeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final messenger = ScaffoldMessenger.of(context);
        String intention = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MessageCompose(),
          ),
        );
        messenger.showSnackBar(
          SnackBar(
            content: Text('Intention: $intention'),
          ),
        );
      },
    );
  }
}
