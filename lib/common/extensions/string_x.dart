import 'dart:ui';
import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';
import 'package:eip55/eip55.dart';
import 'package:path/path.dart';
import 'package:recase/recase.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

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

  // get log {
  //   if (kDebugMode) {
  //     d.log(this);
  //   }
  // }

  String get formatAddress {
    if (isEmpty || length < 10) {
      return this;
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

    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9]).{6,}$';
    RegExp regExp = RegExp(pattern);
    final result = regExp.hasMatch(this);
    if (!result) {
      return LocaleKeys.password_must_be_at_least_6.tr();
    }
    if (contains(' ')) {
      return LocaleKeys.dont_allow_typing_space.tr();
    }

    return '';
  }

  String get validateEmail {
    if (trim().isEmpty) {
      return LocaleKeys.this_field_is_required.tr();
    }

    bool result = RegExp(r"^[\w-\!#$%&'*+-/=?^_`{|}~]+@([\w-]+\.)+[\w-]{1,10}$")
        .hasMatch(trim());
    if (!result) {
      return LocaleKeys.incorrect_email.tr();
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

  String bedBoxAnimation() {
    switch (this) {
      case "1":
        return Const.blackBedBoxAnimation;
      case "2":
        return Const.blueBedBoxAnimation;
      case "3":
        return Const.greenBedBoxAnimation;
      case "4":
        return Const.orangeBedBoxAnimation;
      case "5":
        return Const.purpleBedBoxAnimation;
      default:
        return Const.greenBedBoxAnimation;
    }
  }

  String luckyBoxAnimation() {
    switch (this) {
      case "1":
        return Const.blackLuckyBoxAnimation;
      case "2":
        return Const.blueLuckyBoxAnimation;
      case "3":
        return Const.greenLuckyBoxAnimation;
      case "4":
        return Const.orangeLuckyBoxAnimation;
      case "5":
        return Const.purpleLuckyBoxAnimation;
      default:
        return Const.greenLuckyBoxAnimation;
    }
  }

  Color get qualityBedTopLeftColor {
    switch (toLowerCase()) {
      case 'uncommon':
        return AppColors.uncommonBedTopLeft;
      case 'rare':
        return AppColors.rareBedTopLeft;
      case 'epic':
        return AppColors.epicBedTopLeft;
      case 'legendary':
        return AppColors.legendaryBedTopLeft;
      case 'special':
        return AppColors.white;
      case 'efficiency':
        return AppColors.red;
      case 'luck':
        return AppColors.blue;
      case 'resilience':
        return AppColors.purple;
      case 'ruby':
        return AppColors.red;
      case 'amethyst':
        return AppColors.purple;
      case 'sapphire':
        return AppColors.blue;
      case 'emerald':
        return AppColors.green;
      case 'diamond':
        return AppColors.white;
      case 'blue':
        return AppColors.blue;
      case 'purple':
        return AppColors.purple;
      case 'red':
        return AppColors.red;
      case 'white':
        return AppColors.white;
    }
    return AppColors.uncommonBedTopLeft;
  }

  Color get qualityBedColor {
    switch (toLowerCase()) {
      case 'uncommon':
        return AppColors.uncommonBed;
      case 'rare':
        return AppColors.rareBed;
      case 'epic':
        return AppColors.epicBed;
      case 'legendary':
        return AppColors.legendaryBed;
      case 'special':
        return AppColors.white;
      case 'efficiency':
        return AppColors.red;
      case 'luck':
        return AppColors.blue;
      case 'resilience':
        return AppColors.purple;
      case 'ruby':
        return AppColors.red;
      case 'amethyst':
        return AppColors.purple;
      case 'sapphire':
        return AppColors.blue;
      case 'emerald':
        return AppColors.green;
      case 'diamond':
        return AppColors.white;
      case 'blue':
        return AppColors.blue;
      case 'purple':
        return AppColors.purple;
      case 'red':
        return AppColors.red;
      case 'white':
        return AppColors.white;
    }
    return AppColors.commonBed;
  }

  String remainingTime(String levelUpTime) {
    final timeOpen = DateTime.fromMillisecondsSinceEpoch(int.parse(this));
    if (timeOpen.isBefore(DateTime.now())) {
      return '';
    }
    final startTime =
        math.max(int.parse(levelUpTime), DateTime.now().millisecondsSinceEpoch);

    final duration =
        timeOpen.difference(DateTime.fromMillisecondsSinceEpoch(startTime));
    final hour = (duration.inHours).toString().padLeft(2, '0');
    final minute = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$hour:$minute:$second';
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
