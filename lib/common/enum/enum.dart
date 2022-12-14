import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

enum BedType {
  short(LocaleKeys.short_bed, LocaleKeys.short),
  middle(LocaleKeys.middle_bed, LocaleKeys.middle),
  long(LocaleKeys.long_bed, LocaleKeys.long),
  flexible(LocaleKeys.flexible_bed, LocaleKeys.flexible);

  final String name;
  final String type;

  const BedType(this.name, this.type);
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
  bed('Bed'),
  bedbox('Bedbox'),
  jewel('Jewel'),
  item('Item');

  const NftType(this.name);

  final String name;

  @override
  String toString() => name;

  String toJson() => name;
}

enum MessageType { error, success }

enum AttributeNFT {
  efficiency('efficiency'),
  luck('luck'),
  bonus('luck'),
  special('special'),
  resilience('resilience'),
  none('');

  const AttributeNFT(this.name);

  final String name;

  @override
  String toString() => name;

  String toJson() => name;
}

enum AttributeWithdraw {
  pending('pending'),
  history('history');

  const AttributeWithdraw(this.name);

  final String name;

  @override
  String toString() => name;

  String toJson() => name;
}

enum TransferType {
  token('token'),
  nft('nft');

  const TransferType(this.name);

  final String name;

  @override
  String toString() => name;

  String toJson() => name;
}

enum ErrorType { addItemToBed, removeItemFromBed, none }

enum TypeChart {
  slftChart,
  sleepScoreChart,
  bedTimeChart,
  sleepOnsetChart,
  wokeUpChart,
  sleepDurationChart,
  timeInBedChart,
  nocturalAwakenChart,
  chartDay,
}

enum TypeTimeChart { chartDay, chartWeek, chartMonth, }

enum SocketType { ready, empty, block }

enum ShareSocial { facebook, instagram, twitter }
