import 'dart:developer';
import 'dart:math' as math;

import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:erc20/erc20.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/avax.g.dart';
import 'package:slee_fi/common/abi/erc721.g.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class Web3DataSource {
  final Web3Provider _web3provider;

  Web3DataSource(this._web3provider);

  String mnemonicToPrivateKey(String mnemonic, int derivedIndex,
      [int? slip44]) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final rootKey = bip32.BIP32.fromSeed(seed);
    final keyChild =
        rootKey.derivePath("m/44'/${slip44 ?? 60}'/0'/0/$derivedIndex");
    return HEX.encode(keyChild.privateKey!);
  }

  Future<int> getBalance(String address) async =>
      (await _web3provider.web3client
              .getBalance(EthereumAddress.fromHex(address)))
          .getInWei
          .toInt();

  Future<int> getBalanceOf(String address, String contractAddress) async {
    var contract = tokenFrom(contractAddress);
    var balance = await contract.balanceOf(EthereumAddress.fromHex(address));
    return balance.toInt();
  }

  Future<BigInt> getDecimals(String address) async {
    var contract = tokenFrom(address);
    return await contract.decimals();
  }

  Future<int> getNetworkId() => _web3provider.web3client.getNetworkId();

  Future<BigInt> getChainId() => _web3provider.web3client.getChainId();

  Credentials credentialsFromPrivateKey(String privateKey) =>
      EthPrivateKey.fromHex(privateKey);

  bool validateMnemonic(String mnemonic) => bip39.validateMnemonic(mnemonic);

  String createMnemonic() => bip39.generateMnemonic();

  Future<int> getGasPrice() async =>
      (await _web3provider.web3client.getGasPrice()).getInWei.toInt();

  Future<int> estimateGas({
    EthereumAddress? sender,
    String? to,
    double? value,
    double? gasPrice,
  }) async =>
      (await _web3provider.web3client.estimateGas(
              sender: sender,
              to: to != null ? EthereumAddress.fromHex(to) : null,
              value: value?.etherToWei.toWeiEtherAmount,
              gasPrice: gasPrice?.toWeiEtherAmount))
          .toInt();

  Future<String> sendCoinTxn({
    required Credentials credentials,
    required String to,
    required double valueInEther,
    int? chainId,

    /// GWei
    double? gasPrice,
    int? maxGas,
  }) async =>
      _web3provider.web3client.sendTransaction(
        credentials,
        Transaction(
          to: EthereumAddress.fromHex(to),
          // gasPrice: EtherAmount.inWei(
          //     BigInt.from(gasPrice?.gweiToWei ?? Const.gasPrice.gweiToWei)),
          gasPrice: await _web3provider.web3client.getGasPrice(),
          maxGas: maxGas,
          value: valueInEther.etherToWei.toWeiEtherAmount,
        ),
        chainId: chainId,
        fetchChainIdFromNetworkId: chainId == null,
      );

  Future<double> getAmountOutMin(
      String walletAddress,
      String contractAddressFrom,
      String contractAddressTo,
      double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress from = EthereumAddress.fromHex(contractAddressFrom);
      EthereumAddress to = EthereumAddress.fromHex(contractAddressTo);
      log(" ${from.toString()} ${to.toString()}");
      final List<EthereumAddress> pairAddress = [from, to];
      var decimalFrom = await getDecimals(contractAddressFrom);
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value * math.pow(10, decimalFrom.toInt())), pairAddress);

      var decimalTo = await getDecimals(contractAddressTo);
      return amounts[1].toInt() / math.pow(10, decimalTo.toInt());
    } catch (e) {
      log("message $e");
      return 0;
    }
  }

  Future<bool> swapExactAVAXForTokens(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress avax =
          EthereumAddress.fromHex(Const.tokens[0]['address'].toString());
      EthereumAddress token = EthereumAddress.fromHex(contractAddress);

      final List<EthereumAddress> pairAddress = [avax, token];
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value.etherToWei), pairAddress);
      log('Calculated amounts: $amounts');
      var decimal = await getDecimals(contractAddress);
      BigInt amountOutMin = BigInt.from(amounts[1].toInt() /
          math.pow(10, decimal.toInt())); //slippage set here
      log('Calculated Amounts out: $amountOutMin');
      EthereumAddress to = EthereumAddress.fromHex(walletAddress);
      BigInt deadline = BigInt.from(
          ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

      Credentials credentials = EthPrivateKey.fromHex(privateKey);
      final tx = await contract.swapExactAVAXForTokens(
        amountOutMin,
        pairAddress,
        to,
        deadline,
        credentials: credentials,
        transaction: Transaction(
          from: to,
          to: to,
          value: value.etherToWei.toWeiEtherAmount,
          gasPrice: await _web3provider.web3client.getGasPrice(),
          nonce: await _web3provider.web3client.getTransactionCount(to),
        ),
      );
      log('swapExactAVAXForTokens ${tx.toString()}');
      return true;
    } catch (e) {
      log('swapExactAVAXForTokens ${e.toString()}');
      return false;
    }
  }

  Future<bool> swapExactTokensForAvax(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress toToken =
      EthereumAddress.fromHex(Const.tokens[0]['address'].toString());
      EthereumAddress fromToken = EthereumAddress.fromHex(contractAddress);

      final List<EthereumAddress> pairAddress = [fromToken, toToken];
      var decimalFrom = await getDecimals(contractAddress);
      var decimalTo = await getDecimals(Const.tokens[0]['address'].toString());
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value * math.pow(10, decimalFrom.toInt())), pairAddress);
      log('Calculated amounts: $amounts');

      BigInt amountOutMin = BigInt.from(amounts[1].toInt() /
          math.pow(10, decimalTo.toInt())); ////slippage set here
      log('Calculated Amounts out: ${amountOutMin.toInt()}');
      EthereumAddress to = EthereumAddress.fromHex(walletAddress);
      BigInt deadline = BigInt.from(
          ((DateTime
              .now()
              .millisecond / 1000).floor() + 60 * 20) * 1000000000);

      Credentials credentials = EthPrivateKey.fromHex(privateKey);
      final tx = await contract.swapExactTokensForAVAX(
        amounts[0],
        amountOutMin,
        pairAddress,
        to,
        deadline,
        credentials: credentials,
        transaction: Transaction(
          from: to,
          to: to,
          value: (amountOutMin.toInt() / math.pow(10, decimalTo.toInt()))
              .etherToWei
              .toWeiEtherAmount,
          gasPrice: await _web3provider.web3client.getGasPrice(),
          nonce: await _web3provider.web3client.getTransactionCount(to),
        ),
      );
      log('swapExactTokensForAVAX ${tx.toString()}');
      return true;
    }catch(e){
      log('swapExactTokensForAVAX ${e.toString()}');
      return false;
    }
  }

  Future<bool> swapExactTokensForTokens(String privateKey, String walletAddress,
      String contractAddressFrom, String contractAddressTo, double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress toToken =
      EthereumAddress.fromHex(contractAddressTo);
      EthereumAddress fromToken = EthereumAddress.fromHex(contractAddressFrom);

      final List<EthereumAddress> pairAddress = [fromToken, toToken];
      var decimalFrom = await getDecimals(contractAddressFrom);
      var decimalTo = await getDecimals(contractAddressTo);
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value * math.pow(10, decimalFrom.toInt())), pairAddress);
      log('Calculated amounts: $amounts');

      BigInt amountOutMin = BigInt.from(amounts[1].toInt() /
          math.pow(10, decimalTo.toInt())); ////slippage set here
      log('Calculated Amounts out: ${amountOutMin.toInt()}');
      EthereumAddress to = EthereumAddress.fromHex(walletAddress);
      BigInt deadline = BigInt.from(
          ((DateTime
              .now()
              .millisecond / 1000).floor() + 60 * 20) * 1000000000);

      Credentials credentials = EthPrivateKey.fromHex(privateKey);
      final tx = await contract.swapExactTokensForTokens(
        amounts[0],
        amountOutMin,
        pairAddress,
        to,
        deadline,
        credentials: credentials,
        transaction: Transaction(
          from: to,
          to: to,
          value: (amountOutMin.toInt() / math.pow(10, decimalTo.toInt()))
              .etherToWei
              .toWeiEtherAmount,
          gasPrice: await _web3provider.web3client.getGasPrice(),
          nonce: await _web3provider.web3client.getTransactionCount(to),
        ),
      );
      log('swapExactTokensForTokens ${tx.toString()}');
      return true;
    }catch(e){
      log('swapExactTokensForTokens ${e.toString()}');
      return false;
    }
  }

  ERC20 tokenFrom(String address) => ERC20(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);

  Erc721 nftFrom(String address) => Erc721(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);

  Avax avaxFrom(String address) => Avax(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);

  Stream<String> streamPendingTransactions() =>
      _web3provider.web3client.pendingTransactions();

  Stream<FilterEvent> streamEvents(String address) => _web3provider.web3client
      .events(FilterOptions(address: EthereumAddress.fromHex(address)));

  Future<TransactionInformation> getTxnByHash(String hash) =>
      _web3provider.web3client.getTransactionByHash(hash);
}

@module
abstract class RPCModule {
  Client get httpClient => Client();
}
