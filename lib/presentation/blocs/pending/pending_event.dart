import 'package:equatable/equatable.dart';
import 'package:slee_fi/common/enum/enum.dart';

class PendingEvent extends Equatable {
  const PendingEvent();

  @override
  List<Object> get props => [];
}

class PendingFetched extends PendingEvent {
  const PendingFetched();

  @override
  List<Object> get props => [];
}

class PendingInit extends PendingEvent {
  final int userId;
  final AttributeWithdraw attributeWithdraw;

  const PendingInit(this.userId, this.attributeWithdraw);

  @override
  List<Object> get props => [userId, attributeWithdraw];
}

class PendingRefresh extends PendingEvent {
  @override
  List<Object> get props => [];
}

class OpenDetailTransaction extends PendingEvent {
  final String txHash;

  const OpenDetailTransaction(this.txHash);

  @override
  List<Object> get props => [txHash];
}
