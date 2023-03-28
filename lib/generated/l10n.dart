// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Best Shop`
  String get titleWalkthrough1 {
    return Intl.message(
      'Best Shop',
      name: 'titleWalkthrough1',
      desc: '',
      args: [],
    );
  }

  /// `Safe`
  String get titleWalkthrough2 {
    return Intl.message(
      'Safe',
      name: 'titleWalkthrough2',
      desc: '',
      args: [],
    );
  }

  /// `Fast Delivery`
  String get titleWalkthrough3 {
    return Intl.message(
      'Fast Delivery',
      name: 'titleWalkthrough3',
      desc: '',
      args: [],
    );
  }

  /// `Easy Payment`
  String get titleWalkthrough4 {
    return Intl.message(
      'Easy Payment',
      name: 'titleWalkthrough4',
      desc: '',
      args: [],
    );
  }

  /// `Best shop, the best application for your daily shopping need, we have almost everything here, and you can order from wherever you are`
  String get descWalkthrough1 {
    return Intl.message(
      'Best shop, the best application for your daily shopping need, we have almost everything here, and you can order from wherever you are',
      name: 'descWalkthrough1',
      desc: '',
      args: [],
    );
  }

  /// `We care about your privacy, we secure every transaction, your data, and anything we have, we always encrypt it.`
  String get descWalkthrough2 {
    return Intl.message(
      'We care about your privacy, we secure every transaction, your data, and anything we have, we always encrypt it.',
      name: 'descWalkthrough2',
      desc: '',
      args: [],
    );
  }

  /// `Order today, arrive tomorrow, we receive your order today, and we proceed today.`
  String get descWalkthrough3 {
    return Intl.message(
      'Order today, arrive tomorrow, we receive your order today, and we proceed today.',
      name: 'descWalkthrough3',
      desc: '',
      args: [],
    );
  }

  /// `Pay with any payment method you have, transfer bank, e-wallet, credit card, or paylater ? we accept all payment way.`
  String get descWalkthrough4 {
    return Intl.message(
      'Pay with any payment method you have, transfer bank, e-wallet, credit card, or paylater ? we accept all payment way.',
      name: 'descWalkthrough4',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get textNext {
    return Intl.message(
      'Next',
      name: 'textNext',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get textDone {
    return Intl.message(
      'Done',
      name: 'textDone',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get textSkip {
    return Intl.message(
      'Skip',
      name: 'textSkip',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get textOr {
    return Intl.message(
      'Or',
      name: 'textOr',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get textLogin {
    return Intl.message(
      'Login',
      name: 'textLogin',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get textSignUp {
    return Intl.message(
      'Register',
      name: 'textSignUp',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get textEmail {
    return Intl.message(
      'E-mail',
      name: 'textEmail',
      desc: '',
      args: [],
    );
  }

  /// `Search ...`
  String get textSearch {
    return Intl.message(
      'Search ...',
      name: 'textSearch',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get textName {
    return Intl.message(
      'Name',
      name: 'textName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get textAddress {
    return Intl.message(
      'Address',
      name: 'textAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get textPassword {
    return Intl.message(
      'Password',
      name: 'textPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get textRepeatPassword {
    return Intl.message(
      'Repeat Password',
      name: 'textRepeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Birth-date`
  String get textBirthday {
    return Intl.message(
      'Birth-date',
      name: 'textBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email.`
  String get textEmptyEmail {
    return Intl.message(
      'Please enter a valid email.',
      name: 'textEmptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get textEmptyName {
    return Intl.message(
      'Please enter your name',
      name: 'textEmptyName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your address`
  String get textEmptyAddress {
    return Intl.message(
      'Please enter your address',
      name: 'textEmptyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password.`
  String get textEmptyPassword {
    return Intl.message(
      'Please enter a valid password.',
      name: 'textEmptyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least 8 characters`
  String get textPasswordMinimum {
    return Intl.message(
      'Please enter at least 8 characters',
      name: 'textPasswordMinimum',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase, \nlowercase, number, and a special character.`
  String get textPasswordMustContain {
    return Intl.message(
      'Password must contain at least one uppercase, \nlowercase, number, and a special character.',
      name: 'textPasswordMustContain',
      desc: '',
      args: [],
    );
  }

  /// `Please repeat your password.`
  String get textEmptyRepeatPassword {
    return Intl.message(
      'Please repeat your password.',
      name: 'textEmptyRepeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match.`
  String get textIncorrectRepeatPassword {
    return Intl.message(
      'Password does not match.',
      name: 'textIncorrectRepeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid birth-date`
  String get textEmptyBirthday {
    return Intl.message(
      'Please enter a valid birth-date',
      name: 'textEmptyBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Your password/e-mail is incorrect, please try again`
  String get textWrongPassword {
    return Intl.message(
      'Your password/e-mail is incorrect, please try again',
      name: 'textWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `E-mail is registered, please try another e-mail`
  String get textFailedRegister {
    return Intl.message(
      'E-mail is registered, please try another e-mail',
      name: 'textFailedRegister',
      desc: '',
      args: [],
    );
  }

  /// `Loading ...`
  String get textLoading {
    return Intl.message(
      'Loading ...',
      name: 'textLoading',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get textLogout {
    return Intl.message(
      'Logout',
      name: 'textLogout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout from this account ?`
  String get textLogoutConfirmation {
    return Intl.message(
      'Are you sure you want to logout from this account ?',
      name: 'textLogoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get textYes {
    return Intl.message(
      'Yes',
      name: 'textYes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get textNo {
    return Intl.message(
      'No',
      name: 'textNo',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get textConfirmation {
    return Intl.message(
      'Confirmation',
      name: 'textConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get textCategory {
    return Intl.message(
      'Category',
      name: 'textCategory',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get textProduct {
    return Intl.message(
      'Product',
      name: 'textProduct',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Oooppss, the product you are looking for is currently unavailable. Please try again later, or try another keywords :)`
  String get emptySearch {
    return Intl.message(
      'Oooppss, the product you are looking for is currently unavailable. Please try again later, or try another keywords :)',
      name: 'emptySearch',
      desc: '',
      args: [],
    );
  }

  /// `Product added to shopping cart`
  String get addedToShoppingCart {
    return Intl.message(
      'Product added to shopping cart',
      name: 'addedToShoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
