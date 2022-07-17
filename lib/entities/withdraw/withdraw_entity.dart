import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_entity.freezed.dart';

@freezed
class WithdrawEntity with _$WithdrawEntity {
  const factory WithdrawEntity({
    required String txHash,
    required String amount,
    required String time,
  }) = _WithdrawEntity;
}
