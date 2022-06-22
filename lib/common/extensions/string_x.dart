import 'package:easy_localization/easy_localization.dart';
import 'package:eip55/eip55.dart';
import 'package:path/path.dart';
import 'package:recase/recase.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/resources/resources.dart';

extension StringX on String {
  String get cryptoIcon => CryptoIcons.values.firstWhere(
        (e) =>
            basename(e).toLowerCase().split('.').first.toLowerCase() ==
            toLowerCase(),
        orElse: () => '',
      );

  bool get isJapanese{
    return this == 'ja-JP';
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
