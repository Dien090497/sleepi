import 'dart:math';

import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test('Get avax balance', () async {
    print(BigInt.from(100000000000000.00) * BigInt.from(pow(10, 18)));
  });

  test('History Avax', () async {
    final Web3Client web3 =
        Web3Client('https://api.avax-test.network/ext/bc/C/rpc', Client());

    print(await web3.getBalance(
        EthereumAddress.fromHex('0x379E6E9D9C9BaDBF519A8A9A457987B601C8dE64')));
  });
}
