import 'dart:math';

import 'package:test/test.dart';

void main() {
  test('Get avax balance', () async {
    print(BigInt.from(100000.00) * BigInt.from(pow(10, 18)));
  });

  // test('History Avax', () async {
  //   final TransactionRemoteDataSource historyDataSource = TransactionRemoteDataSource(Dio());
  //
  //   final res =
  //   await historyDataSource.getHistoryAvax();
  // });
}
