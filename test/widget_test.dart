import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart' show join, dirname;
import 'package:test/test.dart';
import 'package:web3dart/web3dart.dart';

const String rpcUrl = 'https://api.avax.network/ext/bc/C/rpc';
const String testnetRpcUrl = 'https://api.avax-test.network/ext/bc/C/rpc';
const String traderJoeAddr = '0x60aE616a2155Ee3d9A68541Ba4544862310933d4';
const String joePair = 'traderjoe.abi.json';
const String joeRouter = 'joe_router.abi.json';

Future<File> loadABIFile(String abiJson) async {
  // final path = join(dirname(Platform.script.path), abiJson);
  final path = dirname(Platform.script.path) + abiJson;
  return File(path);
}

void main() {
  final ethClient = Web3Client(rpcUrl, Client());
  final cre = EthPrivateKey.fromHex(
      '389bdb4733b975e6495f4dd225778b6a3d0200e4b72ff8924a81b266113bfec7');

  test('Get balance', () async {
    final balance = await ethClient.getBalance(cre.address);
    print(balance.getValueInUnit(EtherUnit.ether));
  });

  test('quote', () async {
    final abiCode = await (await loadABIFile('/test/$joePair')).readAsString();
    final contract = DeployedContract(
        ContractAbi.fromJson(abiCode, 'Trader Joe'),
        EthereumAddress.fromHex(traderJoeAddr));

    final quoteFunc = contract.function('quote');

    final res = await ethClient.call(
      contract: contract,
      function: quoteFunc,
      params: [
        BigInt.from(123456),
        BigInt.from(100000),
        BigInt.from(999999),
      ],
    );
    print('### $res');
  });

  test('swapExactAVAXForTokens', () async {
    final abiCode =
        await (await loadABIFile('/test/joe_router.abi.json')).readAsString();
    final contract = DeployedContract(
        ContractAbi.fromJson(abiCode, 'Trader Joe'),
        EthereumAddress.fromHex(traderJoeAddr));

    final quoteFunc = contract.function('swapExactAVAXForTokens');

    final res = await ethClient.call(
      contract: contract,
      function: quoteFunc,
      params: [
        BigInt.from(123456),
        BigInt.from(100000),
        BigInt.from(999999),
      ],
    );
    print('### $res');
  });
}
