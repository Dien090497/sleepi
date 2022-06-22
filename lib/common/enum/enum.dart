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
  short(LocaleKeys.blue_candy, Imgs.candyBlue, LocaleKeys.effect_luck),
  middle(LocaleKeys.green_candy, Imgs.candyGreen, LocaleKeys.effect_special),
  long(LocaleKeys.pink_candy, Imgs.candyPink, LocaleKeys.effect_efficiency),
  flexible(LocaleKeys.purple_candy, Imgs.candyPurple, LocaleKeys.effect_resilience);


  final String? name;
  final String image;
  final String effect;


  const ItemType(this.name, this.image, this.effect);
}


