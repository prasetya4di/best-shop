import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/user_form_field.dart';

class AddressFormField extends StatefulWidget {
  final Function(String?)? onSave;

  const AddressFormField({super.key, this.onSave});

  @override
  State<AddressFormField> createState() => _AddressFormField();
}

class _AddressFormField extends State<AddressFormField> {
  @override
  Widget build(BuildContext context) {
    return UserFormField(
      label: S.of(context).textAddress,
      validator: _validateAddress,
      onSave: widget.onSave,
      maxLines: 5,
    );
  }

  String? _validateAddress(String? value) {
    if (value != null && value.isEmpty) {
      return S.of(context).textEmptyAddress;
    } else {
      return null;
    }
  }
}
