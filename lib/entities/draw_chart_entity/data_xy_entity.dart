import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_xy_entity.freezed.dart';

@freezed
class DataXYEntity with _$DataXYEntity{

  const factory DataXYEntity({
    required String x,
    required double y,
  })= _DataXYEntity;
}