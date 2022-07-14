// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transfer_spending_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransferSpendingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() toWalletSuccess,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSpendingStateInitial value) initial,
    required TResult Function(TransferSpendingStateLoading value) loading,
    required TResult Function(TransferSpendingStateToWalletSuccess value)
        toWalletSuccess,
    required TResult Function(TransferSpendingStateError value) error,
    required TResult Function(TransferSpendingStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferSpendingStateCopyWith<$Res> {
  factory $TransferSpendingStateCopyWith(TransferSpendingState value,
          $Res Function(TransferSpendingState) then) =
      _$TransferSpendingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransferSpendingStateCopyWithImpl<$Res>
    implements $TransferSpendingStateCopyWith<$Res> {
  _$TransferSpendingStateCopyWithImpl(this._value, this._then);

  final TransferSpendingState _value;
  // ignore: unused_field
  final $Res Function(TransferSpendingState) _then;
}

/// @nodoc
abstract class _$$TransferSpendingStateInitialCopyWith<$Res> {
  factory _$$TransferSpendingStateInitialCopyWith(
          _$TransferSpendingStateInitial value,
          $Res Function(_$TransferSpendingStateInitial) then) =
      __$$TransferSpendingStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferSpendingStateInitialCopyWithImpl<$Res>
    extends _$TransferSpendingStateCopyWithImpl<$Res>
    implements _$$TransferSpendingStateInitialCopyWith<$Res> {
  __$$TransferSpendingStateInitialCopyWithImpl(
      _$TransferSpendingStateInitial _value,
      $Res Function(_$TransferSpendingStateInitial) _then)
      : super(_value, (v) => _then(v as _$TransferSpendingStateInitial));

  @override
  _$TransferSpendingStateInitial get _value =>
      super._value as _$TransferSpendingStateInitial;
}

/// @nodoc

class _$TransferSpendingStateInitial implements TransferSpendingStateInitial {
  const _$TransferSpendingStateInitial();

  @override
  String toString() {
    return 'TransferSpendingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferSpendingStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() toWalletSuccess,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
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
    required TResult Function(TransferSpendingStateInitial value) initial,
    required TResult Function(TransferSpendingStateLoading value) loading,
    required TResult Function(TransferSpendingStateToWalletSuccess value)
        toWalletSuccess,
    required TResult Function(TransferSpendingStateError value) error,
    required TResult Function(TransferSpendingStateLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransferSpendingStateInitial implements TransferSpendingState {
  const factory TransferSpendingStateInitial() = _$TransferSpendingStateInitial;
}

/// @nodoc
abstract class _$$TransferSpendingStateLoadingCopyWith<$Res> {
  factory _$$TransferSpendingStateLoadingCopyWith(
          _$TransferSpendingStateLoading value,
          $Res Function(_$TransferSpendingStateLoading) then) =
      __$$TransferSpendingStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferSpendingStateLoadingCopyWithImpl<$Res>
    extends _$TransferSpendingStateCopyWithImpl<$Res>
    implements _$$TransferSpendingStateLoadingCopyWith<$Res> {
  __$$TransferSpendingStateLoadingCopyWithImpl(
      _$TransferSpendingStateLoading _value,
      $Res Function(_$TransferSpendingStateLoading) _then)
      : super(_value, (v) => _then(v as _$TransferSpendingStateLoading));

  @override
  _$TransferSpendingStateLoading get _value =>
      super._value as _$TransferSpendingStateLoading;
}

/// @nodoc

class _$TransferSpendingStateLoading implements TransferSpendingStateLoading {
  const _$TransferSpendingStateLoading();

  @override
  String toString() {
    return 'TransferSpendingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferSpendingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() toWalletSuccess,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
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
    required TResult Function(TransferSpendingStateInitial value) initial,
    required TResult Function(TransferSpendingStateLoading value) loading,
    required TResult Function(TransferSpendingStateToWalletSuccess value)
        toWalletSuccess,
    required TResult Function(TransferSpendingStateError value) error,
    required TResult Function(TransferSpendingStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransferSpendingStateLoading implements TransferSpendingState {
  const factory TransferSpendingStateLoading() = _$TransferSpendingStateLoading;
}

/// @nodoc
abstract class _$$TransferSpendingStateToWalletSuccessCopyWith<$Res> {
  factory _$$TransferSpendingStateToWalletSuccessCopyWith(
          _$TransferSpendingStateToWalletSuccess value,
          $Res Function(_$TransferSpendingStateToWalletSuccess) then) =
      __$$TransferSpendingStateToWalletSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferSpendingStateToWalletSuccessCopyWithImpl<$Res>
    extends _$TransferSpendingStateCopyWithImpl<$Res>
    implements _$$TransferSpendingStateToWalletSuccessCopyWith<$Res> {
  __$$TransferSpendingStateToWalletSuccessCopyWithImpl(
      _$TransferSpendingStateToWalletSuccess _value,
      $Res Function(_$TransferSpendingStateToWalletSuccess) _then)
      : super(
            _value, (v) => _then(v as _$TransferSpendingStateToWalletSuccess));

  @override
  _$TransferSpendingStateToWalletSuccess get _value =>
      super._value as _$TransferSpendingStateToWalletSuccess;
}

/// @nodoc

class _$TransferSpendingStateToWalletSuccess
    implements TransferSpendingStateToWalletSuccess {
  const _$TransferSpendingStateToWalletSuccess();

  @override
  String toString() {
    return 'TransferSpendingState.toWalletSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferSpendingStateToWalletSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() toWalletSuccess,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return toWalletSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return toWalletSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) {
    if (toWalletSuccess != null) {
      return toWalletSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSpendingStateInitial value) initial,
    required TResult Function(TransferSpendingStateLoading value) loading,
    required TResult Function(TransferSpendingStateToWalletSuccess value)
        toWalletSuccess,
    required TResult Function(TransferSpendingStateError value) error,
    required TResult Function(TransferSpendingStateLoaded value) loaded,
  }) {
    return toWalletSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
  }) {
    return toWalletSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (toWalletSuccess != null) {
      return toWalletSuccess(this);
    }
    return orElse();
  }
}

abstract class TransferSpendingStateToWalletSuccess
    implements TransferSpendingState {
  const factory TransferSpendingStateToWalletSuccess() =
      _$TransferSpendingStateToWalletSuccess;
}

/// @nodoc
abstract class _$$TransferSpendingStateErrorCopyWith<$Res> {
  factory _$$TransferSpendingStateErrorCopyWith(
          _$TransferSpendingStateError value,
          $Res Function(_$TransferSpendingStateError) then) =
      __$$TransferSpendingStateErrorCopyWithImpl<$Res>;
  $Res call({String message, String? typeError});
}

/// @nodoc
class __$$TransferSpendingStateErrorCopyWithImpl<$Res>
    extends _$TransferSpendingStateCopyWithImpl<$Res>
    implements _$$TransferSpendingStateErrorCopyWith<$Res> {
  __$$TransferSpendingStateErrorCopyWithImpl(
      _$TransferSpendingStateError _value,
      $Res Function(_$TransferSpendingStateError) _then)
      : super(_value, (v) => _then(v as _$TransferSpendingStateError));

  @override
  _$TransferSpendingStateError get _value =>
      super._value as _$TransferSpendingStateError;

  @override
  $Res call({
    Object? message = freezed,
    Object? typeError = freezed,
  }) {
    return _then(_$TransferSpendingStateError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      typeError: typeError == freezed
          ? _value.typeError
          : typeError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransferSpendingStateError implements TransferSpendingStateError {
  const _$TransferSpendingStateError({required this.message, this.typeError});

  @override
  final String message;
  @override
  final String? typeError;

  @override
  String toString() {
    return 'TransferSpendingState.error(message: $message, typeError: $typeError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferSpendingStateError &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.typeError, typeError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(typeError));

  @JsonKey(ignore: true)
  @override
  _$$TransferSpendingStateErrorCopyWith<_$TransferSpendingStateError>
      get copyWith => __$$TransferSpendingStateErrorCopyWithImpl<
          _$TransferSpendingStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() toWalletSuccess,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return error(message, typeError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return error?.call(message, typeError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, typeError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSpendingStateInitial value) initial,
    required TResult Function(TransferSpendingStateLoading value) loading,
    required TResult Function(TransferSpendingStateToWalletSuccess value)
        toWalletSuccess,
    required TResult Function(TransferSpendingStateError value) error,
    required TResult Function(TransferSpendingStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TransferSpendingStateError implements TransferSpendingState {
  const factory TransferSpendingStateError(
      {required final String message,
      final String? typeError}) = _$TransferSpendingStateError;

  String get message;
  String? get typeError;
  @JsonKey(ignore: true)
  _$$TransferSpendingStateErrorCopyWith<_$TransferSpendingStateError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferSpendingStateLoadedCopyWith<$Res> {
  factory _$$TransferSpendingStateLoadedCopyWith(
          _$TransferSpendingStateLoaded value,
          $Res Function(_$TransferSpendingStateLoaded) then) =
      __$$TransferSpendingStateLoadedCopyWithImpl<$Res>;
  $Res call({String? fee, TransferSpendingEntity? transferSpendingEntity});
}

/// @nodoc
class __$$TransferSpendingStateLoadedCopyWithImpl<$Res>
    extends _$TransferSpendingStateCopyWithImpl<$Res>
    implements _$$TransferSpendingStateLoadedCopyWith<$Res> {
  __$$TransferSpendingStateLoadedCopyWithImpl(
      _$TransferSpendingStateLoaded _value,
      $Res Function(_$TransferSpendingStateLoaded) _then)
      : super(_value, (v) => _then(v as _$TransferSpendingStateLoaded));

  @override
  _$TransferSpendingStateLoaded get _value =>
      super._value as _$TransferSpendingStateLoaded;

  @override
  $Res call({
    Object? fee = freezed,
    Object? transferSpendingEntity = freezed,
  }) {
    return _then(_$TransferSpendingStateLoaded(
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      transferSpendingEntity: transferSpendingEntity == freezed
          ? _value.transferSpendingEntity
          : transferSpendingEntity // ignore: cast_nullable_to_non_nullable
              as TransferSpendingEntity?,
    ));
  }
}

/// @nodoc

class _$TransferSpendingStateLoaded implements TransferSpendingStateLoaded {
  const _$TransferSpendingStateLoaded({this.fee, this.transferSpendingEntity});

  @override
  final String? fee;
  @override
  final TransferSpendingEntity? transferSpendingEntity;

  @override
  String toString() {
    return 'TransferSpendingState.loaded(fee: $fee, transferSpendingEntity: $transferSpendingEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferSpendingStateLoaded &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality()
                .equals(other.transferSpendingEntity, transferSpendingEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(transferSpendingEntity));

  @JsonKey(ignore: true)
  @override
  _$$TransferSpendingStateLoadedCopyWith<_$TransferSpendingStateLoaded>
      get copyWith => __$$TransferSpendingStateLoadedCopyWithImpl<
          _$TransferSpendingStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() toWalletSuccess,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return loaded(fee, transferSpendingEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return loaded?.call(fee, transferSpendingEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? toWalletSuccess,
    TResult Function(String message, String? typeError)? error,
    TResult Function(
            String? fee, TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(fee, transferSpendingEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSpendingStateInitial value) initial,
    required TResult Function(TransferSpendingStateLoading value) loading,
    required TResult Function(TransferSpendingStateToWalletSuccess value)
        toWalletSuccess,
    required TResult Function(TransferSpendingStateError value) error,
    required TResult Function(TransferSpendingStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSpendingStateInitial value)? initial,
    TResult Function(TransferSpendingStateLoading value)? loading,
    TResult Function(TransferSpendingStateToWalletSuccess value)?
        toWalletSuccess,
    TResult Function(TransferSpendingStateError value)? error,
    TResult Function(TransferSpendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TransferSpendingStateLoaded implements TransferSpendingState {
  const factory TransferSpendingStateLoaded(
          {final String? fee,
          final TransferSpendingEntity? transferSpendingEntity}) =
      _$TransferSpendingStateLoaded;

  String? get fee;
  TransferSpendingEntity? get transferSpendingEntity;
  @JsonKey(ignore: true)
  _$$TransferSpendingStateLoadedCopyWith<_$TransferSpendingStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}
