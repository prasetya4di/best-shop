import 'package:flutter/material.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';

import 'input_border.dart';

class UserFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Function(String?)? onSave;
  final String? Function(String?) validator;
  final void Function()? onTap;
  final TextInputType inputType;
  final Widget? suffix;
  final TextEditingController? controller;

  const UserFormField(
      {super.key,
      required this.label,
      required this.validator,
      this.readOnly = false,
      this.inputType = TextInputType.text,
      this.suffix,
      this.obscureText = false,
      this.controller,
      this.enabled = true,
      this.onTap,
      this.onSave});

  @override
  State<UserFormField> createState() => _UserFormField();
}

class _UserFormField extends State<UserFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.labelMedium),
        const SpaceVertical(),
        TextFormField(
          onSaved: widget.onSave,
          onTap: widget.onTap,
          controller: widget.controller,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          keyboardType: widget.inputType,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              disabledBorder: defaultInputBorder,
              suffixIcon: widget.suffix),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
        )
      ],
    );
  }
}
