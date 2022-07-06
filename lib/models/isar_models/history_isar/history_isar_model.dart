import 'package:isar/isar.dart';
import 'package:slee_fi/entities/history/history_entity.dart';
import 'package:web3dart/web3dart.dart';

part 'history_isar_model.g.dart';

@Collection(accessor: 'history')
class HistoryIsarModel {
  int? id = Isar.autoIncrement;

  final String transactionHash;

  final String addressTo;

  final int chainId;

  final TransactionInformation? transactionInformation;

  HistoryIsarModel({
    required this.transactionHash,
    required this.chainId,
    required this.addressTo,
    this.transactionInformation,
  });

  HistoryEntity toEntity() {
    // assert(id != null, "Id must be assigned");
    return HistoryEntity(
      transactionHash: transactionHash,
      chainId: chainId,
      addressToken: addressTo,
      transactionInformation: transactionInformation!
    );
  }
}
