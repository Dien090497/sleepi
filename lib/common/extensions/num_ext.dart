import 'dart:math' as math;

import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:web3dart/web3dart.dart';

extension NumX on num {
  EtherAmount get toWeiEtherAmount =>
      EtherAmount.fromUnitAndValue(EtherUnit.wei, toInt());

  int get etherToWei => (this * weiFactor).toInt();

  int get etherToGwei => (this * weiFactor).toInt();

  double get toEther => this / weiFactor;

  double get toGwei => this / gweiFactor;

  int get gweiToWei => (this * gweiFactor).toInt();

  static int weiFactor = math.pow(10, 18).toInt();

  static int gweiFactor = math.pow(10, 9).toInt();

  double get weiToEther => this / weiFactor;

  String get format => Decimal.parse('$this').toString();

  String get formatBalance2Digits {
    if (this == 0) {
      return 0.toStringAsFixed(2);
    } else {
      final balance = toDouble();
      if (balance % 1 == 0) {
        return balance.toStringAsFixed(0);
      } else {
        int index = balance.toString().indexOf('.');
        if (balance.toString().length - index > 3) {
          index += 3;
        } else {
          index = balance.toString().length;
        }
        return balance.toString().substring(0, index);
      }
    }
  }

  String get formatBalanceToken {
    if (this == 0) {
      return 0.toStringAsFixed(2).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
    } else if (this >= 0.000001) {
      final balance = toDouble();
      int index = balance.toString().indexOf('.');
      if (balance.toString().length - index > 7) {
        index += 7;
      } else {
        index = balance.toString().length;
      }
      return balance.toString().substring(0, index);
    } else {
      return 0.toStringAsFixed(2).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
    }
  }

  String get formatCurrency {
    if (this == 0) {
      return 0.toStringAsFixed(2).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
    } else if (this >= 0.000001) {
      if (this % 1 == 0) {
        return NumberFormat("#,##0").format(this);
      }

      final balance = toDouble();
      int decimalIndex = balance.toString().indexOf('.');

      final decimalLength = math.min(
          balance.toString().length - decimalIndex, Const.decimalMaxLength);

      if (balance.toString().length - decimalIndex > Const.decimalMaxLength) {
        decimalIndex += Const.decimalMaxLength;
      } else {
        decimalIndex = balance.toString().length;
      }
      final newValue = balance
          .toString()
          .substring(0, decimalIndex)
          .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
      const temp = '00000000000000';
      final oCcy =
      NumberFormat("#,##0.${temp.substring(0, decimalLength - 1)}");

      return oCcy.format(double.parse(newValue));
    } else {
      return 0.toStringAsFixed(2).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
    }
  }
}

extension BigIntX on BigInt {
  double toEther({BigInt? decimals}) => (Decimal.parse('$this') /
          Decimal.parse('${math.pow(10, decimals?.toInt() ?? 18)}'))
      .toDouble();
}
