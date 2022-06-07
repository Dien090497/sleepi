import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:web3dart/web3dart.dart';

extension NumX on num {
  EtherAmount get toWeiEtherAmount =>
      EtherAmount.fromUnitAndValue(EtherUnit.wei, toInt());

  int get etherToWei => (this * weiFactor).toInt();

  int get etherToGwei => (this * weiFactor).toInt();

  double get toEther => this / weiFactor;

  double get toGwei => this / gweiFactor;

  int get gweiToWei => (this * gweiFactor).toInt();

  static int weiFactor = pow(10, 18).toInt();

  static int gweiFactor = pow(10, 9).toInt();

  String get format => Decimal.parse('$this').toString();
}
