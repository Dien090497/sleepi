import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';

part 'socket_state.freezed.dart';

@freezed
class SocketState with _$SocketState {
  const factory SocketState.init() = SocketStateInitial;

  const factory SocketState.loading() = SocketStateLoading;

  const factory SocketState.loaded(SocketEntity socketEntity) = SocketStateLoaded;
}
