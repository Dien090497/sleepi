import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_to_external_entity.freezed.dart';

@freezed
class SendToExternalEntity with _$SendToExternalEntity {
  const factory SendToExternalEntity({
    String? transactionHash,
    required DateTime timeStamp,
    String? addressFrom,
    String? addressTo,
    required double value,
    double? gasPrice,
    int? maxGas,
    int? status,
  }) = _SendToExternalEntity;
}
