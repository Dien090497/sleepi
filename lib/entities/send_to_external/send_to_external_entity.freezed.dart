// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send_to_external_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendToExternalEntity {
  String? get transactionHash => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  String? get addressFrom => throw _privateConstructorUsedError;
  String? get addressTo => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  double? get gasPrice => throw _privateConstructorUsedError;
  int? get maxGas => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendToExternalEntityCopyWith<SendToExternalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendToExternalEntityCopyWith<$Res> {
  factory $SendToExternalEntityCopyWith(SendToExternalEntity value,
          $Res Function(SendToExternalEntity) then) =
      _$SendToExternalEntityCopyWithImpl<$Res>;
  $Res call(
      {String? transactionHash,
      DateTime timeStamp,
      String? addressFrom,
      String? addressTo,
      double value,
      double? gasPrice,
      int? maxGas,
      int? status});
}

/// @nodoc
class _$SendToExternalEntityCopyWithImpl<$Res>
    implements $SendToExternalEntityCopyWith<$Res> {
  _$SendToExternalEntityCopyWithImpl(this._value, this._then);

  final SendToExternalEntity _value;
  // ignore: unused_field
  final $Res Function(SendToExternalEntity) _then;

  @override
  $Res call({
    Object? transactionHash = freezed,
    Object? timeStamp = freezed,
    Object? addressFrom = freezed,
    Object? addressTo = freezed,
    Object? value = freezed,
    Object? gasPrice = freezed,
    Object? maxGas = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      addressFrom: addressFrom == freezed
          ? _value.addressFrom
          : addressFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      addressTo: addressTo == freezed
          ? _value.addressTo
          : addressTo // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      gasPrice: gasPrice == freezed
          ? _value.gasPrice
          : gasPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxGas: maxGas == freezed
          ? _value.maxGas
          : maxGas // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_SendToExternalEntityCopyWith<$Res>
    implements $SendToExternalEntityCopyWith<$Res> {
  factory _$$_SendToExternalEntityCopyWith(_$_SendToExternalEntity value,
          $Res Function(_$_SendToExternalEntity) then) =
      __$$_SendToExternalEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? transactionHash,
      DateTime timeStamp,
      String? addressFrom,
      String? addressTo,
      double value,
      double? gasPrice,
      int? maxGas,
      int? status});
}

/// @nodoc
class __$$_SendToExternalEntityCopyWithImpl<$Res>
    extends _$SendToExternalEntityCopyWithImpl<$Res>
    implements _$$_SendToExternalEntityCopyWith<$Res> {
  __$$_SendToExternalEntityCopyWithImpl(_$_SendToExternalEntity _value,
      $Res Function(_$_SendToExternalEntity) _then)
      : super(_value, (v) => _then(v as _$_SendToExternalEntity));

  @override
  _$_SendToExternalEntity get _value => super._value as _$_SendToExternalEntity;

  @override
  $Res call({
    Object? transactionHash = freezed,
    Object? timeStamp = freezed,
    Object? addressFrom = freezed,
    Object? addressTo = freezed,
    Object? value = freezed,
    Object? gasPrice = freezed,
    Object? maxGas = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_SendToExternalEntity(
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      addressFrom: addressFrom == freezed
          ? _value.addressFrom
          : addressFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      addressTo: addressTo == freezed
          ? _value.addressTo
          : addressTo // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      gasPrice: gasPrice == freezed
          ? _value.gasPrice
          : gasPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxGas: maxGas == freezed
          ? _value.maxGas
          : maxGas // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SendToExternalEntity implements _SendToExternalEntity {
  const _$_SendToExternalEntity(
      {this.transactionHash,
      required this.timeStamp,
      this.addressFrom,
      this.addressTo,
      required this.value,
      this.gasPrice,
      this.maxGas,
      this.status});

  @override
  final String? transactionHash;
  @override
  final DateTime timeStamp;
  @override
  final String? addressFrom;
  @override
  final String? addressTo;
  @override
  final double value;
  @override
  final double? gasPrice;
  @override
  final int? maxGas;
  @override
  final int? status;

  @override
  String toString() {
    return 'SendToExternalEntity(transactionHash: $transactionHash, timeStamp: $timeStamp, addressFrom: $addressFrom, addressTo: $addressTo, value: $value, gasPrice: $gasPrice, maxGas: $maxGas, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendToExternalEntity &&
            const DeepCollectionEquality()
                .equals(other.transactionHash, transactionHash) &&
            const DeepCollectionEquality().equals(other.timeStamp, timeStamp) &&
            const DeepCollectionEquality()
                .equals(other.addressFrom, addressFrom) &&
            const DeepCollectionEquality().equals(other.addressTo, addressTo) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.gasPrice, gasPrice) &&
            const DeepCollectionEquality().equals(other.maxGas, maxGas) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionHash),
      const DeepCollectionEquality().hash(timeStamp),
      const DeepCollectionEquality().hash(addressFrom),
      const DeepCollectionEquality().hash(addressTo),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(gasPrice),
      const DeepCollectionEquality().hash(maxGas),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_SendToExternalEntityCopyWith<_$_SendToExternalEntity> get copyWith =>
      __$$_SendToExternalEntityCopyWithImpl<_$_SendToExternalEntity>(
          this, _$identity);
}

abstract class _SendToExternalEntity implements SendToExternalEntity {
  const factory _SendToExternalEntity(
      {final String? transactionHash,
      required final DateTime timeStamp,
      final String? addressFrom,
      final String? addressTo,
      required final double value,
      final double? gasPrice,
      final int? maxGas,
      final int? status}) = _$_SendToExternalEntity;

  @override
  String? get transactionHash => throw _privateConstructorUsedError;
  @override
  DateTime get timeStamp => throw _privateConstructorUsedError;
  @override
  String? get addressFrom => throw _privateConstructorUsedError;
  @override
  String? get addressTo => throw _privateConstructorUsedError;
  @override
  double get value => throw _privateConstructorUsedError;
  @override
  double? get gasPrice => throw _privateConstructorUsedError;
  @override
  int? get maxGas => throw _privateConstructorUsedError;
  @override
  int? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SendToExternalEntityCopyWith<_$_SendToExternalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
