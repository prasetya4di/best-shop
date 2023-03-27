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
