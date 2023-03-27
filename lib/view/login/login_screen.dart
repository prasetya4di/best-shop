import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/login/viewmodel/login_state.dart';
import 'package:my_marketplace/view/login/viewmodel/login_viewmodel.dart';
import 'package:my_marketplace/view/login/widgets/button_separator.dart';
import 'package:my_marketplace/view/login/widgets/email_form_field.dart';
import 'package:my_marketplace/view/login/widgets/login_button.dart';
import 'package:my_marketplace/view/login/widgets/password_form_field.dart';
import 'package:my_marketplace/view/login/widgets/register_button.dart';
import 'package:my_marketplace/view/widgets/alert.dart';
import 'package:my_marketplace/view/widgets/image_logo.dart';
import 'package:provider/provider.dart';

import '../widgets/space_vertical.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late LoginViewModel viewModel;
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    viewModel = context.read<LoginViewModel>();
  }

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
                  if (context.watch<LoginViewModel>().loginState
                      is LoginStateError)
                    Alert.danger(text: S.of(context).textWrongPassword),
                  const SpaceVertical(size: 16),
                  LoginButton(onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      viewModel.login(_email, _password);
                    }
                  }),
                  const SpaceVertical(),
                  const ButtonSeparator(),
                  const SpaceVertical(),
                  RegisterButton(onPressed: () {
                    context.push(Routes.register);
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
