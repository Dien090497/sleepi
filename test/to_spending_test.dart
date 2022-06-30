import 'dart:math';

import 'package:erc20/erc20.dart';
import 'package:http/http.dart';
import 'package:slee_fi/common/abi/spending.g.dart';
import 'package:slee_fi/common/contract_addresses/contract_addresses.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:test/test.dart';
import 'package:web3dart/web3dart.dart';

import 'widget_test.dart';

void main() {
  final ethClient = Web3Client(testnetRpcUrl, Client());
  final cre = EthPrivateKey.fromHex(
      '000673dbcfdb4c09ee311915b22f4e3b552b571108e97825d6273ee7c87307fc');
  final spending =
      Spending(address: ContractAddresses.spending, client: ethClient);
  final slft = ERC20(address: ContractAddresses.slft, client: ethClient);

  final value = BigInt.from(1 * pow(10, 18));

  test('Without approve', () async {
    final result =
        await spending.depositToken(slft.self.address, value, credentials: cre);
    result.log;
  });

  test('Approve', () async {
    final str =
        await slft.approve(spending.self.address, value, credentials: cre);
    str.log;
    // final result = await spending.depositToken(
    //     slft.self.address, BigInt.from(1 * pow(10, 18)),
    //     credentials: cre);
    //
  });

  test('Allowance', () async {
    final allowance = await slft.allowance(cre.address, spending.self.address);
    'allowance ${allowance.toInt().weiToEther}'.log;
    // final result = await spending.depositToken(
    //     slft.self.address, BigInt.from(1 * pow(10, 18)),
    //     credentials: cre);
    //
  });
}
