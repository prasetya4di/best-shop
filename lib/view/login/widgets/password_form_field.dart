import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_marketplace/generated/assets.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/input_border.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';

class PasswordFormField extends StatefulWidget {
  final Function(String?)? onSave;

  const PasswordFormField({super.key, this.onSave});

  @override
  State<PasswordFormField> createState() => _PasswordFormField();
}

class _PasswordFormField extends State<PasswordFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).textPassword,
            style: Theme.of(context).textTheme.labelMedium),
        const SpaceVertical(),
        TextFormField(
          onSaved: widget.onSave,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isVisible,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: SvgPicture.asset(
                    isVisible ? Assets.imagesIcEye : Assets.imagesIcEyeSlash),
              )),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _validatePassword,
        )
      ],
    );
  }

  String? _validatePassword(String? value) {
    return value!.isEmpty ? S.of(context).textEmptyPassword : null;
  }
}
