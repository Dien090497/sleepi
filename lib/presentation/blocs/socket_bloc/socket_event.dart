import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

abstract class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object?> get props => [];
}

class SocketInit extends SocketEvent {
  final int nftId;
  final int level;

  const SocketInit(this.nftId, this.level);

  @override
  List<Object?> get props => [nftId, level];
}

class RefreshSocket extends SocketEvent {
  const RefreshSocket();

  @override
  List<Object?> get props => [];
}

class OpenSocket extends SocketEvent {
  final int socketIndex;

  const OpenSocket(this.socketIndex);

  @override
  List<Object?> get props => [socketIndex];
}

class AddJewel extends SocketEvent {
  final JewelEntity jewelEntity;

  const AddJewel(this.jewelEntity);

  @override
  List<Object?> get props => [jewelEntity];
}

class RemoveJewel extends SocketEvent {
  final int index;

  const RemoveJewel(this.index);

  @override
  List<Object?> get props => [index];
}

class FetchJewels extends SocketEvent {
  const FetchJewels();

  @override
  List<Object?> get props => [];
}

class RefreshJewels extends SocketEvent {
  const RefreshJewels();

  @override
  List<Object?> get props => [];
}

class SocketError extends SocketEvent {
  final String message;

  const SocketError(this.message);

  @override
  List<Object?> get props => [message];
}

class StartLoading extends SocketEvent {
  const StartLoading();

  @override
  List<Object?> get props => [];
}

class StopLoading extends SocketEvent {
  const StopLoading();

  @override
  List<Object?> get props => [];
}
class LevelUp extends SocketEvent {
  const LevelUp();

  @override
  List<Object?> get props => [];
}

// class LoadMoreJewel extends SocketEvent {
//   const RefreshJewels();
//
//   @override
//   List<Object?> get props => [];
// }
