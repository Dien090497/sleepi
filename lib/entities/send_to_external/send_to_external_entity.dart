import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web3dart/credentials.dart';

part 'send_to_external_entity.freezed.dart';

@freezed
class SendToExternalEntity with _$SendToExternalEntity {
  const factory SendToExternalEntity({
    int? chainId,
    required String transactionHash,
    required String toAddress,
    required double valueInEther,
    required Credentials credentials,
    double? gasPrice,
    int? maxGas,
  }) = _SendToExternalEntity;
}
