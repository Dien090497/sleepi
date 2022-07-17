import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

part 'socket_entity.freezed.dart';

@freezed
class SocketEntity with _$SocketEntity {
  const factory SocketEntity(
      {required SocketType socketType,
      required int id,
      required String image,
      JewelEntity? jewelEntity
      }) = _SocketEntity;
}
