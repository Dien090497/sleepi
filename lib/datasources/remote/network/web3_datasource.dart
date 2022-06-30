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
import 'package:slee_fi/common/abi/spending.g.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/contract_addresses/contract_addresses.dart';
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
      final contract = avaxFrom("0x60aE616a2155Ee3d9A68541Ba4544862310933d4");
      EthereumAddress avax = EthereumAddress.fromHex(contractAddressFrom);
      EthereumAddress token = EthereumAddress.fromHex(contractAddressTo);

      final List<EthereumAddress> pairAddress = [avax, token];
      final List<BigInt> amounts = await contract.getAmountsOut(
          BigInt.from(value.etherToWei), pairAddress);
      var decimalFrom = await getDecimals(contractAddressFrom);
      var decimalTo = await getDecimals(contractAddressTo);
      BigInt amountOutMin = amounts[1] - BigInt.from(amounts[1] / decimalFrom);
      return amountOutMin.toInt() / math.pow(10, decimalTo.toInt());
    } catch (e) {
      return 0;
    }
  }

  Future<void> swapExactAVAXForTokens(String privateKey, String walletAddress,
      String contractAddress, double value) async {
    final contract = avaxFrom("0x60aE616a2155Ee3d9A68541Ba4544862310933d4");
    EthereumAddress avax =
        EthereumAddress.fromHex(Const.tokens[0]['address'].toString());
    EthereumAddress token = EthereumAddress.fromHex(contractAddress);

    final List<EthereumAddress> pairAddress = [avax, token];
    final List<BigInt> amounts = await contract.getAmountsOut(
        BigInt.from(value.etherToWei), pairAddress);
    log('Calculated amounts: $amounts');
    var decimal = await getDecimals(Const.tokens[0]['address'].toString());
    BigInt amountOutMin =
        amounts[1] - BigInt.from(amounts[1] / decimal); //slippage set here
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
  }

  Future<void> swapExactTokensForAvax(String privateKey, String walletAddress,
      String contractAddress, int tokenDecimal, double value) async {
    final contract = avaxFrom("0x60aE616a2155Ee3d9A68541Ba4544862310933d4");
    EthereumAddress avax =
        EthereumAddress.fromHex(Const.tokens[0]['address'].toString());
    EthereumAddress token = EthereumAddress.fromHex(contractAddress);

    final List<EthereumAddress> pairAddress = [token, avax];
    final List<BigInt> amounts = await contract.getAmountsOut(
        BigInt.from(value.etherToWei), pairAddress);
    log('Calculated amounts: $amounts');
    var decimal = await getDecimals(contractAddress);
    BigInt amountOutMin =
        amounts[1] - BigInt.from(amounts[1] / decimal); ////slippage set here
    log('Calculated Amounts out: $amountOutMin');
    EthereumAddress to = EthereumAddress.fromHex(walletAddress);
    BigInt deadline = BigInt.from(
        ((DateTime.now().millisecond / 1000).floor() + 60 * 20) * 1000000000);

    Credentials credentials = EthPrivateKey.fromHex(privateKey);
    final tx = await contract.swapExactTokensForAVAX(
      BigInt.from(value.etherToWei),
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
    log('swapExactTokensForAVAX ${tx.toString()}');
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

  Spending get _spendingContract {
    return Spending(
        address: ContractAddresses.spending, client: _web3provider.web3client);
  }

  Future<String> depositTokenSpending(
      {required Credentials owner,
      required ERC20 token,
      required int amount}) async {
    return _spendingContract.depositToken(
        token.self.address, BigInt.from(amount),
        credentials: owner);
  }

  Future<String> approveSpending(Credentials owner, int value) async {
    return slft.approve(ContractAddresses.spending, BigInt.from(value),
        credentials: owner);
  }

  ERC20 get slft =>
      ERC20(address: ContractAddresses.slft, client: _web3provider.web3client);
}

@module
abstract class RPCModule {
  Client get httpClient => Client();
}
