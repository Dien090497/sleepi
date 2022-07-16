import 'package:freezed_annotation/freezed_annotation.dart';

part 'socket_entity.freezed.dart';

@freezed
class SocketEntity with _$SocketEntity {
  const factory SocketEntity({
    int? sockets,
    int? jewel1,
    int? jewel2,
    int? jewel3,
    int? jewel4,
    int? jewel5,
  }) = _SocketEntity;
}
