import 'dart:developer';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:erc20/erc20.dart';
import 'package:eth_sig_util/eth_sig_util.dart';
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
  final String avaxContractAddress = Const.tokens[0]['address'].toString();

  Web3DataSource(this._web3provider);

  String mnemonicToPrivateKey(String mnemonic, int derivedIndex,
      [int? slip44]) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final rootKey = bip32.BIP32.fromSeed(seed);
    final keyChild =
        rootKey.derivePath("m/44'/${slip44 ?? 60}'/0'/0/$derivedIndex");
    return HEX.encode(keyChild.privateKey!);
  }

  Future<BigInt> getBalance(String address) async {
    return (await _web3provider.web3client
            .getBalance(EthereumAddress.fromHex(address)))
        .getInWei;
  }

  Future<BigInt> getBalanceOf(String address, String contractAddress) async {
    var contract = tokenFrom(contractAddress);
    var balance = await contract.balanceOf(EthereumAddress.fromHex(address));
    return balance;
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

  Future<TransactionInformation> getDetailTransaction(String? transactionHash)  => _web3provider.web3client.getTransactionByHash(transactionHash!);

  Future<TransactionReceipt?> getTransactionReceipt(String transactionHash)  => _web3provider.web3client.getTransactionReceipt(transactionHash);

  Future<BlockInformation> getDetailBlock(String blockNumber)  => _web3provider.web3client.getBlockInformation(blockNumber: blockNumber);

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
      final List<EthereumAddress> pairAddress =
          (contractAddressTo != avaxContractAddress &&
                  contractAddressFrom != avaxContractAddress)
              ? [from, EthereumAddress.fromHex(avaxContractAddress), to]
              : [from, to];
      var decimalFrom = await getDecimals(contractAddressFrom);
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value * math.pow(10, decimalFrom.toInt())), pairAddress);

      var decimalTo = await getDecimals(contractAddressTo);
      return (amounts[amounts.length - 1] -
              BigInt.from((amounts[amounts.length - 1].toInt() * 0.01) / 100)) /
          BigInt.from(math.pow(10, decimalTo.toInt()));
    } catch (e) {
      log("message $e");
      return 0;
    }
  }

  Future<bool> swapExactAVAXForTokens(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress avax = EthereumAddress.fromHex(avaxContractAddress);
      EthereumAddress token = EthereumAddress.fromHex(contractAddress);

      final List<EthereumAddress> pairAddress = [avax, token];
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value.etherToWei), pairAddress);
      log('Calculated amounts: $amounts');
      BigInt amountOutMin = amounts[1] -
          BigInt.from((amounts[1].toInt() * 0.01) / 100); //slippage set here
      log('Calculated Amounts out: $amountOutMin');
      EthereumAddress to = EthereumAddress.fromHex(walletAddress);
      BigInt deadline = BigInt.from(
          ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

      Credentials credentials = EthPrivateKey.fromHex(privateKey);
      log('Calculated valueAvax: ${value.etherToWei.toWeiEtherAmount}');
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

  Future<void> approveToken(
      String contractAddress, Credentials credentials) async {
    final contract = tokenFrom(contractAddress);
    double amount = 0;
    for (var element in Const.tokens) {
      if (element['address'].toString().toLowerCase() ==
          contractAddress.toLowerCase()) {
        amount = double.parse(element['totalSupply'].toString());
      }
    }
    var decimal = await contract.decimals();
    await contract.approve(EthereumAddress.fromHex(Const.contractRouterTestNet),
        BigInt.from(amount) * BigInt.from(math.pow(10, decimal.toInt())),
        credentials: credentials);
  }

  Future<BigInt> allowance(
      EthereumAddress owner, String contractAddress) async {
    final contract = tokenFrom(contractAddress);
    return await contract.allowance(
        owner, EthereumAddress.fromHex(Const.contractRouterTestNet));
  }

  Future<bool> swapExactTokensForAvax(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress toToken = EthereumAddress.fromHex(avaxContractAddress);
      EthereumAddress fromToken = EthereumAddress.fromHex(contractAddress);

      final List<EthereumAddress> pairAddress = [fromToken, toToken];
      var decimalFrom = await getDecimals(contractAddress);
      final List<BigInt> amountsOut = await contract.getAmountsOut(
          BigInt.from(
              value * BigInt.from(math.pow(10, decimalFrom.toInt())).toInt()),
          pairAddress);
      log('Calculated Amounts out: $amountsOut');
      BigInt amountOutMin = amountsOut[1] -
          BigInt.from(
              (amountsOut[1].toInt() * 0.01) / 100); ////slippage set here
      log('Calculated Amounts out: ${amountOutMin.toInt()}');
      EthereumAddress to = EthereumAddress.fromHex(walletAddress);
      BigInt deadline = BigInt.from(
          ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);
      Credentials credentials = EthPrivateKey.fromHex(privateKey);
      BigInt allow = await allowance(
          EthereumAddress.fromHex(walletAddress), contractAddress);
      if (amountsOut[0] > allow) {
        approveToken(contractAddress, credentials);
        return false;
      } else {
        final tx = await contract.swapExactTokensForAVAX(
          amountsOut[0],
          amountOutMin,
          pairAddress,
          to,
          deadline,
          credentials: credentials,
          transaction: Transaction(
            from: to,
            to: to,
            value: 0.toWeiEtherAmount,
            gasPrice: await _web3provider.web3client.getGasPrice(),
            nonce: await _web3provider.web3client.getTransactionCount(to),
          ),
        );
        log('swapExactTokensForAVAX ${tx.toString()}');
        return true;
      }
    } catch (e) {
      log('swapExactTokensForAVAX ${e.toString()}');
      return false;
    }
  }

  Future<bool> swapExactTokensForTokens(
      String privateKey,
      String walletAddress,
      String contractAddressFrom,
      String contractAddressTo,
      double value) async {
    try {
      final contract = avaxFrom(Const.contractRouterTestNet);
      EthereumAddress toToken = EthereumAddress.fromHex(contractAddressTo);
      EthereumAddress fromToken = EthereumAddress.fromHex(contractAddressFrom);

      final List<EthereumAddress> pairAddress = [
        fromToken,
        EthereumAddress.fromHex(avaxContractAddress),
        toToken
      ];
      var decimalFrom = await getDecimals(contractAddressFrom);
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(
              value * BigInt.from(math.pow(10, decimalFrom.toInt())).toInt()),
          pairAddress);
      log('Calculated amounts: $amounts');

      BigInt amountOutMin = amounts[amounts.length - 1] -
          BigInt.from((amounts[amounts.length - 1].toInt() * 0.01) /
              100); //slippage set here
      log('Calculated Amounts out: ${amountOutMin.toInt()}');
      EthereumAddress to = EthereumAddress.fromHex(walletAddress);
      BigInt deadline = BigInt.from(
          ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

      Credentials credentials = EthPrivateKey.fromHex(privateKey);

      BigInt allow = await allowance(
          EthereumAddress.fromHex(walletAddress), contractAddressFrom);
      if (amounts[0] > allow) {
        approveToken(contractAddressFrom, credentials);
        return false;
      } else {
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
            value: 0.toWeiEtherAmount,
            gasPrice: await _web3provider.web3client.getGasPrice(),
            nonce: await _web3provider.web3client.getTransactionCount(to),
          ),
        );
        log('swapExactTokensForTokens ${tx.toString()}');
        return true;
      }
    } catch (e) {
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

  String generateSignature(
      {required String privateKey, required String message}) {
    final messageHex = Uint8List.fromList(message.codeUnits);
    String signature = EthSigUtil.signPersonalMessage(
        message: messageHex, privateKey: privateKey);
    return signature;
  }
}

@module
abstract class RPCModule {
  Client get httpClient => Client();
}
