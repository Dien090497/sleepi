// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenEntity {
  int? get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  List<String> get txns => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenEntityCopyWith<TokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenEntityCopyWith<$Res> {
  factory $TokenEntityCopyWith(
          TokenEntity value, $Res Function(TokenEntity) then) =
      _$TokenEntityCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String address,
      String displayName,
      String name,
      String symbol,
      String icon,
      int balance,
      List<String> txns});
}

/// @nodoc
class _$TokenEntityCopyWithImpl<$Res> implements $TokenEntityCopyWith<$Res> {
  _$TokenEntityCopyWithImpl(this._value, this._then);

  final TokenEntity _value;
  // ignore: unused_field
  final $Res Function(TokenEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? displayName = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? icon = freezed,
    Object? balance = freezed,
    Object? txns = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      txns: txns == freezed
          ? _value.txns
          : txns // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_TokenEntityCopyWith<$Res>
    implements $TokenEntityCopyWith<$Res> {
  factory _$$_TokenEntityCopyWith(
          _$_TokenEntity value, $Res Function(_$_TokenEntity) then) =
      __$$_TokenEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String address,
      String displayName,
      String name,
      String symbol,
      String icon,
      int balance,
      List<String> txns});
}

/// @nodoc
class __$$_TokenEntityCopyWithImpl<$Res> extends _$TokenEntityCopyWithImpl<$Res>
    implements _$$_TokenEntityCopyWith<$Res> {
  __$$_TokenEntityCopyWithImpl(
      _$_TokenEntity _value, $Res Function(_$_TokenEntity) _then)
      : super(_value, (v) => _then(v as _$_TokenEntity));

  @override
  _$_TokenEntity get _value => super._value as _$_TokenEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? displayName = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? icon = freezed,
    Object? balance = freezed,
    Object? txns = freezed,
  }) {
    return _then(_$_TokenEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      txns: txns == freezed
          ? _value._txns
          : txns // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_TokenEntity with DiagnosticableTreeMixin implements _TokenEntity {
  const _$_TokenEntity(
      {this.id,
      required this.address,
      required this.displayName,
      required this.name,
      required this.symbol,
      required this.icon,
      required this.balance,
      final List<String> txns = const []})
      : _txns = txns;

  @override
  final int? id;
  @override
  final String address;
  @override
  final String displayName;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final String icon;
  @override
  final int balance;
  final List<String> _txns;
  @override
  @JsonKey()
  List<String> get txns {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_txns);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TokenEntity(id: $id, address: $address, displayName: $displayName, name: $name, symbol: $symbol, icon: $icon, balance: $balance, txns: $txns)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TokenEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('txns', txns));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality().equals(other._txns, _txns));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(_txns));

  @JsonKey(ignore: true)
  @override
  _$$_TokenEntityCopyWith<_$_TokenEntity> get copyWith =>
      __$$_TokenEntityCopyWithImpl<_$_TokenEntity>(this, _$identity);
}

abstract class _TokenEntity implements TokenEntity {
  const factory _TokenEntity(
      {final int? id,
      required final String address,
      required final String displayName,
      required final String name,
      required final String symbol,
      required final String icon,
      required final int balance,
      final List<String> txns}) = _$_TokenEntity;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get displayName => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get symbol => throw _privateConstructorUsedError;
  @override
  String get icon => throw _privateConstructorUsedError;
  @override
  int get balance => throw _privateConstructorUsedError;
  @override
  List<String> get txns => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TokenEntityCopyWith<_$_TokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
