// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String walletIndex, String networkName, String coin)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String walletIndex, String networkName, String coin)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String walletIndex, String networkName, String coin)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res> implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

  final WalletState _value;
  // ignore: unused_field
  final $Res Function(WalletState) _then;
}

/// @nodoc
abstract class _$$WalletStateInitialCopyWith<$Res> {
  factory _$$WalletStateInitialCopyWith(_$WalletStateInitial value,
          $Res Function(_$WalletStateInitial) then) =
      __$$WalletStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletStateInitialCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res>
    implements _$$WalletStateInitialCopyWith<$Res> {
  __$$WalletStateInitialCopyWithImpl(
      _$WalletStateInitial _value, $Res Function(_$WalletStateInitial) _then)
      : super(_value, (v) => _then(v as _$WalletStateInitial));

  @override
  _$WalletStateInitial get _value => super._value as _$WalletStateInitial;
}

/// @nodoc

class _$WalletStateInitial implements WalletStateInitial {
  const _$WalletStateInitial();

  @override
  String toString() {
    return 'WalletState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String walletIndex, String networkName, String coin)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String walletIndex, String networkName, String coin)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String walletIndex, String networkName, String coin)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class WalletStateInitial implements WalletState {
  const factory WalletStateInitial() = _$WalletStateInitial;
}

/// @nodoc
abstract class _$$WalletStateLoadedCopyWith<$Res> {
  factory _$$WalletStateLoadedCopyWith(
          _$WalletStateLoaded value, $Res Function(_$WalletStateLoaded) then) =
      __$$WalletStateLoadedCopyWithImpl<$Res>;
  $Res call({String walletIndex, String networkName, String coin});
}

/// @nodoc
class __$$WalletStateLoadedCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res>
    implements _$$WalletStateLoadedCopyWith<$Res> {
  __$$WalletStateLoadedCopyWithImpl(
      _$WalletStateLoaded _value, $Res Function(_$WalletStateLoaded) _then)
      : super(_value, (v) => _then(v as _$WalletStateLoaded));

  @override
  _$WalletStateLoaded get _value => super._value as _$WalletStateLoaded;

  @override
  $Res call({
    Object? walletIndex = freezed,
    Object? networkName = freezed,
    Object? coin = freezed,
  }) {
    return _then(_$WalletStateLoaded(
      walletIndex: walletIndex == freezed
          ? _value.walletIndex
          : walletIndex // ignore: cast_nullable_to_non_nullable
              as String,
      networkName: networkName == freezed
          ? _value.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as String,
      coin: coin == freezed
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletStateLoaded implements WalletStateLoaded {
  const _$WalletStateLoaded(
      {required this.walletIndex,
      required this.networkName,
      required this.coin});

  @override
  final String walletIndex;
  @override
  final String networkName;
  @override
  final String coin;

  @override
  String toString() {
    return 'WalletState.loaded(walletIndex: $walletIndex, networkName: $networkName, coin: $coin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateLoaded &&
            const DeepCollectionEquality()
                .equals(other.walletIndex, walletIndex) &&
            const DeepCollectionEquality()
                .equals(other.networkName, networkName) &&
            const DeepCollectionEquality().equals(other.coin, coin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(walletIndex),
      const DeepCollectionEquality().hash(networkName),
      const DeepCollectionEquality().hash(coin));

  @JsonKey(ignore: true)
  @override
  _$$WalletStateLoadedCopyWith<_$WalletStateLoaded> get copyWith =>
      __$$WalletStateLoadedCopyWithImpl<_$WalletStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String walletIndex, String networkName, String coin)
        loaded,
  }) {
    return loaded(walletIndex, networkName, coin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String walletIndex, String networkName, String coin)?
        loaded,
  }) {
    return loaded?.call(walletIndex, networkName, coin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String walletIndex, String networkName, String coin)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(walletIndex, networkName, coin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class WalletStateLoaded implements WalletState {
  const factory WalletStateLoaded(
      {required final String walletIndex,
      required final String networkName,
      required final String coin}) = _$WalletStateLoaded;

  String get walletIndex => throw _privateConstructorUsedError;
  String get networkName => throw _privateConstructorUsedError;
  String get coin => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$WalletStateLoadedCopyWith<_$WalletStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
