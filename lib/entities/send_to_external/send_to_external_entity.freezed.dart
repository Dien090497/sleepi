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
  int? get chainId => throw _privateConstructorUsedError;
  String get transactionHash => throw _privateConstructorUsedError;
  String get toAddress => throw _privateConstructorUsedError;
  double get valueInEther => throw _privateConstructorUsedError;
  Credentials get credentials => throw _privateConstructorUsedError;
  double? get gasPrice => throw _privateConstructorUsedError;
  int? get maxGas => throw _privateConstructorUsedError;

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
      {int? chainId,
      String transactionHash,
      String toAddress,
      double valueInEther,
      Credentials credentials,
      double? gasPrice,
      int? maxGas});
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
    Object? chainId = freezed,
    Object? transactionHash = freezed,
    Object? toAddress = freezed,
    Object? valueInEther = freezed,
    Object? credentials = freezed,
    Object? gasPrice = freezed,
    Object? maxGas = freezed,
  }) {
    return _then(_value.copyWith(
      chainId: chainId == freezed
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      valueInEther: valueInEther == freezed
          ? _value.valueInEther
          : valueInEther // ignore: cast_nullable_to_non_nullable
              as double,
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
      gasPrice: gasPrice == freezed
          ? _value.gasPrice
          : gasPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxGas: maxGas == freezed
          ? _value.maxGas
          : maxGas // ignore: cast_nullable_to_non_nullable
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
      {int? chainId,
      String transactionHash,
      String toAddress,
      double valueInEther,
      Credentials credentials,
      double? gasPrice,
      int? maxGas});
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
    Object? chainId = freezed,
    Object? transactionHash = freezed,
    Object? toAddress = freezed,
    Object? valueInEther = freezed,
    Object? credentials = freezed,
    Object? gasPrice = freezed,
    Object? maxGas = freezed,
  }) {
    return _then(_$_SendToExternalEntity(
      chainId: chainId == freezed
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      valueInEther: valueInEther == freezed
          ? _value.valueInEther
          : valueInEther // ignore: cast_nullable_to_non_nullable
              as double,
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
      gasPrice: gasPrice == freezed
          ? _value.gasPrice
          : gasPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxGas: maxGas == freezed
          ? _value.maxGas
          : maxGas // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SendToExternalEntity
    with DiagnosticableTreeMixin
    implements _SendToExternalEntity {
  const _$_SendToExternalEntity(
      {this.chainId,
      required this.transactionHash,
      required this.toAddress,
      required this.valueInEther,
      required this.credentials,
      this.gasPrice,
      this.maxGas});

  @override
  final int? chainId;
  @override
  final String transactionHash;
  @override
  final String toAddress;
  @override
  final double valueInEther;
  @override
  final Credentials credentials;
  @override
  final double? gasPrice;
  @override
  final int? maxGas;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalEntity(chainId: $chainId, transactionHash: $transactionHash, toAddress: $toAddress, valueInEther: $valueInEther, credentials: $credentials, gasPrice: $gasPrice, maxGas: $maxGas)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalEntity'))
      ..add(DiagnosticsProperty('chainId', chainId))
      ..add(DiagnosticsProperty('transactionHash', transactionHash))
      ..add(DiagnosticsProperty('toAddress', toAddress))
      ..add(DiagnosticsProperty('valueInEther', valueInEther))
      ..add(DiagnosticsProperty('credentials', credentials))
      ..add(DiagnosticsProperty('gasPrice', gasPrice))
      ..add(DiagnosticsProperty('maxGas', maxGas));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendToExternalEntity &&
            const DeepCollectionEquality().equals(other.chainId, chainId) &&
            const DeepCollectionEquality()
                .equals(other.transactionHash, transactionHash) &&
            const DeepCollectionEquality().equals(other.toAddress, toAddress) &&
            const DeepCollectionEquality()
                .equals(other.valueInEther, valueInEther) &&
            const DeepCollectionEquality()
                .equals(other.credentials, credentials) &&
            const DeepCollectionEquality().equals(other.gasPrice, gasPrice) &&
            const DeepCollectionEquality().equals(other.maxGas, maxGas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chainId),
      const DeepCollectionEquality().hash(transactionHash),
      const DeepCollectionEquality().hash(toAddress),
      const DeepCollectionEquality().hash(valueInEther),
      const DeepCollectionEquality().hash(credentials),
      const DeepCollectionEquality().hash(gasPrice),
      const DeepCollectionEquality().hash(maxGas));

  @JsonKey(ignore: true)
  @override
  _$$_SendToExternalEntityCopyWith<_$_SendToExternalEntity> get copyWith =>
      __$$_SendToExternalEntityCopyWithImpl<_$_SendToExternalEntity>(
          this, _$identity);
}

abstract class _SendToExternalEntity implements SendToExternalEntity {
  const factory _SendToExternalEntity(
      {final int? chainId,
      required final String transactionHash,
      required final String toAddress,
      required final double valueInEther,
      required final Credentials credentials,
      final double? gasPrice,
      final int? maxGas}) = _$_SendToExternalEntity;

  @override
  int? get chainId => throw _privateConstructorUsedError;
  @override
  String get transactionHash => throw _privateConstructorUsedError;
  @override
  String get toAddress => throw _privateConstructorUsedError;
  @override
  double get valueInEther => throw _privateConstructorUsedError;
  @override
  Credentials get credentials => throw _privateConstructorUsedError;
  @override
  double? get gasPrice => throw _privateConstructorUsedError;
  @override
  int? get maxGas => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SendToExternalEntityCopyWith<_$_SendToExternalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
