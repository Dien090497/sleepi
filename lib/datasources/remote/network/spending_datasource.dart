import 'dart:math';

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

  Future<double> estimateGasFee({
    required String spendingAddress,
    required EthereumAddress ownerAddress,
    required EtherAmount gasPrice,
    required EtherAmount? value,
    required String functionName,
    required List<dynamic> data,
  }) async {
    final Spending spending = spendingContract(spendingAddress);
    final depositTokenFunc = spending.self.function(functionName);
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: ownerAddress,
      to: spending.self.address,
      value: value,
      gasPrice: gasPrice,
      data: depositTokenFunc.encodeCall(data),
    );
    final fee = gasFee * gasPrice.getInWei;
    return BigInt.from(
            fee.toDouble() + fee * BigInt.from(5) / BigInt.from(100)) /
        BigInt.from(pow(10, 18));
  }

  Future<EtherAmount> getGasPrice() => _web3provider.web3client.getGasPrice();
}
