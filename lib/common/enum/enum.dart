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

