import 'package:recase/recase.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/resources/resources.dart';

extension StringX on String {
  BedType get bedType {
    switch (this) {
      case Ics.shortBed:
        return BedType.short;
      case Ics.middleBed:
        return BedType.middle;
      case Ics.longBed:
        return BedType.long;
      case Ics.flexibleBed:
        return BedType.flexible;
      default:
        return BedType.short;
    }
  }

  String reCase(StringCase? stringCase) {
    final ReCase rc = ReCase(this);
    switch (stringCase) {
      case StringCase.camelCase:
        return rc.camelCase;
      case StringCase.pascalCase:
        return rc.pascalCase;
      case StringCase.snakeCase:
        return rc.snakeCase;
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
}
