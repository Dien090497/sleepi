// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'draw_chart_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawChartEntity {
  double get maxX => throw _privateConstructorUsedError;
  double get maxy => throw _privateConstructorUsedError;
  List<FlSpot> get listFlSpot => throw _privateConstructorUsedError;
  TypeChart get typeChart => throw _privateConstructorUsedError;
  List<DataXYEntity> get listData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawChartEntityCopyWith<DrawChartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawChartEntityCopyWith<$Res> {
  factory $DrawChartEntityCopyWith(
          DrawChartEntity value, $Res Function(DrawChartEntity) then) =
      _$DrawChartEntityCopyWithImpl<$Res>;
  $Res call(
      {double maxX,
      double maxy,
      List<FlSpot> listFlSpot,
      TypeChart typeChart,
      List<DataXYEntity> listData});
}

/// @nodoc
class _$DrawChartEntityCopyWithImpl<$Res>
    implements $DrawChartEntityCopyWith<$Res> {
  _$DrawChartEntityCopyWithImpl(this._value, this._then);

  final DrawChartEntity _value;
  // ignore: unused_field
  final $Res Function(DrawChartEntity) _then;

  @override
  $Res call({
    Object? maxX = freezed,
    Object? maxy = freezed,
    Object? listFlSpot = freezed,
    Object? typeChart = freezed,
    Object? listData = freezed,
  }) {
    return _then(_value.copyWith(
      maxX: maxX == freezed
          ? _value.maxX
          : maxX // ignore: cast_nullable_to_non_nullable
              as double,
      maxy: maxy == freezed
          ? _value.maxy
          : maxy // ignore: cast_nullable_to_non_nullable
              as double,
      listFlSpot: listFlSpot == freezed
          ? _value.listFlSpot
          : listFlSpot // ignore: cast_nullable_to_non_nullable
              as List<FlSpot>,
      typeChart: typeChart == freezed
          ? _value.typeChart
          : typeChart // ignore: cast_nullable_to_non_nullable
              as TypeChart,
      listData: listData == freezed
          ? _value.listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<DataXYEntity>,
    ));
  }
}

/// @nodoc
abstract class _$$_DrawChartEntityCopyWith<$Res>
    implements $DrawChartEntityCopyWith<$Res> {
  factory _$$_DrawChartEntityCopyWith(
          _$_DrawChartEntity value, $Res Function(_$_DrawChartEntity) then) =
      __$$_DrawChartEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {double maxX,
      double maxy,
      List<FlSpot> listFlSpot,
      TypeChart typeChart,
      List<DataXYEntity> listData});
}

/// @nodoc
class __$$_DrawChartEntityCopyWithImpl<$Res>
    extends _$DrawChartEntityCopyWithImpl<$Res>
    implements _$$_DrawChartEntityCopyWith<$Res> {
  __$$_DrawChartEntityCopyWithImpl(
      _$_DrawChartEntity _value, $Res Function(_$_DrawChartEntity) _then)
      : super(_value, (v) => _then(v as _$_DrawChartEntity));

  @override
  _$_DrawChartEntity get _value => super._value as _$_DrawChartEntity;

  @override
  $Res call({
    Object? maxX = freezed,
    Object? maxy = freezed,
    Object? listFlSpot = freezed,
    Object? typeChart = freezed,
    Object? listData = freezed,
  }) {
    return _then(_$_DrawChartEntity(
      maxX: maxX == freezed
          ? _value.maxX
          : maxX // ignore: cast_nullable_to_non_nullable
              as double,
      maxy: maxy == freezed
          ? _value.maxy
          : maxy // ignore: cast_nullable_to_non_nullable
              as double,
      listFlSpot: listFlSpot == freezed
          ? _value._listFlSpot
          : listFlSpot // ignore: cast_nullable_to_non_nullable
              as List<FlSpot>,
      typeChart: typeChart == freezed
          ? _value.typeChart
          : typeChart // ignore: cast_nullable_to_non_nullable
              as TypeChart,
      listData: listData == freezed
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<DataXYEntity>,
    ));
  }
}

/// @nodoc

class _$_DrawChartEntity implements _DrawChartEntity {
  const _$_DrawChartEntity(
      {required this.maxX,
      required this.maxy,
      required final List<FlSpot> listFlSpot,
      required this.typeChart,
      required final List<DataXYEntity> listData})
      : _listFlSpot = listFlSpot,
        _listData = listData;

  @override
  final double maxX;
  @override
  final double maxy;
  final List<FlSpot> _listFlSpot;
  @override
  List<FlSpot> get listFlSpot {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listFlSpot);
  }

  @override
  final TypeChart typeChart;
  final List<DataXYEntity> _listData;
  @override
  List<DataXYEntity> get listData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listData);
  }

  @override
  String toString() {
    return 'DrawChartEntity(maxX: $maxX, maxy: $maxy, listFlSpot: $listFlSpot, typeChart: $typeChart, listData: $listData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawChartEntity &&
            const DeepCollectionEquality().equals(other.maxX, maxX) &&
            const DeepCollectionEquality().equals(other.maxy, maxy) &&
            const DeepCollectionEquality()
                .equals(other._listFlSpot, _listFlSpot) &&
            const DeepCollectionEquality().equals(other.typeChart, typeChart) &&
            const DeepCollectionEquality().equals(other._listData, _listData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maxX),
      const DeepCollectionEquality().hash(maxy),
      const DeepCollectionEquality().hash(_listFlSpot),
      const DeepCollectionEquality().hash(typeChart),
      const DeepCollectionEquality().hash(_listData));

  @JsonKey(ignore: true)
  @override
  _$$_DrawChartEntityCopyWith<_$_DrawChartEntity> get copyWith =>
      __$$_DrawChartEntityCopyWithImpl<_$_DrawChartEntity>(this, _$identity);
}

abstract class _DrawChartEntity implements DrawChartEntity {
  const factory _DrawChartEntity(
      {required final double maxX,
      required final double maxy,
      required final List<FlSpot> listFlSpot,
      required final TypeChart typeChart,
      required final List<DataXYEntity> listData}) = _$_DrawChartEntity;

  @override
  double get maxX;
  @override
  double get maxy;
  @override
  List<FlSpot> get listFlSpot;
  @override
  TypeChart get typeChart;
  @override
  List<DataXYEntity> get listData;
  @override
  @JsonKey(ignore: true)
  _$$_DrawChartEntityCopyWith<_$_DrawChartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
