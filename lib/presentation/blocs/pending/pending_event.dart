import 'package:equatable/equatable.dart';

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

  PendingInit(this.userId);

  @override
  List<Object> get props => [userId];
}
