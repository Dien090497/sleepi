import 'package:isar/isar.dart';
import 'package:slee_fi/entities/native_currency/native_currency_entity.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/native_currency/native_currency.dart';

part 'native_currency_isar_model.g.dart';

@Collection(accessor: 'nativeCurrencies')
class NativeCurrencyIsarModel {
  int? id = Isar.autoIncrement;

  late String name;

  late String symbol;

  late String icon;

  late int decimals;

  late double balance;

  @Backlink(to: 'nativeCurrency')
  final network = IsarLink<NetworkIsarModel>();

  NativeCurrencyIsarModel({
    this.id,
    required this.name,
    required this.symbol,
    required this.icon,
    required this.decimals,
    required this.balance,
  });

  factory NativeCurrencyIsarModel.fromEntity(NativeCurrencyEntity e) {
    return NativeCurrencyIsarModel(
      id: e.id,
      name: e.name,
      symbol: e.symbol,
      decimals: e.decimals,
      icon: e.icon,
      balance: e.balance,
    );
  }

  factory NativeCurrencyIsarModel.fromNativeCurrency(
    NativeCurrency e, {
    required String icon,
    required double balance,
  }) {
    return NativeCurrencyIsarModel(
      name: e.name,
      symbol: e.symbol,
      decimals: e.decimals,
      icon: icon,
      balance: balance,
    );
  }

  NativeCurrencyEntity toEntity({required double balance}) =>
      NativeCurrencyEntity(id!, name, symbol, decimals,
          icon: icon, balance: balance, balanceUpdated: true);
}
