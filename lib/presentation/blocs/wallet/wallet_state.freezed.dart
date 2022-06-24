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
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)
        success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateEmpty value) empty,
    required TResult Function(WalletStateSuccess value) success,
    required TResult Function(WalletStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
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
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)
        success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
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
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateEmpty value) empty,
    required TResult Function(WalletStateSuccess value) success,
    required TResult Function(WalletStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
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
abstract class _$$WalletStateLoadingCopyWith<$Res> {
  factory _$$WalletStateLoadingCopyWith(_$WalletStateLoading value,
          $Res Function(_$WalletStateLoading) then) =
      __$$WalletStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletStateLoadingCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res>
    implements _$$WalletStateLoadingCopyWith<$Res> {
  __$$WalletStateLoadingCopyWithImpl(
      _$WalletStateLoading _value, $Res Function(_$WalletStateLoading) _then)
      : super(_value, (v) => _then(v as _$WalletStateLoading));

  @override
  _$WalletStateLoading get _value => super._value as _$WalletStateLoading;
}

/// @nodoc

class _$WalletStateLoading implements WalletStateLoading {
  const _$WalletStateLoading();

  @override
  String toString() {
    return 'WalletState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)
        success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
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
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateEmpty value) empty,
    required TResult Function(WalletStateSuccess value) success,
    required TResult Function(WalletStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WalletStateLoading implements WalletState {
  const factory WalletStateLoading() = _$WalletStateLoading;
}

/// @nodoc
abstract class _$$WalletStateEmptyCopyWith<$Res> {
  factory _$$WalletStateEmptyCopyWith(
          _$WalletStateEmpty value, $Res Function(_$WalletStateEmpty) then) =
      __$$WalletStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletStateEmptyCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res>
    implements _$$WalletStateEmptyCopyWith<$Res> {
  __$$WalletStateEmptyCopyWithImpl(
      _$WalletStateEmpty _value, $Res Function(_$WalletStateEmpty) _then)
      : super(_value, (v) => _then(v as _$WalletStateEmpty));

  @override
  _$WalletStateEmpty get _value => super._value as _$WalletStateEmpty;
}

/// @nodoc

class _$WalletStateEmpty implements WalletStateEmpty {
  const _$WalletStateEmpty();

  @override
  String toString() {
    return 'WalletState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)
        success,
    required TResult Function(String message) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateEmpty value) empty,
    required TResult Function(WalletStateSuccess value) success,
    required TResult Function(WalletStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class WalletStateEmpty implements WalletState {
  const factory WalletStateEmpty() = _$WalletStateEmpty;
}

/// @nodoc
abstract class _$$WalletStateSuccessCopyWith<$Res> {
  factory _$$WalletStateSuccessCopyWith(_$WalletStateSuccess value,
          $Res Function(_$WalletStateSuccess) then) =
      __$$WalletStateSuccessCopyWithImpl<$Res>;
  $Res call({WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList});

  $WalletInfoEntityCopyWith<$Res> get walletInfoEntity;
}

/// @nodoc
class __$$WalletStateSuccessCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res>
    implements _$$WalletStateSuccessCopyWith<$Res> {
  __$$WalletStateSuccessCopyWithImpl(
      _$WalletStateSuccess _value, $Res Function(_$WalletStateSuccess) _then)
      : super(_value, (v) => _then(v as _$WalletStateSuccess));

  @override
  _$WalletStateSuccess get _value => super._value as _$WalletStateSuccess;

  @override
  $Res call({
    Object? walletInfoEntity = freezed,
    Object? tokenList = freezed,
  }) {
    return _then(_$WalletStateSuccess(
      walletInfoEntity: walletInfoEntity == freezed
          ? _value.walletInfoEntity
          : walletInfoEntity // ignore: cast_nullable_to_non_nullable
              as WalletInfoEntity,
      tokenList: tokenList == freezed
          ? _value._tokenList
          : tokenList // ignore: cast_nullable_to_non_nullable
              as List<TokenEntity>,
    ));
  }

  @override
  $WalletInfoEntityCopyWith<$Res> get walletInfoEntity {
    return $WalletInfoEntityCopyWith<$Res>(_value.walletInfoEntity, (value) {
      return _then(_value.copyWith(walletInfoEntity: value));
    });
  }
}

/// @nodoc

class _$WalletStateSuccess implements WalletStateSuccess {
  const _$WalletStateSuccess(
      {required this.walletInfoEntity,
      required final List<TokenEntity> tokenList})
      : _tokenList = tokenList;

  @override
  final WalletInfoEntity walletInfoEntity;
  final List<TokenEntity> _tokenList;
  @override
  List<TokenEntity> get tokenList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokenList);
  }

  @override
  String toString() {
    return 'WalletState.success(walletInfoEntity: $walletInfoEntity, tokenList: $tokenList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateSuccess &&
            const DeepCollectionEquality()
                .equals(other.walletInfoEntity, walletInfoEntity) &&
            const DeepCollectionEquality()
                .equals(other._tokenList, _tokenList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(walletInfoEntity),
      const DeepCollectionEquality().hash(_tokenList));

  @JsonKey(ignore: true)
  @override
  _$$WalletStateSuccessCopyWith<_$WalletStateSuccess> get copyWith =>
      __$$WalletStateSuccessCopyWithImpl<_$WalletStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)
        success,
    required TResult Function(String message) error,
  }) {
    return success(walletInfoEntity, tokenList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
  }) {
    return success?.call(walletInfoEntity, tokenList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(walletInfoEntity, tokenList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateEmpty value) empty,
    required TResult Function(WalletStateSuccess value) success,
    required TResult Function(WalletStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WalletStateSuccess implements WalletState {
  const factory WalletStateSuccess(
      {required final WalletInfoEntity walletInfoEntity,
      required final List<TokenEntity> tokenList}) = _$WalletStateSuccess;

  WalletInfoEntity get walletInfoEntity => throw _privateConstructorUsedError;
  List<TokenEntity> get tokenList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$WalletStateSuccessCopyWith<_$WalletStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletStateErrorCopyWith<$Res> {
  factory _$$WalletStateErrorCopyWith(
          _$WalletStateError value, $Res Function(_$WalletStateError) then) =
      __$$WalletStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$WalletStateErrorCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res>
    implements _$$WalletStateErrorCopyWith<$Res> {
  __$$WalletStateErrorCopyWithImpl(
      _$WalletStateError _value, $Res Function(_$WalletStateError) _then)
      : super(_value, (v) => _then(v as _$WalletStateError));

  @override
  _$WalletStateError get _value => super._value as _$WalletStateError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$WalletStateError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletStateError implements WalletStateError {
  const _$WalletStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'WalletState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$WalletStateErrorCopyWith<_$WalletStateError> get copyWith =>
      __$$WalletStateErrorCopyWithImpl<_$WalletStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)
        success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            WalletInfoEntity walletInfoEntity, List<TokenEntity> tokenList)?
        success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateInitial value) initial,
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateEmpty value) empty,
    required TResult Function(WalletStateSuccess value) success,
    required TResult Function(WalletStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateInitial value)? initial,
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateEmpty value)? empty,
    TResult Function(WalletStateSuccess value)? success,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WalletStateError implements WalletState {
  const factory WalletStateError({required final String message}) =
      _$WalletStateError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$WalletStateErrorCopyWith<_$WalletStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
