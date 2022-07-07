import 'package:easy_localization/easy_localization.dart';
import 'package:eip55/eip55.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:recase/recase.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';
import 'dart:developer' as d;

extension StringX on String {
  String get cryptoIcon => CryptoIcons.values.firstWhere(
        (e) =>
            basename(e).toLowerCase().split('.').first.toLowerCase() ==
            toLowerCase(),
        orElse: () => '',
      );

  bool get isJapanese {
    return this == 'ja-JP';
  }

  get log {
    if (kDebugMode) {
      d.log(this);
    }
  }

  String get formatAddress {
    if (isEmpty) {
      return '';
    }
    return '${substring(0, 5)}...${substring(length - 5, length)}';
  }

  String get checkSum => toChecksumAddress(this);

  String get lowerCaseName => basename(this).toLowerCase().split('.').first;

  BedType get bedType {
    switch (this) {
      case Imgs.shortBed:
        return BedType.short;
      case Imgs.middleBed:
        return BedType.middle;
      case Imgs.longBed:
        return BedType.long;
      case Imgs.flexibleBed:
        return BedType.flexible;
      default:
        return BedType.short;
    }
  }

  String get validatePassword {
    if (isEmpty) {
      return LocaleKeys.this_field_is_required.tr();
    }
    if (length < 6 || length > 20) {
      return LocaleKeys.password_must_be_at_least_6.tr();
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    var result = regExp.hasMatch(this);
    if (!result) {
      return LocaleKeys.password_must_be_at_least_6.tr();
    }
    if (contains(' ')) {
      return LocaleKeys.dont_allow_typing_space.tr();
    }

    return '';
  }

  String get validateEmail {
    if (isEmpty) {
      return LocaleKeys.this_field_is_required.tr();
    }

    bool result = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
    'result match email  $result'.log;
    if (!result) {
      return LocaleKeys.invalid_email.tr();
    }
    return '';
  }

  String get validateOTP {
    if (isEmpty) {
      return LocaleKeys.this_field_is_required.tr();
    }
    if (length < 6) {
      return LocaleKeys.invalid_code.tr();
    }
    try {
      int.parse(this);
    } catch (_) {
      return LocaleKeys.invalid_code.tr();
    }
    return '';
  }

  String reCase(StringCase? stringCase) {
    final ReCase rc = ReCase(this.tr());
    switch (stringCase) {
      case StringCase.camelCase:
        return rc.camelCase;
      case StringCase.pascalCase:
        return rc.pascalCase;
      case StringCase.snakeCase:
        return rc.snakeCase;
      case StringCase.titleCase:
        return rc.titleCase;
      case StringCase.upperCase:
        return toUpperCase();
      case StringCase.lowerCaseCase:
        return toLowerCase();
      case null:
        return this;
    }
  }
}

enum StringCase {
  upperCase,
  lowerCaseCase,
  camelCase,
  pascalCase,
  snakeCase,
  titleCase,
}
