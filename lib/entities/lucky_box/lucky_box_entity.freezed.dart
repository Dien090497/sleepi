// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lucky_box_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LuckyBoxEntity {
  int get id => throw _privateConstructorUsedError;
  String get openCost => throw _privateConstructorUsedError;
  String get speedUpCost => throw _privateConstructorUsedError;
  int get isOpen => throw _privateConstructorUsedError;
  int get waitingTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LuckyBoxEntityCopyWith<LuckyBoxEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuckyBoxEntityCopyWith<$Res> {
  factory $LuckyBoxEntityCopyWith(
          LuckyBoxEntity value, $Res Function(LuckyBoxEntity) then) =
      _$LuckyBoxEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String openCost,
      String speedUpCost,
      int isOpen,
      int waitingTime});
}

/// @nodoc
class _$LuckyBoxEntityCopyWithImpl<$Res>
    implements $LuckyBoxEntityCopyWith<$Res> {
  _$LuckyBoxEntityCopyWithImpl(this._value, this._then);

  final LuckyBoxEntity _value;
  // ignore: unused_field
  final $Res Function(LuckyBoxEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? openCost = freezed,
    Object? speedUpCost = freezed,
    Object? isOpen = freezed,
    Object? waitingTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      openCost: openCost == freezed
          ? _value.openCost
          : openCost // ignore: cast_nullable_to_non_nullable
              as String,
      speedUpCost: speedUpCost == freezed
          ? _value.speedUpCost
          : speedUpCost // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as int,
      waitingTime: waitingTime == freezed
          ? _value.waitingTime
          : waitingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LuckyBoxEntityCopyWith<$Res>
    implements $LuckyBoxEntityCopyWith<$Res> {
  factory _$$_LuckyBoxEntityCopyWith(
          _$_LuckyBoxEntity value, $Res Function(_$_LuckyBoxEntity) then) =
      __$$_LuckyBoxEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String openCost,
      String speedUpCost,
      int isOpen,
      int waitingTime});
}

/// @nodoc
class __$$_LuckyBoxEntityCopyWithImpl<$Res>
    extends _$LuckyBoxEntityCopyWithImpl<$Res>
    implements _$$_LuckyBoxEntityCopyWith<$Res> {
  __$$_LuckyBoxEntityCopyWithImpl(
      _$_LuckyBoxEntity _value, $Res Function(_$_LuckyBoxEntity) _then)
      : super(_value, (v) => _then(v as _$_LuckyBoxEntity));

  @override
  _$_LuckyBoxEntity get _value => super._value as _$_LuckyBoxEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? openCost = freezed,
    Object? speedUpCost = freezed,
    Object? isOpen = freezed,
    Object? waitingTime = freezed,
  }) {
    return _then(_$_LuckyBoxEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      openCost: openCost == freezed
          ? _value.openCost
          : openCost // ignore: cast_nullable_to_non_nullable
              as String,
      speedUpCost: speedUpCost == freezed
          ? _value.speedUpCost
          : speedUpCost // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as int,
      waitingTime: waitingTime == freezed
          ? _value.waitingTime
          : waitingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LuckyBoxEntity implements _LuckyBoxEntity {
  const _$_LuckyBoxEntity(
      {required this.id,
      required this.openCost,
      required this.speedUpCost,
      required this.isOpen,
      required this.waitingTime});

  @override
  final int id;
  @override
  final String openCost;
  @override
  final String speedUpCost;
  @override
  final int isOpen;
  @override
  final int waitingTime;

  @override
  String toString() {
    return 'LuckyBoxEntity(id: $id, openCost: $openCost, speedUpCost: $speedUpCost, isOpen: $isOpen, waitingTime: $waitingTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LuckyBoxEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.openCost, openCost) &&
            const DeepCollectionEquality()
                .equals(other.speedUpCost, speedUpCost) &&
            const DeepCollectionEquality().equals(other.isOpen, isOpen) &&
            const DeepCollectionEquality()
                .equals(other.waitingTime, waitingTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(openCost),
      const DeepCollectionEquality().hash(speedUpCost),
      const DeepCollectionEquality().hash(isOpen),
      const DeepCollectionEquality().hash(waitingTime));

  @JsonKey(ignore: true)
  @override
  _$$_LuckyBoxEntityCopyWith<_$_LuckyBoxEntity> get copyWith =>
      __$$_LuckyBoxEntityCopyWithImpl<_$_LuckyBoxEntity>(this, _$identity);
}

abstract class _LuckyBoxEntity implements LuckyBoxEntity {
  const factory _LuckyBoxEntity(
      {required final int id,
      required final String openCost,
      required final String speedUpCost,
      required final int isOpen,
      required final int waitingTime}) = _$_LuckyBoxEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get openCost => throw _privateConstructorUsedError;
  @override
  String get speedUpCost => throw _privateConstructorUsedError;
  @override
  int get isOpen => throw _privateConstructorUsedError;
  @override
  int get waitingTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LuckyBoxEntityCopyWith<_$_LuckyBoxEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
