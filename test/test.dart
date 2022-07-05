import 'dart:math';

import 'package:test/test.dart';

void main() {
  test('Get avax balance', () async {
    final balance = BigInt.parse('1000091023910239021301293012039123123123123123');
    final result = balance / BigInt.from(pow(10, 18));
    print('### $result');
    print('### ${result.runtimeType}');
  });
}
