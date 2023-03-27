import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';

class RegisterButton extends StatelessWidget {
  final void Function() onPressed;
  final bool enabled;

  const RegisterButton(
      {super.key, required this.onPressed, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: const EdgeInsets.all(12)),
      child: Text(
        S.of(context).textSignUp,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
