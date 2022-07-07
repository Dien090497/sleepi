import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';

part 'transaction_isar_model.g.dart';

@CopyWith()
@Collection(accessor: 'transaction')
class TransactionIsarModel {
  int? id = Isar.autoIncrement;

  final String? transactionHash;

  final DateTime timeStamp;

  final String? addressFrom;

  final String? addressTo;

  final double? valueInEther;

  final double? gasPrice;

  final int? maxGas;

  final int? status;

  TransactionIsarModel({
    this.transactionHash,
    required this.timeStamp,
    this.addressFrom,
    this.addressTo,
    this.valueInEther,
    this.gasPrice,
    this.maxGas,
    this.status,
  });

  SendToExternalEntity toEntity() {
    // assert(id != null, "Id must be assigned");
    return SendToExternalEntity(
      timeStamp: timeStamp,
      addressFrom: addressFrom,
      addressTo: addressTo,
      status: status,
      transactionHash: transactionHash!,
      value: valueInEther!,
      gasPrice: gasPrice,
      maxGas: maxGas,
    );
  }
}
