import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:slee_fi/models/isar_models/history_isar/history_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/network/network.dart';

@Injectable()
class HistoryDataSource {
  final Isar _isar;

  HistoryDataSource(this._isar) {
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

  ///
  /// For Networks
  ///
  Future<int> putNetwork(NetworkIsarModel model) {
    return _isar.writeTxn((isar) => isar.networks.put(model));
  }

  Future<NetworkIsarModel?> getNetworkAt(int chainId) =>
      _isar.networks.get(chainId);

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

  Future<List<NetworkIsarModel>> _networksFromJson() async {
    final jsonData = await rootBundle.loadString('assets/json/networks.json');
    final list = json.decode(jsonData) as List<dynamic>;
    final List<Network> networks =
    list.map<Network>((e) => Network.fromJson(cast(e))).toList();
    return networks.map((e) => NetworkIsarModel.fromNetwork(e)).toList();
  }

  Future<int> putHistory(HistoryIsarModel model) {
    return _isar.writeTxn((isar) => isar.history.put(model));
  }

  Future<HistoryIsarModel?> getHistoryAt(int chainId) =>
      _isar.history.get(chainId);

  Future<int?> historyCount() => _isar.history.count();

  Future<List<HistoryIsarModel>> getAllHistory() async {
    final result = await _isar.history.where().findAll();
    return result;
  }

  Future<HistoryIsarModel?> getHistoryFirst() async {
    final result = await _isar.history.where().findFirst();
    return result;
  }

  Future<List<int>> putAllHistory(List<HistoryIsarModel> history) =>
      _isar.writeTxn((isar) async {
        final ids = await isar.history.putAll(history);
        return ids;
      });
}

