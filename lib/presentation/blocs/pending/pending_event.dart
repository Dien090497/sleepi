import 'package:equatable/equatable.dart';
import 'package:slee_fi/common/enum/enum.dart';

class PendingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PendingFetched extends PendingEvent {
  PendingFetched();

  @override
  List<Object> get props => [];
}

class PendingInit extends PendingEvent {
  final int userId;
  final AttributeWithdraw attributeWithdraw;

  PendingInit(this.userId, this.attributeWithdraw);

  @override
  List<Object> get props => [userId, attributeWithdraw];
}
