// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trade_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TradeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(double balance) getBalance,
    required TResult Function(double amountOutMin) getAmountOutMin,
    required TResult Function() success,
    required TResult Function(String msg) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeStateInitial value) initial,
    required TResult Function(swapTokenBalance value) getBalance,
    required TResult Function(tradeGetAmountOutMin value) getAmountOutMin,
    required TResult Function(swapTokenSuccess value) success,
    required TResult Function(swapTokenFail value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeStateCopyWith<$Res> {
  factory $TradeStateCopyWith(
          TradeState value, $Res Function(TradeState) then) =
      _$TradeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TradeStateCopyWithImpl<$Res> implements $TradeStateCopyWith<$Res> {
  _$TradeStateCopyWithImpl(this._value, this._then);

  final TradeState _value;
  // ignore: unused_field
  final $Res Function(TradeState) _then;
}

/// @nodoc
abstract class _$$TradeStateInitialCopyWith<$Res> {
  factory _$$TradeStateInitialCopyWith(
          _$TradeStateInitial value, $Res Function(_$TradeStateInitial) then) =
      __$$TradeStateInitialCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$$TradeStateInitialCopyWithImpl<$Res>
    extends _$TradeStateCopyWithImpl<$Res>
    implements _$$TradeStateInitialCopyWith<$Res> {
  __$$TradeStateInitialCopyWithImpl(
      _$TradeStateInitial _value, $Res Function(_$TradeStateInitial) _then)
      : super(_value, (v) => _then(v as _$TradeStateInitial));

  @override
  _$TradeStateInitial get _value => super._value as _$TradeStateInitial;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$TradeStateInitial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TradeStateInitial implements TradeStateInitial {
  const _$TradeStateInitial({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TradeState.initial(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeStateInitial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$TradeStateInitialCopyWith<_$TradeStateInitial> get copyWith =>
      __$$TradeStateInitialCopyWithImpl<_$TradeStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(double balance) getBalance,
    required TResult Function(double amountOutMin) getAmountOutMin,
    required TResult Function() success,
    required TResult Function(String msg) fail,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeStateInitial value) initial,
    required TResult Function(swapTokenBalance value) getBalance,
    required TResult Function(tradeGetAmountOutMin value) getAmountOutMin,
    required TResult Function(swapTokenSuccess value) success,
    required TResult Function(swapTokenFail value) fail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TradeStateInitial implements TradeState {
  const factory TradeStateInitial({final bool isLoading}) = _$TradeStateInitial;

  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TradeStateInitialCopyWith<_$TradeStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$swapTokenBalanceCopyWith<$Res> {
  factory _$$swapTokenBalanceCopyWith(
          _$swapTokenBalance value, $Res Function(_$swapTokenBalance) then) =
      __$$swapTokenBalanceCopyWithImpl<$Res>;
  $Res call({double balance});
}

/// @nodoc
class __$$swapTokenBalanceCopyWithImpl<$Res>
    extends _$TradeStateCopyWithImpl<$Res>
    implements _$$swapTokenBalanceCopyWith<$Res> {
  __$$swapTokenBalanceCopyWithImpl(
      _$swapTokenBalance _value, $Res Function(_$swapTokenBalance) _then)
      : super(_value, (v) => _then(v as _$swapTokenBalance));

  @override
  _$swapTokenBalance get _value => super._value as _$swapTokenBalance;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$swapTokenBalance(
      balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$swapTokenBalance implements swapTokenBalance {
  const _$swapTokenBalance(this.balance);

  @override
  final double balance;

  @override
  String toString() {
    return 'TradeState.getBalance(balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$swapTokenBalance &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$swapTokenBalanceCopyWith<_$swapTokenBalance> get copyWith =>
      __$$swapTokenBalanceCopyWithImpl<_$swapTokenBalance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(double balance) getBalance,
    required TResult Function(double amountOutMin) getAmountOutMin,
    required TResult Function() success,
    required TResult Function(String msg) fail,
  }) {
    return getBalance(balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
  }) {
    return getBalance?.call(balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (getBalance != null) {
      return getBalance(balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeStateInitial value) initial,
    required TResult Function(swapTokenBalance value) getBalance,
    required TResult Function(tradeGetAmountOutMin value) getAmountOutMin,
    required TResult Function(swapTokenSuccess value) success,
    required TResult Function(swapTokenFail value) fail,
  }) {
    return getBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
  }) {
    return getBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
    required TResult orElse(),
  }) {
    if (getBalance != null) {
      return getBalance(this);
    }
    return orElse();
  }
}

abstract class swapTokenBalance implements TradeState {
  const factory swapTokenBalance(final double balance) = _$swapTokenBalance;

  double get balance => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$swapTokenBalanceCopyWith<_$swapTokenBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$tradeGetAmountOutMinCopyWith<$Res> {
  factory _$$tradeGetAmountOutMinCopyWith(_$tradeGetAmountOutMin value,
          $Res Function(_$tradeGetAmountOutMin) then) =
      __$$tradeGetAmountOutMinCopyWithImpl<$Res>;
  $Res call({double amountOutMin});
}

/// @nodoc
class __$$tradeGetAmountOutMinCopyWithImpl<$Res>
    extends _$TradeStateCopyWithImpl<$Res>
    implements _$$tradeGetAmountOutMinCopyWith<$Res> {
  __$$tradeGetAmountOutMinCopyWithImpl(_$tradeGetAmountOutMin _value,
      $Res Function(_$tradeGetAmountOutMin) _then)
      : super(_value, (v) => _then(v as _$tradeGetAmountOutMin));

  @override
  _$tradeGetAmountOutMin get _value => super._value as _$tradeGetAmountOutMin;

  @override
  $Res call({
    Object? amountOutMin = freezed,
  }) {
    return _then(_$tradeGetAmountOutMin(
      amountOutMin == freezed
          ? _value.amountOutMin
          : amountOutMin // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$tradeGetAmountOutMin implements tradeGetAmountOutMin {
  const _$tradeGetAmountOutMin(this.amountOutMin);

  @override
  final double amountOutMin;

  @override
  String toString() {
    return 'TradeState.getAmountOutMin(amountOutMin: $amountOutMin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$tradeGetAmountOutMin &&
            const DeepCollectionEquality()
                .equals(other.amountOutMin, amountOutMin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(amountOutMin));

  @JsonKey(ignore: true)
  @override
  _$$tradeGetAmountOutMinCopyWith<_$tradeGetAmountOutMin> get copyWith =>
      __$$tradeGetAmountOutMinCopyWithImpl<_$tradeGetAmountOutMin>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(double balance) getBalance,
    required TResult Function(double amountOutMin) getAmountOutMin,
    required TResult Function() success,
    required TResult Function(String msg) fail,
  }) {
    return getAmountOutMin(amountOutMin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
  }) {
    return getAmountOutMin?.call(amountOutMin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (getAmountOutMin != null) {
      return getAmountOutMin(amountOutMin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeStateInitial value) initial,
    required TResult Function(swapTokenBalance value) getBalance,
    required TResult Function(tradeGetAmountOutMin value) getAmountOutMin,
    required TResult Function(swapTokenSuccess value) success,
    required TResult Function(swapTokenFail value) fail,
  }) {
    return getAmountOutMin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
  }) {
    return getAmountOutMin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
    required TResult orElse(),
  }) {
    if (getAmountOutMin != null) {
      return getAmountOutMin(this);
    }
    return orElse();
  }
}

abstract class tradeGetAmountOutMin implements TradeState {
  const factory tradeGetAmountOutMin(final double amountOutMin) =
      _$tradeGetAmountOutMin;

  double get amountOutMin => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$tradeGetAmountOutMinCopyWith<_$tradeGetAmountOutMin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$swapTokenSuccessCopyWith<$Res> {
  factory _$$swapTokenSuccessCopyWith(
          _$swapTokenSuccess value, $Res Function(_$swapTokenSuccess) then) =
      __$$swapTokenSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$swapTokenSuccessCopyWithImpl<$Res>
    extends _$TradeStateCopyWithImpl<$Res>
    implements _$$swapTokenSuccessCopyWith<$Res> {
  __$$swapTokenSuccessCopyWithImpl(
      _$swapTokenSuccess _value, $Res Function(_$swapTokenSuccess) _then)
      : super(_value, (v) => _then(v as _$swapTokenSuccess));

  @override
  _$swapTokenSuccess get _value => super._value as _$swapTokenSuccess;
}

/// @nodoc

class _$swapTokenSuccess implements swapTokenSuccess {
  const _$swapTokenSuccess();

  @override
  String toString() {
    return 'TradeState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$swapTokenSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(double balance) getBalance,
    required TResult Function(double amountOutMin) getAmountOutMin,
    required TResult Function() success,
    required TResult Function(String msg) fail,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeStateInitial value) initial,
    required TResult Function(swapTokenBalance value) getBalance,
    required TResult Function(tradeGetAmountOutMin value) getAmountOutMin,
    required TResult Function(swapTokenSuccess value) success,
    required TResult Function(swapTokenFail value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class swapTokenSuccess implements TradeState {
  const factory swapTokenSuccess() = _$swapTokenSuccess;
}

/// @nodoc
abstract class _$$swapTokenFailCopyWith<$Res> {
  factory _$$swapTokenFailCopyWith(
          _$swapTokenFail value, $Res Function(_$swapTokenFail) then) =
      __$$swapTokenFailCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$swapTokenFailCopyWithImpl<$Res> extends _$TradeStateCopyWithImpl<$Res>
    implements _$$swapTokenFailCopyWith<$Res> {
  __$$swapTokenFailCopyWithImpl(
      _$swapTokenFail _value, $Res Function(_$swapTokenFail) _then)
      : super(_value, (v) => _then(v as _$swapTokenFail));

  @override
  _$swapTokenFail get _value => super._value as _$swapTokenFail;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$swapTokenFail(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$swapTokenFail implements swapTokenFail {
  const _$swapTokenFail(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'TradeState.fail(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$swapTokenFail &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$swapTokenFailCopyWith<_$swapTokenFail> get copyWith =>
      __$$swapTokenFailCopyWithImpl<_$swapTokenFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(double balance) getBalance,
    required TResult Function(double amountOutMin) getAmountOutMin,
    required TResult Function() success,
    required TResult Function(String msg) fail,
  }) {
    return fail(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
  }) {
    return fail?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(double balance)? getBalance,
    TResult Function(double amountOutMin)? getAmountOutMin,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeStateInitial value) initial,
    required TResult Function(swapTokenBalance value) getBalance,
    required TResult Function(tradeGetAmountOutMin value) getAmountOutMin,
    required TResult Function(swapTokenSuccess value) success,
    required TResult Function(swapTokenFail value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeStateInitial value)? initial,
    TResult Function(swapTokenBalance value)? getBalance,
    TResult Function(tradeGetAmountOutMin value)? getAmountOutMin,
    TResult Function(swapTokenSuccess value)? success,
    TResult Function(swapTokenFail value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class swapTokenFail implements TradeState {
  const factory swapTokenFail(final String msg) = _$swapTokenFail;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$swapTokenFailCopyWith<_$swapTokenFail> get copyWith =>
      throw _privateConstructorUsedError;
}
