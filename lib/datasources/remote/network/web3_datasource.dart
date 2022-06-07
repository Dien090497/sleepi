import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:erc20/erc20.dart';
import 'package:flutter/foundation.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/erc721.g.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/secret.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

@Singleton()
class Web3DataSource {
  final Client _client;
  NetworkIsarModel? _network;
  Web3Client? _web3client;
  String? _currentUrl;
  String? _currentWsUrl;

  Web3DataSource(this._client);

  Future<void> init(NetworkIsarModel model) {
    return setCurrentNetwork(model);
  }

  Future<void> setCurrentNetwork(NetworkIsarModel network) async {
    if (network.rpc.isNotEmpty && network != _network) {
      /// Khi thay đổi network khác với network hiện tại
      _network = network;
      final urls = network.rpc.where((e) => e.startsWith('http')).toList();
      final wss = network.rpc.where((e) => e.startsWith('wss')).toList();

      /// Loop qua list RPC
      for (int i = 0; i < urls.length; i++) {
        String url = urls[i];
        url = url.replaceAll(r'${INFURA_API_KEY}', infuraProjectId);
        String? wsUrl;
        if (wss.isNotEmpty && wss.length <= urls.length) {
          wsUrl = wss[i];
          wsUrl = wsUrl.replaceAll(r'${INFURA_API_KEY}', infuraProjectId);
        }
        try {
          /// Set và get thử chainId theo từng url
          ///
          /// Break For Loop nếu thành công
          final chainId = await _setWeb3(url, wsUrl);
          assert(chainId.toInt() == network.chainId, "Chain Id must match");
          break;
        } catch (e) {
          debugPrint('### setCurrentNetwork $e');

          /// Thử Rpc khác nếu thất bại
          await _tryOtherRpc();
        }
      }
    }
  }

  Future<BigInt> _setWeb3(String url, String? wsUrl) async {
    _currentUrl = url;
    _currentWsUrl = wsUrl;
    if (_web3client != null) {
      _web3client?.dispose();
      _web3client = null;
    }
    _web3client = Web3Client(url, _client,
        socketConnector: wsUrl != null
            ? () => IOWebSocketChannel.connect(wsUrl).cast<String>()
            : null);
    return _web3client!.getChainId();
  }

  Future<void> _tryOtherRpc() async {
    if (_network != null && _currentUrl != null) {
      final nextUrl =
          _network!.rpc.elementAt(_network!.rpc.indexOf(_currentUrl!) + 1);
      await _setWeb3(nextUrl, _currentWsUrl);
    }
  }

  // Future<void> _tryOtherWsUrl() async {
  //   if (_network != null && _currentWsUrl != null && _currentUrl != null) {
  //     final nextWsUrl =
  //         _network!.rpc.elementAt(_network!.rpc.indexOf(_currentWsUrl!) + 1);
  //     await _setWeb3(_currentUrl!, nextWsUrl);
  //   }
  // }

  /// Get Balance theo temp network
  ///
  /// Không set lại network hiện tại
  Future<int> tryGetBalance(NetworkIsarModel network,
      {required String address}) async {
    Web3Client? tempWeb3;
    for (final url in network.rpc) {
      if (tempWeb3 != null) {
        tempWeb3.dispose();
        tempWeb3 = null;
      }
      try {
        tempWeb3 = Web3Client(url, Client());
        return (await tempWeb3.getBalance(EthereumAddress.fromHex(address)))
            .getInWei
            .toInt();
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  String mnemonicToPrivateKey(String mnemonic, int derivedIndex,
      [int? slip44]) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final rootKey = bip32.BIP32.fromSeed(seed);
    final keyChild =
        rootKey.derivePath("m/44'/${slip44 ?? 60}'/0'/0/$derivedIndex");
    return HEX.encode(keyChild.privateKey!);
  }

  Future<int> getBalance(String address) async =>
      (await _web3client!.getBalance(EthereumAddress.fromHex(address)))
          .getInWei
          .toInt();

  Future<int> getNetworkId() => _web3client!.getNetworkId();

  Future<BigInt> getChainId() => _web3client!.getChainId();

  Credentials credentialsFromPrivateKey(String privateKey) =>
      EthPrivateKey.fromHex(privateKey);

  bool validateMnemonic(String mnemonic) => bip39.validateMnemonic(mnemonic);

  String createMnemonic() => bip39.generateMnemonic();

  Future<int> getGasPrice() async =>
      (await _web3client!.getGasPrice()).getInWei.toInt();

  Future<int> estimateGas({
    EthereumAddress? sender,
    String? to,
    double? value,
    double? gasPrice,
  }) async =>
      (await _web3client!.estimateGas(
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
  }) =>
      _web3client!.sendTransaction(
        credentials,
        Transaction(
          to: EthereumAddress.fromHex(to),
          gasPrice: EtherAmount.inWei(
              BigInt.from(gasPrice?.gweiToWei ?? Const.gasPrice.gweiToWei)),
          maxGas: maxGas,
          value: valueInEther.etherToWei.toWeiEtherAmount,
        ),
        chainId: chainId,
        fetchChainIdFromNetworkId: chainId == null,
      );

  ERC20 tokenFrom(String address) =>
      ERC20(address: EthereumAddress.fromHex(address), client: _web3client!);

  Erc721 nftFrom(String address) =>
      Erc721(address: EthereumAddress.fromHex(address), client: _web3client!);

  Stream<String> streamPendingTransactions() =>
      _web3client!.pendingTransactions();

  Stream<FilterEvent> streamEvents(String address) => _web3client!
      .events(FilterOptions(address: EthereumAddress.fromHex(address)));

  Future<TransactionInformation> getTxnByHash(String hash) =>
      _web3client!.getTransactionByHash(hash);
}

@module
abstract class RPCModule {
  Client get httpClient => Client();
}