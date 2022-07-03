// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NFTEntity {
  String get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  BigInt get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NFTEntityCopyWith<NFTEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTEntityCopyWith<$Res> {
  factory $NFTEntityCopyWith(NFTEntity value, $Res Function(NFTEntity) then) =
      _$NFTEntityCopyWithImpl<$Res>;
  $Res call({String address, String name, String symbol, BigInt balance});
}

/// @nodoc
class _$NFTEntityCopyWithImpl<$Res> implements $NFTEntityCopyWith<$Res> {
  _$NFTEntityCopyWithImpl(this._value, this._then);

  final NFTEntity _value;
  // ignore: unused_field
  final $Res Function(NFTEntity) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
abstract class _$$_NFTEntityCopyWith<$Res> implements $NFTEntityCopyWith<$Res> {
  factory _$$_NFTEntityCopyWith(
          _$_NFTEntity value, $Res Function(_$_NFTEntity) then) =
      __$$_NFTEntityCopyWithImpl<$Res>;
  @override
  $Res call({String address, String name, String symbol, BigInt balance});
}

/// @nodoc
class __$$_NFTEntityCopyWithImpl<$Res> extends _$NFTEntityCopyWithImpl<$Res>
    implements _$$_NFTEntityCopyWith<$Res> {
  __$$_NFTEntityCopyWithImpl(
      _$_NFTEntity _value, $Res Function(_$_NFTEntity) _then)
      : super(_value, (v) => _then(v as _$_NFTEntity));

  @override
  _$_NFTEntity get _value => super._value as _$_NFTEntity;

  @override
  $Res call({
    Object? address = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$_NFTEntity(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$_NFTEntity with DiagnosticableTreeMixin implements _NFTEntity {
  const _$_NFTEntity(
      {required this.address,
      required this.name,
      required this.symbol,
      required this.balance});

  @override
  final String address;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final BigInt balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NFTEntity(address: $address, name: $name, symbol: $symbol, balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NFTEntity'))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NFTEntity &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_NFTEntityCopyWith<_$_NFTEntity> get copyWith =>
      __$$_NFTEntityCopyWithImpl<_$_NFTEntity>(this, _$identity);
}

abstract class _NFTEntity implements NFTEntity {
  const factory _NFTEntity(
      {required final String address,
      required final String name,
      required final String symbol,
      required final BigInt balance}) = _$_NFTEntity;

  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get symbol => throw _privateConstructorUsedError;
  @override
  BigInt get balance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NFTEntityCopyWith<_$_NFTEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
