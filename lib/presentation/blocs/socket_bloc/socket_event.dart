import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

abstract class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object?> get props => [];
}

class SocketInt extends SocketEvent {
  final int bedId;

  const SocketInt(this.bedId);

  @override
  List<Object?> get props => [bedId];
}
