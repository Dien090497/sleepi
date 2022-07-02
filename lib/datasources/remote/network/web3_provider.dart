import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/secret.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

@Singleton()
class Web3Provider {
  final Client _client;
  late Web3Client web3client;
  NetworkIsarModel? _network;
  String? _currentUrl;
  String? _currentWsUrl;

  Web3Provider(this._client);


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
    // if (_web3client != null) {
    //   _web3client?.dispose();
    //   _web3client = null;
    // }
    web3client = Web3Client(url, _client,
        socketConnector: wsUrl != null
            ? () => IOWebSocketChannel.connect(wsUrl).cast<String>()
            : null);
    return web3client.getChainId();
  }

  Future<void> _tryOtherRpc() async {
    final nextIndex = _network!.rpc.indexOf(_currentUrl!) + 1;
    if (_network != null &&
        _currentUrl != null &&
        _network!.rpc.length < nextIndex) {
      final nextUrl = _network!.rpc.elementAt(nextIndex);
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

}
