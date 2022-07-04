import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test('Get avax balance', () async {
    final web3 =
        Web3Client('https://api.avax-test.network/ext/bc/C/rpc', Client());
    print(await web3.getBalance(
        EthereumAddress.fromHex('0x379E6E9D9C9BaDBF519A8A9A457987B601C8dE64')));
  });
}
