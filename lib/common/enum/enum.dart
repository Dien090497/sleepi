import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

enum UserRole { guest, admin }

enum BedType {
  short(LocaleKeys.short_bed, Imgs.shortBed),
  middle(LocaleKeys.middle_bed, Imgs.middleBed),
  long(LocaleKeys.long_bed, Imgs.longBed),
  flexible(LocaleKeys.flexible_bed, Imgs.flexibleBed);


  final String name;
  final String image;


  const BedType(this.name, this.image);
}

enum ItemType {
  short(LocaleKeys.short, Imgs.candyBlue),
  middle(LocaleKeys.middle, Imgs.candyGreen),
  long(LocaleKeys.long, Imgs.candyPink),
  flexible(LocaleKeys.flexible, Imgs.candyPurple);


  final String? name;
  final String image;


  const ItemType(this.name, this.image);
}


