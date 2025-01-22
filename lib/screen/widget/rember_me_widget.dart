import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool remeberMe;
  final ValueChanged<bool?> onRememberMeChanged;
  final VoidCallback onForgetPassword;
  const RememberMeRow(
      {super.key,
      required this.remeberMe,
      required this.onRememberMeChanged,
      required this.onForgetPassword});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: remeberMe, onChanged: onRememberMeChanged),
        const Text('Keep Sign In'),
        Spacer(),
        InkWell(
          onTap: onForgetPassword,
          child: const Text(
            'Forget Password?',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
