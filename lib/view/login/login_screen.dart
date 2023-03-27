import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/login/widgets/button_separator.dart';
import 'package:my_marketplace/view/login/widgets/email_form_field.dart';
import 'package:my_marketplace/view/login/widgets/login_button.dart';
import 'package:my_marketplace/view/login/widgets/password_form_field.dart';
import 'package:my_marketplace/view/login/widgets/register_button.dart';
import 'package:my_marketplace/view/widgets/image_logo.dart';

import '../widgets/space_vertical.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const ImageLogo(),
                  const SpaceVertical(),
                  EmailFormField(onSave: (value) {
                    _email = value ?? "";
                  }),
                  const SpaceVertical(size: 16),
                  PasswordFormField(onSave: (value) {
                    _password = value ?? "";
                  }),
                  const SpaceVertical(size: 16),
                  // if (state is LoginErrorState)
                  //   Alert.danger(text: state.message),
                  const SpaceVertical(size: 16),
                  LoginButton(onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                    }
                  }),
                  const SpaceVertical(),
                  const ButtonSeparator(),
                  const SpaceVertical(),
                  RegisterButton(onPressed: () {
                    context.go(Routes.register);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
