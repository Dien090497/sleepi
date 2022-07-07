import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/nft.g.dart';
import 'package:slee_fi/common/abi/spending.g.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class NFTDataSource {
  final Web3Provider _web3provider;

  NFTDataSource(this._web3provider);

  Future<BigInt> balanceOf(String address, String ownerAddress) {
    return _nft(address).balanceOf(EthereumAddress.fromHex(ownerAddress));
  }

  Future<List<BigInt>> tokensOf(
      String address, String owner, int count, int start) {
    return _nft(address).getTokensOfOwner(
        EthereumAddress.fromHex(owner), BigInt.from(count), BigInt.from(start));
  }

  Future<String> name(String address) => _nft(address).name();

  Future<String> symbol(String address) => _nft(address).symbol();

  Future<String> transferFrom({
    required String address,
    required String from,
    required String to,
    required BigInt tokenId,
    required Credentials credentials,
  }) =>
      _nft(address).transferFrom(
          EthereumAddress.fromHex(from), EthereumAddress.fromHex(from), tokenId,
          credentials: credentials);

  Future<String> setApprovalForAll({
    required String address,
    required String operator,
    required Credentials credentials,
  }) =>
      _nft(address).setApprovalForAll(EthereumAddress.fromHex(operator), true,
          credentials: credentials);

  Future<bool> isApprovedForAll({
    required String address,
    required String owner,
    required String operator,
    required Credentials credentials,
  }) =>
      _nft(address).isApprovedForAll(
          EthereumAddress.fromHex(owner), EthereumAddress.fromHex(operator));

  Nft _nft(String address) => Nft(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);

  Future<String> deposit({
    required String spendingAddress,
    required String nftAddress,
    required BigInt amount,
    required BigInt userId,
    required Credentials credentials,
  }) {
    return _spending(spendingAddress).depositToken(
        EthereumAddress.fromHex(nftAddress), amount, userId,
        credentials: credentials);
  }

  Spending _spending(String spendingAddress) => Spending(
      address: EthereumAddress.fromHex(spendingAddress),
      client: _web3provider.web3client);

  Future<double> estimateGasFee({
    required String nftAddress,
    required EthereumAddress ownerAddress,
    required EthereumAddress toAddress,
    required BigInt nftId,
    required EtherAmount gasPrice,
    required String functionName,
  }) async {
    final Nft nft = _nft(nftAddress);
    final transferFromFunc = nft.self.function(functionName);
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: ownerAddress,
      to: nft.self.address,
      gasPrice: gasPrice,
      data: transferFromFunc.encodeCall(
        [
          ownerAddress,
          toAddress,
          BigInt.from(12),
        ],
      ),
    );
    return gasFee * gasPrice.getInWei / BigInt.from(pow(10, 18));
  }
}
