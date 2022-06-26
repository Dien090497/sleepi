// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send_to_external_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendToExternalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendToExternalStateCopyWith<$Res> {
  factory $SendToExternalStateCopyWith(
          SendToExternalState value, $Res Function(SendToExternalState) then) =
      _$SendToExternalStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendToExternalStateCopyWithImpl<$Res>
    implements $SendToExternalStateCopyWith<$Res> {
  _$SendToExternalStateCopyWithImpl(this._value, this._then);

  final SendToExternalState _value;
  // ignore: unused_field
  final $Res Function(SendToExternalState) _then;
}

/// @nodoc
abstract class _$$sendToExternalStateInitialCopyWith<$Res> {
  factory _$$sendToExternalStateInitialCopyWith(
          _$sendToExternalStateInitial value,
          $Res Function(_$sendToExternalStateInitial) then) =
      __$$sendToExternalStateInitialCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$$sendToExternalStateInitialCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$sendToExternalStateInitialCopyWith<$Res> {
  __$$sendToExternalStateInitialCopyWithImpl(
      _$sendToExternalStateInitial _value,
      $Res Function(_$sendToExternalStateInitial) _then)
      : super(_value, (v) => _then(v as _$sendToExternalStateInitial));

  @override
  _$sendToExternalStateInitial get _value =>
      super._value as _$sendToExternalStateInitial;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$sendToExternalStateInitial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$sendToExternalStateInitial
    with DiagnosticableTreeMixin
    implements sendToExternalStateInitial {
  const _$sendToExternalStateInitial({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.initial(isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.initial'))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$sendToExternalStateInitial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$sendToExternalStateInitialCopyWith<_$sendToExternalStateInitial>
      get copyWith => __$$sendToExternalStateInitialCopyWithImpl<
          _$sendToExternalStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
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
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class sendToExternalStateInitial implements SendToExternalState {
  const factory sendToExternalStateInitial({final bool isLoading}) =
      _$sendToExternalStateInitial;

  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$sendToExternalStateInitialCopyWith<_$sendToExternalStateInitial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$sendToExternalDoneCopyWith<$Res> {
  factory _$$sendToExternalDoneCopyWith(_$sendToExternalDone value,
          $Res Function(_$sendToExternalDone) then) =
      __$$sendToExternalDoneCopyWithImpl<$Res>;
  $Res call({SendToExternalEntity entity});

  $SendToExternalEntityCopyWith<$Res> get entity;
}

/// @nodoc
class __$$sendToExternalDoneCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$sendToExternalDoneCopyWith<$Res> {
  __$$sendToExternalDoneCopyWithImpl(
      _$sendToExternalDone _value, $Res Function(_$sendToExternalDone) _then)
      : super(_value, (v) => _then(v as _$sendToExternalDone));

  @override
  _$sendToExternalDone get _value => super._value as _$sendToExternalDone;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_$sendToExternalDone(
      entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as SendToExternalEntity,
    ));
  }

  @override
  $SendToExternalEntityCopyWith<$Res> get entity {
    return $SendToExternalEntityCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value));
    });
  }
}

/// @nodoc

class _$sendToExternalDone
    with DiagnosticableTreeMixin
    implements sendToExternalDone {
  const _$sendToExternalDone(this.entity);

  @override
  final SendToExternalEntity entity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.done(entity: $entity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.done'))
      ..add(DiagnosticsProperty('entity', entity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$sendToExternalDone &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$$sendToExternalDoneCopyWith<_$sendToExternalDone> get copyWith =>
      __$$sendToExternalDoneCopyWithImpl<_$sendToExternalDone>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return done(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return done?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class sendToExternalDone implements SendToExternalState {
  const factory sendToExternalDone(final SendToExternalEntity entity) =
      _$sendToExternalDone;

  SendToExternalEntity get entity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$sendToExternalDoneCopyWith<_$sendToExternalDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendToExternalLoadingCopyWith<$Res> {
  factory _$$SendToExternalLoadingCopyWith(_$SendToExternalLoading value,
          $Res Function(_$SendToExternalLoading) then) =
      __$$SendToExternalLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendToExternalLoadingCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$SendToExternalLoadingCopyWith<$Res> {
  __$$SendToExternalLoadingCopyWithImpl(_$SendToExternalLoading _value,
      $Res Function(_$SendToExternalLoading) _then)
      : super(_value, (v) => _then(v as _$SendToExternalLoading));

  @override
  _$SendToExternalLoading get _value => super._value as _$SendToExternalLoading;
}

/// @nodoc

class _$SendToExternalLoading
    with DiagnosticableTreeMixin
    implements SendToExternalLoading {
  const _$SendToExternalLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SendToExternalState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendToExternalLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SendToExternalLoading implements SendToExternalState {
  const factory SendToExternalLoading() = _$SendToExternalLoading;
}

/// @nodoc
abstract class _$$getTokenBalanceCopyWith<$Res> {
  factory _$$getTokenBalanceCopyWith(
          _$getTokenBalance value, $Res Function(_$getTokenBalance) then) =
      __$$getTokenBalanceCopyWithImpl<$Res>;
  $Res call({double balance});
}

/// @nodoc
class __$$getTokenBalanceCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$getTokenBalanceCopyWith<$Res> {
  __$$getTokenBalanceCopyWithImpl(
      _$getTokenBalance _value, $Res Function(_$getTokenBalance) _then)
      : super(_value, (v) => _then(v as _$getTokenBalance));

  @override
  _$getTokenBalance get _value => super._value as _$getTokenBalance;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$getTokenBalance(
      balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$getTokenBalance
    with DiagnosticableTreeMixin
    implements getTokenBalance {
  const _$getTokenBalance(this.balance);

  @override
  final double balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.getBalance(balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.getBalance'))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getTokenBalance &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$getTokenBalanceCopyWith<_$getTokenBalance> get copyWith =>
      __$$getTokenBalanceCopyWithImpl<_$getTokenBalance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return getBalance(balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return getBalance?.call(balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
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
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return getBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return getBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (getBalance != null) {
      return getBalance(this);
    }
    return orElse();
  }
}

abstract class getTokenBalance implements SendToExternalState {
  const factory getTokenBalance(final double balance) = _$getTokenBalance;

  double get balance => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$getTokenBalanceCopyWith<_$getTokenBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getTokenSuccessCopyWith<$Res> {
  factory _$$getTokenSuccessCopyWith(
          _$getTokenSuccess value, $Res Function(_$getTokenSuccess) then) =
      __$$getTokenSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$getTokenSuccessCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$getTokenSuccessCopyWith<$Res> {
  __$$getTokenSuccessCopyWithImpl(
      _$getTokenSuccess _value, $Res Function(_$getTokenSuccess) _then)
      : super(_value, (v) => _then(v as _$getTokenSuccess));

  @override
  _$getTokenSuccess get _value => super._value as _$getTokenSuccess;
}

/// @nodoc

class _$getTokenSuccess
    with DiagnosticableTreeMixin
    implements getTokenSuccess {
  const _$getTokenSuccess();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SendToExternalState.success'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$getTokenSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
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
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class getTokenSuccess implements SendToExternalState {
  const factory getTokenSuccess() = _$getTokenSuccess;
}

/// @nodoc
abstract class _$$getTokenFailCopyWith<$Res> {
  factory _$$getTokenFailCopyWith(
          _$getTokenFail value, $Res Function(_$getTokenFail) then) =
      __$$getTokenFailCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$getTokenFailCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$getTokenFailCopyWith<$Res> {
  __$$getTokenFailCopyWithImpl(
      _$getTokenFail _value, $Res Function(_$getTokenFail) _then)
      : super(_value, (v) => _then(v as _$getTokenFail));

  @override
  _$getTokenFail get _value => super._value as _$getTokenFail;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$getTokenFail(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getTokenFail with DiagnosticableTreeMixin implements getTokenFail {
  const _$getTokenFail(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.fail(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.fail'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getTokenFail &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$getTokenFailCopyWith<_$getTokenFail> get copyWith =>
      __$$getTokenFailCopyWithImpl<_$getTokenFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return fail(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return fail?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
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
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class getTokenFail implements SendToExternalState {
  const factory getTokenFail(final String msg) = _$getTokenFail;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$getTokenFailCopyWith<_$getTokenFail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendToExternalCalculatorFeeCopyWith<$Res> {
  factory _$$SendToExternalCalculatorFeeCopyWith(
          _$SendToExternalCalculatorFee value,
          $Res Function(_$SendToExternalCalculatorFee) then) =
      __$$SendToExternalCalculatorFeeCopyWithImpl<$Res>;
  $Res call({int fee});
}

/// @nodoc
class __$$SendToExternalCalculatorFeeCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$SendToExternalCalculatorFeeCopyWith<$Res> {
  __$$SendToExternalCalculatorFeeCopyWithImpl(
      _$SendToExternalCalculatorFee _value,
      $Res Function(_$SendToExternalCalculatorFee) _then)
      : super(_value, (v) => _then(v as _$SendToExternalCalculatorFee));

  @override
  _$SendToExternalCalculatorFee get _value =>
      super._value as _$SendToExternalCalculatorFee;

  @override
  $Res call({
    Object? fee = freezed,
  }) {
    return _then(_$SendToExternalCalculatorFee(
      fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SendToExternalCalculatorFee
    with DiagnosticableTreeMixin
    implements SendToExternalCalculatorFee {
  const _$SendToExternalCalculatorFee(this.fee);

  @override
  final int fee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.calculatorFee(fee: $fee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.calculatorFee'))
      ..add(DiagnosticsProperty('fee', fee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendToExternalCalculatorFee &&
            const DeepCollectionEquality().equals(other.fee, fee));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(fee));

  @JsonKey(ignore: true)
  @override
  _$$SendToExternalCalculatorFeeCopyWith<_$SendToExternalCalculatorFee>
      get copyWith => __$$SendToExternalCalculatorFeeCopyWithImpl<
          _$SendToExternalCalculatorFee>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return calculatorFee(fee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return calculatorFee?.call(fee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (calculatorFee != null) {
      return calculatorFee(fee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return calculatorFee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return calculatorFee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (calculatorFee != null) {
      return calculatorFee(this);
    }
    return orElse();
  }
}

abstract class SendToExternalCalculatorFee implements SendToExternalState {
  const factory SendToExternalCalculatorFee(final int fee) =
      _$SendToExternalCalculatorFee;

  int get fee => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SendToExternalCalculatorFeeCopyWith<_$SendToExternalCalculatorFee>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendToExternalErrorToAddressCopyWith<$Res> {
  factory _$$SendToExternalErrorToAddressCopyWith(
          _$SendToExternalErrorToAddress value,
          $Res Function(_$SendToExternalErrorToAddress) then) =
      __$$SendToExternalErrorToAddressCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$SendToExternalErrorToAddressCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$SendToExternalErrorToAddressCopyWith<$Res> {
  __$$SendToExternalErrorToAddressCopyWithImpl(
      _$SendToExternalErrorToAddress _value,
      $Res Function(_$SendToExternalErrorToAddress) _then)
      : super(_value, (v) => _then(v as _$SendToExternalErrorToAddress));

  @override
  _$SendToExternalErrorToAddress get _value =>
      super._value as _$SendToExternalErrorToAddress;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$SendToExternalErrorToAddress(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendToExternalErrorToAddress
    with DiagnosticableTreeMixin
    implements SendToExternalErrorToAddress {
  const _$SendToExternalErrorToAddress(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.errorToAddress(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.errorToAddress'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendToExternalErrorToAddress &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$SendToExternalErrorToAddressCopyWith<_$SendToExternalErrorToAddress>
      get copyWith => __$$SendToExternalErrorToAddressCopyWithImpl<
          _$SendToExternalErrorToAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return errorToAddress(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return errorToAddress?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (errorToAddress != null) {
      return errorToAddress(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return errorToAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return errorToAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (errorToAddress != null) {
      return errorToAddress(this);
    }
    return orElse();
  }
}

abstract class SendToExternalErrorToAddress implements SendToExternalState {
  const factory SendToExternalErrorToAddress(final String msg) =
      _$SendToExternalErrorToAddress;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SendToExternalErrorToAddressCopyWith<_$SendToExternalErrorToAddress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendToExternalErrorValueInEtherCopyWith<$Res> {
  factory _$$SendToExternalErrorValueInEtherCopyWith(
          _$SendToExternalErrorValueInEther value,
          $Res Function(_$SendToExternalErrorValueInEther) then) =
      __$$SendToExternalErrorValueInEtherCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$SendToExternalErrorValueInEtherCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$SendToExternalErrorValueInEtherCopyWith<$Res> {
  __$$SendToExternalErrorValueInEtherCopyWithImpl(
      _$SendToExternalErrorValueInEther _value,
      $Res Function(_$SendToExternalErrorValueInEther) _then)
      : super(_value, (v) => _then(v as _$SendToExternalErrorValueInEther));

  @override
  _$SendToExternalErrorValueInEther get _value =>
      super._value as _$SendToExternalErrorValueInEther;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$SendToExternalErrorValueInEther(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendToExternalErrorValueInEther
    with DiagnosticableTreeMixin
    implements SendToExternalErrorValueInEther {
  const _$SendToExternalErrorValueInEther(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.errorValueInEther(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'SendToExternalState.errorValueInEther'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendToExternalErrorValueInEther &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$SendToExternalErrorValueInEtherCopyWith<_$SendToExternalErrorValueInEther>
      get copyWith => __$$SendToExternalErrorValueInEtherCopyWithImpl<
          _$SendToExternalErrorValueInEther>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(double balance) getBalance,
    required TResult Function() success,
    required TResult Function(String msg) fail,
    required TResult Function(int fee) calculatorFee,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return errorValueInEther(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return errorValueInEther?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(double balance)? getBalance,
    TResult Function()? success,
    TResult Function(String msg)? fail,
    TResult Function(int fee)? calculatorFee,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (errorValueInEther != null) {
      return errorValueInEther(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(getTokenBalance value) getBalance,
    required TResult Function(getTokenSuccess value) success,
    required TResult Function(getTokenFail value) fail,
    required TResult Function(SendToExternalCalculatorFee value) calculatorFee,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return errorValueInEther(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return errorValueInEther?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(getTokenBalance value)? getBalance,
    TResult Function(getTokenSuccess value)? success,
    TResult Function(getTokenFail value)? fail,
    TResult Function(SendToExternalCalculatorFee value)? calculatorFee,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (errorValueInEther != null) {
      return errorValueInEther(this);
    }
    return orElse();
  }
}

abstract class SendToExternalErrorValueInEther implements SendToExternalState {
  const factory SendToExternalErrorValueInEther(final String msg) =
      _$SendToExternalErrorValueInEther;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SendToExternalErrorValueInEtherCopyWith<_$SendToExternalErrorValueInEther>
      get copyWith => throw _privateConstructorUsedError;
}
