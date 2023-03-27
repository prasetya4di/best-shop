import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: const EdgeInsets.all(12)),
      child: Text(
        S.of(context).textLogin,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
