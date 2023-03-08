import 'package:flutter/material.dart';

class DeletePopUpDialog extends StatelessWidget {
  const DeletePopUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Slet Drivhus?"),
      content: const Text(
          "Vil du gerne slette dette drivhus.\nDu vil ikke kunne se informationer om drivhuset, før du har tilføjet det igen."),
      actions: [
        TextButton(
          onPressed: (() {
            Navigator.pop(context, false);
          }),
          child: const Text("Anuller"),
        ),
        TextButton(
          onPressed: (() {
            Navigator.pop(context, true);
          }),
          child: const Text("Slet"),
        ),
      ],
    );
  }
}
