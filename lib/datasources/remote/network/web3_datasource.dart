import 'dart:math' as math;
import 'dart:math';
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
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:web3dart/web3dart.dart';

@Singleton()
class Web3DataSource {
  final Web3Provider _web3provider;
  final SecureStorage _secureStorage;

  Web3DataSource(
    this._web3provider,
    this._secureStorage,
  );

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
    final contract = token(contractAddress);
    final balance = await contract.balanceOf(EthereumAddress.fromHex(address));
    return balance;
  }

  Future<BigInt> getDecimals(String address) async {
    final contract = token(address);
    return await contract.decimals();
  }

  Future<int> getNetworkId() => _web3provider.web3client.getNetworkId();

  Future<BigInt> getChainId() => _web3provider.web3client.getChainId();

  Credentials credentialsFromPrivateKey(String privateKey) =>
      EthPrivateKey.fromHex(privateKey);

  bool validateMnemonic(String mnemonic) => bip39.validateMnemonic(mnemonic);

  String createMnemonic() => bip39.generateMnemonic();

  Future<TransactionInformation> getDetailTransaction(
          String? transactionHash) =>
      _web3provider.web3client.getTransactionByHash(transactionHash!);

  Future<TransactionReceipt?> getTransactionReceipt(String transactionHash) =>
      _web3provider.web3client.getTransactionReceipt(transactionHash);

  Future<BlockInformation> getDetailBlock(String blockNumber) =>
      _web3provider.web3client.getBlockInformation(blockNumber: blockNumber);

  Future<EtherAmount> getGasPrice() => _web3provider.web3client.getGasPrice();

  Future<BigInt> estimateGas({
    EthereumAddress? sender,
    String? to,
    double? value,
    EtherAmount? gasPrice,
  }) async {
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: sender,
      to: to != null ? EthereumAddress.fromHex(to) : null,
      value: value?.etherToWei.toWeiEtherAmount,
      gasPrice: gasPrice,
    );
    return gasFee;
  }

  Future<BigInt> estimateGasAvaxTrade({
    EthereumAddress? sender,
    EtherAmount? gasPrice,
  }) async {
    try {
      final contract = avaxFrom(
          await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe));
      String wavax = await _secureStorage.getTokenAddress(StorageKeys.wavax);
      String usdc = await _secureStorage.getTokenAddress(StorageKeys.usdc);

      final tradeFromFunc = contract.self.function('swapExactAVAXForTokens');
      EthereumAddress from = EthereumAddress.fromHex(wavax);
      EthereumAddress to = EthereumAddress.fromHex(usdc);
      final List<EthereumAddress> pairAddress = [from, to];
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(0.0001.etherToWei), pairAddress);
      BigInt amountOutMin = amounts[1] -
          BigInt.from((amounts[1].toInt() * 0.01) / 100); //slippage set here
      BigInt deadline = BigInt.from(
          ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

      final gasFee = await _web3provider.web3client.estimateGas(
        sender: sender,
        to: contract.self.address,
        value: 0.0001.etherToWei.toWeiEtherAmount,
        data: tradeFromFunc.encodeCall([
          amountOutMin,
          pairAddress,
          sender,
          deadline,
        ]),
      );
      return gasFee;
    } catch (e) {
      return BigInt.from(0);
    }
  }

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
      final contract = avaxFrom(
          await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe));
      EthereumAddress from = EthereumAddress.fromHex(
          contractAddressFrom == Const.deadAddress
              ? (await _secureStorage.getTokenAddress(StorageKeys.wavax))
              : contractAddressFrom);
      EthereumAddress to = EthereumAddress.fromHex(
          contractAddressTo == Const.deadAddress
              ? (await _secureStorage.getTokenAddress(StorageKeys.wavax))
              : contractAddressTo);
      final List<EthereumAddress> pairAddress =
          (contractAddressTo != Const.deadAddress &&
                  contractAddressFrom != Const.deadAddress)
              ? [
                  from,
                  EthereumAddress.fromHex(
                      await _secureStorage.getTokenAddress(StorageKeys.wavax)),
                  to
                ]
              : [from, to];
      final decimalFrom = await getDecimals(
          contractAddressFrom == Const.deadAddress
              ? (await _secureStorage.getTokenAddress(StorageKeys.wavax))
              : contractAddressFrom);
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value * math.pow(10, decimalFrom.toInt())), pairAddress);

      final decimalTo = await getDecimals(contractAddressTo == Const.deadAddress
          ? (await _secureStorage.getTokenAddress(StorageKeys.wavax))
          : contractAddressTo);
      return (amounts[amounts.length - 1] -
              BigInt.from((amounts[amounts.length - 1].toInt() * 0.01) / 100)) /
          BigInt.from(math.pow(10, decimalTo.toInt()));
    } catch (e) {
      return 0;
    }
  }

  Future<String> swapExactAVAXForTokens(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    final contract = avaxFrom(
        await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe));
    EthereumAddress avax = EthereumAddress.fromHex(
        await _secureStorage.getTokenAddress(StorageKeys.wavax));
    EthereumAddress token = EthereumAddress.fromHex(contractAddress);

    final List<EthereumAddress> pairAddress = [avax, token];
    final List<BigInt> amounts = await contract.getAmountsOut(
        BigInt.from(value.etherToWei), pairAddress);
    BigInt amountOutMin = amounts[1] -
        BigInt.from((amounts[1].toInt() * 0.01) / 100); //slippage set here
    EthereumAddress to = EthereumAddress.fromHex(walletAddress);
    BigInt deadline = BigInt.from(
        ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

    final Credentials credentials = EthPrivateKey.fromHex(privateKey);
    final txh = await contract.swapExactAVAXForTokens(
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
    return txh;
  }

  Future<String> approveToken(String walletAddress, String contractAddress,
      Credentials credentials) async {
    final contract = token(contractAddress);
    BigInt amount = BigInt.parse(
        "115792089237316195423570985008687907853269984665640564039457584007913129639935");
    final tradeFromFunc = contract.self.function('approve');
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: EthereumAddress.fromHex(walletAddress),
      to: contract.self.address,
      data: tradeFromFunc.encodeCall([
        EthereumAddress.fromHex(
            await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe)),
        amount,
      ]),
    );
    if ((gasFee *
            (await _web3provider.web3client.getGasPrice()).getInWei /
            BigInt.from(pow(10, 18))) <
        (await getBalance(walletAddress) / BigInt.from(pow(10, 18)))) {
      return await contract.approve(
          EthereumAddress.fromHex(await _secureStorage
              .getTokenAddress(StorageKeys.routerTraderJoe)),
          amount,
          credentials: credentials);
    } else {
      return LocaleKeys.not_enough_to_pay_the_fee;
    }
  }

  Future<BigInt> allowance(
      EthereumAddress owner, String contractAddress) async {
    final contract = token(contractAddress);
    return contract.allowance(
        owner,
        EthereumAddress.fromHex(
            await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe)));
  }

  Future<String> swapExactTokensForAvax(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    final contract = avaxFrom(
        await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe));
    final tradeFromFunc = contract.self.function('swapExactTokensForAVAX');
    EthereumAddress toToken = EthereumAddress.fromHex(
        await _secureStorage.getTokenAddress(StorageKeys.wavax));
    EthereumAddress fromToken = EthereumAddress.fromHex(contractAddress);

    final List<EthereumAddress> pairAddress = [fromToken, toToken];
    final decimalFrom = await getDecimals(contractAddress);
    final List<BigInt> amountsOut = await contract.getAmountsOut(
        BigInt.from(value * 1000000) *
            BigInt.from(math.pow(10, decimalFrom.toInt()) / 1000000),
        pairAddress);
    BigInt amountOutMin = amountsOut[1] -
        BigInt.from((amountsOut[1].toInt() * 0.01) / 100); ////slippage set here
    EthereumAddress to = EthereumAddress.fromHex(walletAddress);
    BigInt deadline = BigInt.from(
        ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);
    Credentials credentials = EthPrivateKey.fromHex(privateKey);
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: to,
      to: contract.self.address,
      data: tradeFromFunc.encodeCall([
        amountsOut[0],
        amountOutMin,
        pairAddress,
        to,
        deadline,
      ]),
    );
    if ((gasFee *
            (await _web3provider.web3client.getGasPrice()).getInWei /
            BigInt.from(pow(10, 18))) <
        (await getBalance(walletAddress) / BigInt.from(pow(10, 18)))) {
      final txh = await contract.swapExactTokensForAVAX(
        amountsOut[0],
        amountOutMin,
        pairAddress,
        to,
        deadline,
        credentials: credentials,
        transaction: Transaction(
          from: to,
          to: contract.self.address,
          value: 0.etherToWei.toWeiEtherAmount,
          gasPrice: await _web3provider.web3client.getGasPrice(),
        ),
      );
      return txh;
    } else {
      throw (LocaleKeys.not_enough_to_pay_the_fee);
    }
  }

  Future<String> swapExactTokensForTokens(
      String privateKey,
      String walletAddress,
      String contractAddressFrom,
      String contractAddressTo,
      double value) async {
    final contract = avaxFrom(
        await _secureStorage.getTokenAddress(StorageKeys.routerTraderJoe));
    final tradeFromFunc = contract.self.function('swapExactTokensForTokens');
    EthereumAddress toToken = EthereumAddress.fromHex(contractAddressTo);
    EthereumAddress fromToken = EthereumAddress.fromHex(contractAddressFrom);

    final List<EthereumAddress> pairAddress = [
      fromToken,
      EthereumAddress.fromHex(
          await _secureStorage.getTokenAddress(StorageKeys.wavax)),
      toToken
    ];
    final decimalFrom = await getDecimals(contractAddressFrom);
    final List<BigInt> amounts = await contract.getAmountsOut(
        BigInt.from(value * 1000000) *
            BigInt.from(math.pow(10, decimalFrom.toInt()) / 1000000),
        pairAddress);
    BigInt amountOutMin = amounts[amounts.length - 1] -
        BigInt.from((amounts[amounts.length - 1].toInt() * 0.01) /
            100); //slippage set here
    EthereumAddress to = EthereumAddress.fromHex(walletAddress);
    BigInt deadline = BigInt.from(
        ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

    Credentials credentials = EthPrivateKey.fromHex(privateKey);
    final gasFee = await _web3provider.web3client.estimateGas(
      sender: to,
      to: contract.self.address,
      data: tradeFromFunc.encodeCall([
        amounts[0],
        amountOutMin,
        pairAddress,
        to,
        deadline,
      ]),
    );
    if ((gasFee *
            (await _web3provider.web3client.getGasPrice()).getInWei /
            BigInt.from(pow(10, 18))) <
        (await getBalance(walletAddress) / BigInt.from(pow(10, 18)))) {
      final txh = await contract.swapExactTokensForTokens(
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
      return txh;
    } else {
      throw (LocaleKeys.not_enough_to_pay_the_fee);
    }
  }

  ERC20 token(String address) => ERC20(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);

  Erc721 nft(String address) => Erc721(
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
