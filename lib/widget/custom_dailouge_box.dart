import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;
  final bool isLoading;

  CustomDialog({
    required this.title,
    required this.message,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 120,
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              ),
      ),
      actions: [
        if (!isLoading)
          TextButton(
            onPressed: onPressed,
            child: const Text('OK'),
          ),
      ],
    );
  }
}
