import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/user_form_field.dart';

class NameFormField extends StatefulWidget {
  final Function(String?)? onSave;

  const NameFormField({super.key, this.onSave});

  @override
  State<NameFormField> createState() => _NameFormField();
}

class _NameFormField extends State<NameFormField> {
  @override
  Widget build(BuildContext context) {
    return UserFormField(
      label: S.of(context).textName,
      validator: _validateName,
      onSave: widget.onSave,
    );
  }

  String? _validateName(String? value) {
    if (value != null && value.isEmpty) {
      return S.of(context).textEmptyName;
    } else {
      return null;
    }
  }
}
