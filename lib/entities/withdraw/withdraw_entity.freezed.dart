// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'withdraw_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WithdrawEntity {
  String get txHash => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WithdrawEntityCopyWith<WithdrawEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawEntityCopyWith<$Res> {
  factory $WithdrawEntityCopyWith(
          WithdrawEntity value, $Res Function(WithdrawEntity) then) =
      _$WithdrawEntityCopyWithImpl<$Res>;
  $Res call({String txHash, String amount, String time});
}

/// @nodoc
class _$WithdrawEntityCopyWithImpl<$Res>
    implements $WithdrawEntityCopyWith<$Res> {
  _$WithdrawEntityCopyWithImpl(this._value, this._then);

  final WithdrawEntity _value;
  // ignore: unused_field
  final $Res Function(WithdrawEntity) _then;

  @override
  $Res call({
    Object? txHash = freezed,
    Object? amount = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      txHash: txHash == freezed
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WithdrawEntityCopyWith<$Res>
    implements $WithdrawEntityCopyWith<$Res> {
  factory _$$_WithdrawEntityCopyWith(
          _$_WithdrawEntity value, $Res Function(_$_WithdrawEntity) then) =
      __$$_WithdrawEntityCopyWithImpl<$Res>;
  @override
  $Res call({String txHash, String amount, String time});
}

/// @nodoc
class __$$_WithdrawEntityCopyWithImpl<$Res>
    extends _$WithdrawEntityCopyWithImpl<$Res>
    implements _$$_WithdrawEntityCopyWith<$Res> {
  __$$_WithdrawEntityCopyWithImpl(
      _$_WithdrawEntity _value, $Res Function(_$_WithdrawEntity) _then)
      : super(_value, (v) => _then(v as _$_WithdrawEntity));

  @override
  _$_WithdrawEntity get _value => super._value as _$_WithdrawEntity;

  @override
  $Res call({
    Object? txHash = freezed,
    Object? amount = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_WithdrawEntity(
      txHash: txHash == freezed
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WithdrawEntity implements _WithdrawEntity {
  const _$_WithdrawEntity(
      {required this.txHash, required this.amount, required this.time});

  @override
  final String txHash;
  @override
  final String amount;
  @override
  final String time;

  @override
  String toString() {
    return 'WithdrawEntity(txHash: $txHash, amount: $amount, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WithdrawEntity &&
            const DeepCollectionEquality().equals(other.txHash, txHash) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(txHash),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_WithdrawEntityCopyWith<_$_WithdrawEntity> get copyWith =>
      __$$_WithdrawEntityCopyWithImpl<_$_WithdrawEntity>(this, _$identity);
}

abstract class _WithdrawEntity implements WithdrawEntity {
  const factory _WithdrawEntity(
      {required final String txHash,
      required final String amount,
      required final String time}) = _$_WithdrawEntity;

  @override
  String get txHash;
  @override
  String get amount;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_WithdrawEntityCopyWith<_$_WithdrawEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
