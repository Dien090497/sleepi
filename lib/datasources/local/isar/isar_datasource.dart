import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:slee_fi/models/isar_models/history_isar/history_isar_model.dart';
import 'package:slee_fi/models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/token_default_isar/token_default_model.dart';
import 'package:slee_fi/models/isar_models/token_isar/token_isar_model.dart';
import 'package:slee_fi/models/isar_models/wallet_isar/wallet_isar_model.dart';
import 'package:slee_fi/models/network/network.dart';

@Singleton()
class IsarDataSource {
  final Isar _isar;

  IsarDataSource(this._isar) {
    init();
  }

  Future<void> init() async {
    // final count = await networksCount();
    // if (count == null || count < 1) {
    final list = await _networksFromJson();
    final ids = await putAllNetworks(list);
    assert(list.length == ids.length, "Length must equal");
    // }
  }

  Future<List<NetworkIsarModel>> _networksFromJson() async {
    final jsonData = await rootBundle.loadString('assets/json/networks.json');
    final list = json.decode(jsonData) as List<dynamic>;
    final List<Network> networks =
        list.map<Network>((e) => Network.fromJson(cast(e))).toList();
    return networks.map((e) => NetworkIsarModel.fromNetwork(e)).toList();
  }

  /// Tạo mới hoặc update OBJ.
  ///
  /// Nếu id null sẽ tạo mới
  ///
  /// Sẽ update obj tại id truyền vào
  Future<int> putWallet(WalletIsarModel model) =>
      _isar.writeTxn((isar) => isar.wallets.put(model));

  Future<bool> deleteWallet(WalletIsarModel model) {
    assert(model.id != null, 'Must specify an id');
    return _isar.writeTxn((isar) {
      return _isar.wallets.delete(model.id!);
    });
  }

  Future<List<WalletIsarModel>> getAllWallets() =>
      _isar.wallets.where().findAll();

  Future<WalletIsarModel?> getWalletAt(int id) => _isar.wallets.get(id);

  Future<bool> walletExisted(String address) async =>
      (await _isar.wallets.filter().addressEqualTo(address).count()) > 0;

  ///
  ///
  /// For Tokens
  ///
  ///
  Future<int> putToken(TokenIsarModel model) {
    return _isar.writeTxn((isar) async {
      return isar.tokens.put(model);
    });
  }

  Future<bool> deleteToken(TokenIsarModel model) {
    assert(model.id != null, 'Must specify an id');
    return _isar.writeTxn((isar) {
      return _isar.tokens.delete(model.id!);
    });
  }

  Future<List<TokenIsarModel>> getTokens(int walletId, int chainId) =>
      _isar.tokens
          .filter()
          .walletIdEqualTo(walletId)
          .and()
          .networkChainIdEqualTo(chainId)
          .findAll();

  Future<TokenIsarModel?> getSingleToken(
          int walletId, int chainId, String address) =>
      _isar.tokens
          .filter()
          .walletIdEqualTo(walletId)
          .and()
          .networkChainIdEqualTo(chainId)
          .and()
          .addressEqualTo(address, caseSensitive: false)
          .findFirst();

  ///
  /// For Networks
  ///
  Future<int> putNetwork(NetworkIsarModel model) {
    return _isar.writeTxn((isar) => isar.networks.put(model));
  }

  Future<NetworkIsarModel?> getNetworkAt(int chainId) async {
    final network = await _isar.networks.get(chainId);
    if (network == null) return null;
    await Future.wait([
      network.explorers.load(),
    ]);
    return network;
  }

  Future<int?> networksCount() => _isar.networks.count();

  Future<List<NetworkIsarModel>> getAllNetwork() async {
    final result = await _isar.networks.where().findAll();
    for (final e in result) {
      await Future.wait([
        if (!e.nativeCurrency.isLoaded) e.nativeCurrency.load(),
        if (!e.ens.isLoaded) e.ens.load(),
        if (!e.explorers.isLoaded) e.explorers.load(),
      ]);
    }
    return result;
  }

  Future<List<int>> putAllNetworks(List<NetworkIsarModel> networks) =>
      _isar.writeTxn((isar) async {
        final ids = await isar.networks.putAll(networks);
        for (final e in networks) {
          await Future.wait([
            e.nativeCurrency.save(),
            e.ens.save(),
            e.explorers.save(),
            e.tokenDefault.save()
          ]);
        }
        return ids;
      });

  Future<void> multiLoad(List<dynamic> isarLinks) async {
    return _isar.writeTxn((isar) async {
      await Future.wait(isarLinks
          .where((e) => e is IsarLink || e is IsarLinks)
          .map((e) => cast(e.load())));
    });
  }

  ///
  /// For History
  ///
  Future<int> putHistory(HistoryIsarModel model) {
    return _isar.writeTxn((isar) => isar.history.put(model));
  }

  Future<HistoryIsarModel?> getHistoryAt(int chainId) =>
      _isar.history.get(chainId);

  Future<int?> historyCount() => _isar.history.count();

  Future<List<HistoryIsarModel>> getAllHistory() async {
    final result = await _isar.history.where().findAll();
    // for (final e in result) {
    //   await Future.wait([
    //     // e.addressToken.save(),
    //     // e.chainId.save(),
    //     // e.transactionInformation.save(),
    //     // e.transactionHash.save(),
    //   ]);
    // }
    return result;
  }

  Future<List<int>> putAllHistory(List<HistoryIsarModel> history) =>
      _isar.writeTxn((isar) async {
        final ids = await isar.history.putAll(history);
        // for (final e in history) {
        //   await Future.wait([
        //     // e.chainId.save(),
        //     // e.ens.save(),
        //     // e.explorers.save(),
        //     // e.tokenDefault.save()
        //   ]);
        // }
        return ids;
      });

  ///
  /// For Native Currency
  ///
  Future<NativeCurrencyIsarModel?> getNativeCurrency(int chainId) async {
    final list = await _isar.nativeCurrencies.where().findAll();
    for (final c in list) {
      if (!c.network.isLoaded) {
        await c.network.load();
      }

      if (c.network.value?.chainId == chainId) {
        return c;
      }
    }
    return null;
  }

  Future<void> clearAll() => _isar.writeTxn((isar) => isar.clear());

  Future<void> clearWallet() => _isar.writeTxn((isar) => isar.wallets.clear());

  Future<TokenDefaultModel?> getContractToken(int chainId) async {
    final list = await _isar.tokenDefault.where().findAll();
    for (final c in list) {
      if (!c.tokenDefault.isLoaded) {
        await c.tokenDefault.load();
      }

      if (c.tokenDefault.value?.chainId == chainId) {
        return c;
      }
    }
    return null;
  }
}
