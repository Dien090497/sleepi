import 'package:isar/isar.dart';
import 'package:slee_fi/entities/history/history_entity.dart';

part 'history_isar_model.g.dart';

@Collection(accessor: 'history')
class HistoryIsarModel {
  int? id = Isar.autoIncrement;

  final String transactionHash;

  final String addressTo;

  final int chainId;

  // final BlockNum? blockNumber;
  //
  // final EthereumAddress? from;
  //
  // final int gas;
  //
  // final EtherAmount? gasPrice;
  //
  // final String hash;
  //
  // final int nonce;
  //
  // final EthereumAddress? to;
  //
  // int? transactionIndex;
  //
  // final EtherAmount? value;

  HistoryIsarModel({
    required this.transactionHash,
    required this.chainId,
    required this.addressTo,
  });

  HistoryEntity toEntity() {
    // assert(id != null, "Id must be assigned");
    return HistoryEntity(
      transactionHash: transactionHash,
      chainId: chainId,
      addressToken: addressTo,
      // gas: gas,
      // gasPrice: gasPrice,
      // value: value,
      // blockNumber: blockNumber,
      // from: from,
      // hash: hash,
      // nonce: nonce,
      // to: to,
      // transactionIndex: transactionIndex
    );
  }
}
