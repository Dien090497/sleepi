import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/bed.g.dart';
import 'package:slee_fi/common/abi/spending.g.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class NFTDataSource {
  final Web3Provider _web3provider;

  NFTDataSource(this._web3provider);

  Future<BigInt> balanceOf(String address, String ownerAddress) {
    return _bed(address).balanceOf(EthereumAddress.fromHex(ownerAddress));
  }

  Future<List<BigInt>> tokensOf(String address, String owner) {
    return _bed(address).tokensOfOwner(EthereumAddress.fromHex(owner));
  }

  Future<String> name(String address) => _bed(address).name();

  Future<String> symbol(String address) => _bed(address).symbol();

  Future<String> transferFrom({
    required String nftAddress,
    required String from,
    required String to,
    required BigInt tokenId,
    required Credentials credentials,
  }) =>
      _bed(nftAddress).transferFrom(
          EthereumAddress.fromHex(from), EthereumAddress.fromHex(to), tokenId,
          credentials: credentials);

  Future<String> setApprovalForAll({
    required String address,
    required String operator,
    required Credentials credentials,
  }) =>
      _bed(address).setApprovalForAll(EthereumAddress.fromHex(operator), true,
          credentials: credentials);

  Future<bool> isApprovedForAll({
    required String address,
    required String owner,
    required String operator,
    required Credentials credentials,
  }) =>
      _bed(address).isApprovedForAll(
          EthereumAddress.fromHex(owner), EthereumAddress.fromHex(operator));

  Bed _bed(String address) => Bed(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);

  Future<String> depositToken({
    required String spendingAddress,
    required String nftAddress,
    required BigInt nftId,
    required BigInt userId,
    required Credentials credentials,
  }) {
    return _spending(spendingAddress).depositToken(
        EthereumAddress.fromHex(nftAddress), nftId, userId,
        credentials: credentials);
  }

  Future<String> depositNft({
    required String spendingAddress,
    required String nftAddress,
    required BigInt nftId,
    required BigInt userId,
    required Credentials credentials,
  }) {
    return _spending(spendingAddress).depositNft(
        EthereumAddress.fromHex(nftAddress), nftId, userId,
        credentials: credentials);
  }

  Spending _spending(String spendingAddress) => Spending(
      address: EthereumAddress.fromHex(spendingAddress),
      client: _web3provider.web3client);

  Future<double> estimateGasFee({
    required String nftAddress,
    required EthereumAddress ownerAddress,
    required EtherAmount gasPrice,
    required String functionName,
    required List<dynamic> data,
  }) async {
    final Bed nft = _bed(nftAddress);
    final transferFromFunc = nft.self.function(functionName);
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: ownerAddress,
      to: nft.self.address,
      gasPrice: gasPrice,
      data: transferFromFunc.encodeCall(data),
    );
    return gasFee * gasPrice.getInWei / BigInt.from(pow(10, 18));
  }

  Future<EtherAmount> getGasPrice() => _web3provider.web3client.getGasPrice();

  Future<TransactionReceipt?> streamTxHash({
    required String txHash,
  }) {
    final web3 = _web3provider.web3client;
    return web3
        .addedBlocks()
        .asyncMap((_) => web3.getTransactionReceipt(txHash))
        .where((tx) => tx != null)
        .first;
  }
}
