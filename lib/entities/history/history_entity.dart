import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web3dart/web3dart.dart';

part 'history_entity.freezed.dart';

@freezed
class HistoryEntity with _$HistoryEntity {
  const factory HistoryEntity({
    required String? transactionHash,
    required int chainId,
    required String addressToken,
    required TransactionInformation transactionInformation,
  }) = _HistoryEntity;
}
