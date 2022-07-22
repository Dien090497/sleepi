import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

extension BedEntityX on BedEntity {
  String get infoBuff {
    switch (jewelType) {
      case 'ruby':
        return efficiency.toString();
      case 'sapphire':
        return luck.toString();
      case 'emerald':
        return bonus.toString();
      case 'diamond':
        return special.toString();
    }
    return '';
  }
}
