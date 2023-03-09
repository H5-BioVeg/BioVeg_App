import 'package:flutter/material.dart';

class ShowInfoPopUpDialog extends StatelessWidget {
  const ShowInfoPopUpDialog({
    super.key,
    required this.title,
    required this.content,
  });

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
