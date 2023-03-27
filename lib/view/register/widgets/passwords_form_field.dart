import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:my_marketplace/view/widgets/user_form_field.dart';

class PasswordsFormField extends StatefulWidget {
  final Function(String?)? onSave;

  const PasswordsFormField({super.key, this.onSave});

  @override
  State<PasswordsFormField> createState() => _PasswordsFormField();
}

class _PasswordsFormField extends State<PasswordsFormField> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isRepeatPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserFormField(
            suffix: _eyeIcon(isPasswordVisible, (value) {
              setState(() {
                isPasswordVisible = value;
              });
            }),
            onSave: widget.onSave,
            obscureText: !isPasswordVisible,
            label: S.of(context).textPassword,
            controller: _passwordController,
            validator: _validatePassword),
        const SpaceVertical(),
        UserFormField(
            suffix: _eyeIcon(isRepeatPasswordVisible, (value) {
              setState(() {
                isRepeatPasswordVisible = value;
              });
            }),
            obscureText: !isRepeatPasswordVisible,
            label: S.of(context).textRepeatPassword,
            controller: _repeatPasswordController,
            validator: _validateRepeatPassword)
      ],
    );
  }

  Widget _eyeIcon(bool isVisible, Function(bool) onPressed) {
    return IconButton(
      onPressed: () {
        onPressed(!isVisible);
      },
      icon: SvgPicture.asset(
          isVisible ? Assets.imagesIcEye : Assets.imagesIcEyeSlash),
    );
  }

  String? _validatePassword(String? value) {
    final regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (value != null && value.isEmpty) {
      return S.of(context).textEmptyPassword;
    } else if (value!.length < 8) {
      return S.of(context).textPasswordMinimum;
    } else if (!regex.hasMatch(value)) {
      return S.of(context).textPasswordMustContain;
    } else {
      return null;
    }
  }

  String? _validateRepeatPassword(String? value) {
    if (value != null && value.isEmpty) {
      return S.of(context).textEmptyRepeatPassword;
    } else if (value != _passwordController.value.text) {
      return S.of(context).textIncorrectRepeatPassword;
    } else {
      return null;
    }
  }
}
