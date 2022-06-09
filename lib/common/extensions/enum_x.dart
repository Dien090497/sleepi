import 'dart:ui';

import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/resources/resources.dart';

extension BedTypeX on BedType {
  Color get color {
    switch (this) {
      case BedType.short:
        return AppColors.red;
      case BedType.middle:
        return AppColors.yellow;
      case BedType.long:
        return AppColors.lightPurple;
      case BedType.flexible:
        return AppColors.green;
    }
  }
}
