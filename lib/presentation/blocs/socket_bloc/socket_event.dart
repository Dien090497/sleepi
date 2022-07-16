import 'package:equatable/equatable.dart';

abstract class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object?> get props => [];
}

class SocketInt extends SocketEvent {
  final int bedId;
  final int level;

  const SocketInt(this.bedId, this.level);

  @override
  List<Object?> get props => [bedId, level];
}

class OpenSocket extends SocketEvent {
  const OpenSocket();

  @override
  List<Object?> get props => [];
}

class SpeedUpSocket extends SocketEvent {
  final int index;

  const SpeedUpSocket(this.index);

  @override
  List<Object?> get props => [index];
}

class AddJewel extends SocketEvent {
  final int id;

  const AddJewel(this.id);

  @override
  List<Object?> get props => [id];
}

class RemoveJewel extends SocketEvent {
  final int index;

  const RemoveJewel(this.index);

  @override
  List<Object?> get props => [index];
}
