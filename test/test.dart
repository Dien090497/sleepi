import 'dart:math';

import 'package:erc20/erc20.dart';
import 'package:http/http.dart';
import 'package:slee_fi/common/abi/spending.g.dart';
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

  test('History Avax', () async {
    final Web3Client web3 =
        Web3Client('https://api.avax-test.network/ext/bc/C/rpc', Client());
    final token = ERC20(
        address: EthereumAddress.fromHex(
            '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC'),
        client: web3);
    final spending = Spending(
        address: EthereumAddress.fromHex(
            '0x5c11e3517657B2b2731fd19d2F738f61b62a82CF'),
        client: web3);
    await token.approve(
      EthereumAddress.fromHex('0x379e6e9d9c9badbf519a8a9a457987b601c8de64'),
      BigInt.from(10000000),
      credentials: EthPrivateKey.fromHex(
          '000673dbcfdb4c09ee311915b22f4e3b552b571108e97825d6273ee7c87307fc'),
    );
  });
}
