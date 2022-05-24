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
}
