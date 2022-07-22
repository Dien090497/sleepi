import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

extension BedEntityX on BedEntity {
  String get infoBuff {
    switch (jewelType?.toLowerCase()) {
      case 'ruby':
      case 'purple':
        return efficiency.toString();
      case 'sapphire':
      case 'blue':
        return luck.toString();
      case 'emerald':
        return bonus.toString();
      case 'diamond':
      case 'white':
        return special.toString();
    }

    return '';
  }
}
