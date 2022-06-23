import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:web3dart/web3dart.dart';

part 'transaction_isar_model.g.dart';

@CopyWith()
@Collection(accessor: 'transaction')
class TransactionIsarModel {
  late final String? transactionHash;

  late final String toAddress;

  late final double valueInEther;

  late final double? gasPrice;

  late final int? maxGas;

  TransactionIsarModel({
    required this.toAddress,
    required this.valueInEther,
    this.transactionHash,
    this.gasPrice,
    this.maxGas,
  });

  SendToExternalEntity toEntity(
      Credentials credentials, {
        int? chainId,
      }) {
    // assert(id != null, "Id must be assigned");
    return SendToExternalEntity(
      chainId: chainId!,
      toAddress: toAddress,
      credentials: credentials,
      transactionHash: transactionHash!,
      valueInEther: valueInEther,
      gasPrice: gasPrice,
      maxGas: maxGas,
    );
  }
}
