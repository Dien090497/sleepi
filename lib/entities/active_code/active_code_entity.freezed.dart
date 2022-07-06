// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'active_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActiveCodeEntity {
  String get code => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;
  String? get codeUsedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActiveCodeEntityCopyWith<ActiveCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveCodeEntityCopyWith<$Res> {
  factory $ActiveCodeEntityCopyWith(
          ActiveCodeEntity value, $Res Function(ActiveCodeEntity) then) =
      _$ActiveCodeEntityCopyWithImpl<$Res>;
  $Res call({String code, bool isUsed, String? codeUsedAt});
}

/// @nodoc
class _$ActiveCodeEntityCopyWithImpl<$Res>
    implements $ActiveCodeEntityCopyWith<$Res> {
  _$ActiveCodeEntityCopyWithImpl(this._value, this._then);

  final ActiveCodeEntity _value;
  // ignore: unused_field
  final $Res Function(ActiveCodeEntity) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? isUsed = freezed,
    Object? codeUsedAt = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isUsed: isUsed == freezed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      codeUsedAt: codeUsedAt == freezed
          ? _value.codeUsedAt
          : codeUsedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ActiveCodeEntityCopyWith<$Res>
    implements $ActiveCodeEntityCopyWith<$Res> {
  factory _$$_ActiveCodeEntityCopyWith(
          _$_ActiveCodeEntity value, $Res Function(_$_ActiveCodeEntity) then) =
      __$$_ActiveCodeEntityCopyWithImpl<$Res>;
  @override
  $Res call({String code, bool isUsed, String? codeUsedAt});
}

/// @nodoc
class __$$_ActiveCodeEntityCopyWithImpl<$Res>
    extends _$ActiveCodeEntityCopyWithImpl<$Res>
    implements _$$_ActiveCodeEntityCopyWith<$Res> {
  __$$_ActiveCodeEntityCopyWithImpl(
      _$_ActiveCodeEntity _value, $Res Function(_$_ActiveCodeEntity) _then)
      : super(_value, (v) => _then(v as _$_ActiveCodeEntity));

  @override
  _$_ActiveCodeEntity get _value => super._value as _$_ActiveCodeEntity;

  @override
  $Res call({
    Object? code = freezed,
    Object? isUsed = freezed,
    Object? codeUsedAt = freezed,
  }) {
    return _then(_$_ActiveCodeEntity(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isUsed == freezed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      codeUsedAt: codeUsedAt == freezed
          ? _value.codeUsedAt
          : codeUsedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ActiveCodeEntity implements _ActiveCodeEntity {
  const _$_ActiveCodeEntity(this.code, this.isUsed, {this.codeUsedAt});

  @override
  final String code;
  @override
  final bool isUsed;
  @override
  final String? codeUsedAt;

  @override
  String toString() {
    return 'ActiveCodeEntity(code: $code, isUsed: $isUsed, codeUsedAt: $codeUsedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActiveCodeEntity &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.isUsed, isUsed) &&
            const DeepCollectionEquality()
                .equals(other.codeUsedAt, codeUsedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(isUsed),
      const DeepCollectionEquality().hash(codeUsedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ActiveCodeEntityCopyWith<_$_ActiveCodeEntity> get copyWith =>
      __$$_ActiveCodeEntityCopyWithImpl<_$_ActiveCodeEntity>(this, _$identity);
}

abstract class _ActiveCodeEntity implements ActiveCodeEntity {
  const factory _ActiveCodeEntity(final String code, final bool isUsed,
      {final String? codeUsedAt}) = _$_ActiveCodeEntity;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  bool get isUsed => throw _privateConstructorUsedError;
  @override
  String? get codeUsedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ActiveCodeEntityCopyWith<_$_ActiveCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
