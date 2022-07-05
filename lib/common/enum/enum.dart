import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

enum UserRole { guest, admin }

enum BedType {
  short(LocaleKeys.short_bed, Imgs.shortBed, LocaleKeys.short),
  middle(LocaleKeys.middle_bed, Imgs.middleBed, LocaleKeys.middle),
  long(LocaleKeys.long_bed, Imgs.longBed, LocaleKeys.long),
  flexible(LocaleKeys.flexible_bed, Imgs.flexibleBed, LocaleKeys.flexible);

  final String name;
  final String type;
  final String image;

  const BedType(this.name, this.image, this.type);
}

enum ItemType {
  short(LocaleKeys.blue_candy, Imgs.candyBlue, LocaleKeys.effect_luck),
  middle(LocaleKeys.green_candy, Imgs.candyGreen, LocaleKeys.effect_special),
  long(LocaleKeys.pink_candy, Imgs.candyPink, LocaleKeys.effect_efficiency),
  flexible(
      LocaleKeys.purple_candy, Imgs.candyPurple, LocaleKeys.effect_resilience);

  final String? name;
  final String image;
  final String effect;

  const ItemType(this.name, this.image, this.effect);
}

enum NetWorkEnum { mainNet, testNet }

enum OTPType {
  signUp('SIGN_UP'),
  addWallet('ADD_WALLET'),
  changePass('CHANGE_PASS'),
  importWallet('IMPORT_WALLET');

  final String name;

  const OTPType(this.name);

  @override
  String toString() => name;

  String toJson() => name;
}

enum TokenToSpending { approve, spending }

enum NftType {
  beds('Beds'),
  bedbox('Bedbox'),
  efficiency('Efficiency'),
  luck('Luck'),
  resilience('Resilience'),
  special('Special'),
  bonus('Bonus');

  const NftType(this.name);

  final String name;

  @override
  String toString() => name;

  String toJson() => name;
}
