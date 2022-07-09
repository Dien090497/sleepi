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

  double get weiToEther => this / weiFactor;

  String get format => Decimal.parse('$this').toString();


  String get formatBalanceWallet {
    if(this==0){
      return 0.toStringAsFixed(2);
    }else {
      final balance = (this / pow(10, 18));
      if (balance % 1 == 0) {
        return balance.toStringAsFixed(0);
      } else {
        int index = balance.toString().indexOf('.');
        if (balance.toString().length - index > 7) {
          index += 7;
        } else {
          index = balance.toString().length;
        }
        return balance.toString().substring(0, index);
      }

    }
  }

  String get formatBalanceToken {
    if(this==0){
      return 0.toStringAsFixed(2);
    }else {
      final balance = toDouble();
      if (balance % 1 == 0) {
        return balance.toStringAsFixed(0);
      } else {
        int index = balance.toString().indexOf('.');
        if (balance.toString().length - index > 7) {
          index += 7;
        } else {
          index = balance.toString().length;
        }
        return balance.toString().substring(0, index);
      }

    }
  }
}
