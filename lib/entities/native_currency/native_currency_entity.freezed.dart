// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'native_currency_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NativeCurrencyEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  bool get balanceUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NativeCurrencyEntityCopyWith<NativeCurrencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NativeCurrencyEntityCopyWith<$Res> {
  factory $NativeCurrencyEntityCopyWith(NativeCurrencyEntity value,
          $Res Function(NativeCurrencyEntity) then) =
      _$NativeCurrencyEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String symbol,
      int decimals,
      String icon,
      double balance,
      bool balanceUpdated});
}

/// @nodoc
class _$NativeCurrencyEntityCopyWithImpl<$Res>
    implements $NativeCurrencyEntityCopyWith<$Res> {
  _$NativeCurrencyEntityCopyWithImpl(this._value, this._then);

  final NativeCurrencyEntity _value;
  // ignore: unused_field
  final $Res Function(NativeCurrencyEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? decimals = freezed,
    Object? icon = freezed,
    Object? balance = freezed,
    Object? balanceUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      balanceUpdated: balanceUpdated == freezed
          ? _value.balanceUpdated
          : balanceUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_NativeCurrencyEntityCopyWith<$Res>
    implements $NativeCurrencyEntityCopyWith<$Res> {
  factory _$$_NativeCurrencyEntityCopyWith(_$_NativeCurrencyEntity value,
          $Res Function(_$_NativeCurrencyEntity) then) =
      __$$_NativeCurrencyEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String symbol,
      int decimals,
      String icon,
      double balance,
      bool balanceUpdated});
}

/// @nodoc
class __$$_NativeCurrencyEntityCopyWithImpl<$Res>
    extends _$NativeCurrencyEntityCopyWithImpl<$Res>
    implements _$$_NativeCurrencyEntityCopyWith<$Res> {
  __$$_NativeCurrencyEntityCopyWithImpl(_$_NativeCurrencyEntity _value,
      $Res Function(_$_NativeCurrencyEntity) _then)
      : super(_value, (v) => _then(v as _$_NativeCurrencyEntity));

  @override
  _$_NativeCurrencyEntity get _value => super._value as _$_NativeCurrencyEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? decimals = freezed,
    Object? icon = freezed,
    Object? balance = freezed,
    Object? balanceUpdated = freezed,
  }) {
    return _then(_$_NativeCurrencyEntity(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      balanceUpdated: balanceUpdated == freezed
          ? _value.balanceUpdated
          : balanceUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NativeCurrencyEntity
    with DiagnosticableTreeMixin
    implements _NativeCurrencyEntity {
  const _$_NativeCurrencyEntity(this.id, this.name, this.symbol, this.decimals,
      {required this.icon, required this.balance, this.balanceUpdated = false});

  @override
  final int id;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final int decimals;
  @override
  final String icon;
  @override
  final double balance;
  @override
  @JsonKey()
  final bool balanceUpdated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NativeCurrencyEntity(id: $id, name: $name, symbol: $symbol, decimals: $decimals, icon: $icon, balance: $balance, balanceUpdated: $balanceUpdated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NativeCurrencyEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('decimals', decimals))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('balanceUpdated', balanceUpdated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NativeCurrencyEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.decimals, decimals) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality()
                .equals(other.balanceUpdated, balanceUpdated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(decimals),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(balanceUpdated));

  @JsonKey(ignore: true)
  @override
  _$$_NativeCurrencyEntityCopyWith<_$_NativeCurrencyEntity> get copyWith =>
      __$$_NativeCurrencyEntityCopyWithImpl<_$_NativeCurrencyEntity>(
          this, _$identity);
}

abstract class _NativeCurrencyEntity implements NativeCurrencyEntity {
  const factory _NativeCurrencyEntity(
      final int id, final String name, final String symbol, final int decimals,
      {required final String icon,
      required final double balance,
      final bool balanceUpdated}) = _$_NativeCurrencyEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get symbol => throw _privateConstructorUsedError;
  @override
  int get decimals => throw _privateConstructorUsedError;
  @override
  String get icon => throw _privateConstructorUsedError;
  @override
  double get balance => throw _privateConstructorUsedError;
  @override
  bool get balanceUpdated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NativeCurrencyEntityCopyWith<_$_NativeCurrencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
