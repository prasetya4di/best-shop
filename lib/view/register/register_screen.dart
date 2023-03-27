import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/login/widgets/email_form_field.dart';
import 'package:my_marketplace/view/login/widgets/register_button.dart';
import 'package:my_marketplace/view/register/widgets/address_form_field.dart';
import 'package:my_marketplace/view/register/widgets/birthdate_form_field.dart';
import 'package:my_marketplace/view/register/widgets/name_form_field.dart';
import 'package:my_marketplace/view/register/widgets/passwords_form_field.dart';
import 'package:my_marketplace/view/widgets/image_logo.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  String _name = "";
  String _address = "";
  String _nickname = "";
  DateTime _birthday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(S.of(context).textSignUp,
            style: Theme.of(context).textTheme.labelLarge),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const ImageLogo(),
                  EmailFormField(onSave: (value) {
                    _email = value ?? "";
                  }),
                  const SpaceVertical(),
                  NameFormField(onSave: (value) {
                    _name = value ?? "";
                  }),
                  const SpaceVertical(),
                  AddressFormField(onSave: (value) {
                    _address = value ?? "";
                  }),
                  const SpaceVertical(),
                  BirthdateFormField(
                    onchange: (value) {
                      _birthday = value;
                    },
                  ),
                  const SpaceVertical(),
                  PasswordsFormField(onSave: (value) {
                    _password = value ?? "";
                  }),
                  const SpaceVertical(size: 16),
                  // if (state is RegisterErrorState)
                  //   Alert.danger(text: ""),
                  // if (state is RegisterErrorState)
                  //   const SpaceVertical(size: 16),
                  RegisterButton(onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                    }
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
