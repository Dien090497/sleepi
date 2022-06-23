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
    required TResult Function(int balance) getSuccess,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(int balance)? getSuccess,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(int balance)? getSuccess,
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
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    required TResult Function(int balance) getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    required TResult Function(int balance) getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    required TResult Function(int balance) getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
abstract class _$$SendToExternalGetSuccessCopyWith<$Res> {
  factory _$$SendToExternalGetSuccessCopyWith(_$SendToExternalGetSuccess value,
          $Res Function(_$SendToExternalGetSuccess) then) =
      __$$SendToExternalGetSuccessCopyWithImpl<$Res>;
  $Res call({int balance});
}

/// @nodoc
class __$$SendToExternalGetSuccessCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$SendToExternalGetSuccessCopyWith<$Res> {
  __$$SendToExternalGetSuccessCopyWithImpl(_$SendToExternalGetSuccess _value,
      $Res Function(_$SendToExternalGetSuccess) _then)
      : super(_value, (v) => _then(v as _$SendToExternalGetSuccess));

  @override
  _$SendToExternalGetSuccess get _value =>
      super._value as _$SendToExternalGetSuccess;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$SendToExternalGetSuccess(
      balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SendToExternalGetSuccess
    with DiagnosticableTreeMixin
    implements SendToExternalGetSuccess {
  const _$SendToExternalGetSuccess(this.balance);

  @override
  final int balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.getSuccess(balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.getSuccess'))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendToExternalGetSuccess &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$SendToExternalGetSuccessCopyWith<_$SendToExternalGetSuccess>
      get copyWith =>
          __$$SendToExternalGetSuccessCopyWithImpl<_$SendToExternalGetSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function() loading,
    required TResult Function(int balance) getSuccess,
    required TResult Function(String msg) errorToAddress,
    required TResult Function(String msg) errorValueInEther,
  }) {
    return getSuccess(balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(int balance)? getSuccess,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
  }) {
    return getSuccess?.call(balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function()? loading,
    TResult Function(int balance)? getSuccess,
    TResult Function(String msg)? errorToAddress,
    TResult Function(String msg)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (getSuccess != null) {
      return getSuccess(balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(SendToExternalLoading value) loading,
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
    required TResult Function(SendToExternalErrorToAddress value)
        errorToAddress,
    required TResult Function(SendToExternalErrorValueInEther value)
        errorValueInEther,
  }) {
    return getSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
  }) {
    return getSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(SendToExternalLoading value)? loading,
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
    TResult Function(SendToExternalErrorToAddress value)? errorToAddress,
    TResult Function(SendToExternalErrorValueInEther value)? errorValueInEther,
    required TResult orElse(),
  }) {
    if (getSuccess != null) {
      return getSuccess(this);
    }
    return orElse();
  }
}

abstract class SendToExternalGetSuccess implements SendToExternalState {
  const factory SendToExternalGetSuccess(final int balance) =
      _$SendToExternalGetSuccess;

  int get balance => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SendToExternalGetSuccessCopyWith<_$SendToExternalGetSuccess>
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
    required TResult Function(int balance) getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    required TResult Function(int balance) getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    TResult Function(int balance)? getSuccess,
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
    required TResult Function(SendToExternalGetSuccess value) getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
    TResult Function(SendToExternalGetSuccess value)? getSuccess,
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
