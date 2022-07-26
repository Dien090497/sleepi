import 'package:erc20/erc20.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/spending.g.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class SpendingDataSource {
  final Web3Provider _web3provider;

  SpendingDataSource(this._web3provider);

  Spending spendingContract(String address) {
    return Spending(
        address: EthereumAddress.fromHex(address),
        client: _web3provider.web3client);
  }

  Future<String> toSpending({
    required String spendingAddress,
    required Credentials owner,
    required BigInt amount,
    required BigInt userId,
    required ERC20 token,
  }) async {
    return spendingContract(spendingAddress)
        .depositToken(token.self.address, amount, userId, credentials: owner);
  }

  Future<String> toSpendingAvax({
    required String spendingAddress,
    required Credentials owner,
    required BigInt amount,
    required BigInt userId,
    required EthereumAddress avax,
    Transaction? transaction,
  }) async {
    return spendingContract(spendingAddress).depositToken(avax, amount, userId,
        credentials: owner, transaction: transaction);
  }

  Future<String> approve(
      String spendingAddress, Credentials owner, BigInt value, ERC20 token) {
    return token.approve(EthereumAddress.fromHex(spendingAddress), value,
        credentials: owner);
  }

  Future<BigInt> allowance(
          String spendingAddress, EthereumAddress owner, ERC20 token) =>
      token.allowance(owner, EthereumAddress.fromHex(spendingAddress));

  ERC20 token(String address) => ERC20(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);
}
