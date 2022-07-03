// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NetworkIsarModel network) loaded,
    required TResult Function() error,
    required TResult Function(UserInfoEntity userInfoModel) loadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingInitial value) initial,
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingLoaded value) loaded,
    required TResult Function(SettingError value) error,
    required TResult Function(SettingStateLoadUserSuccess value)
        loadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;
}

/// @nodoc
abstract class _$$SettingInitialCopyWith<$Res> {
  factory _$$SettingInitialCopyWith(
          _$SettingInitial value, $Res Function(_$SettingInitial) then) =
      __$$SettingInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingInitialCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements _$$SettingInitialCopyWith<$Res> {
  __$$SettingInitialCopyWithImpl(
      _$SettingInitial _value, $Res Function(_$SettingInitial) _then)
      : super(_value, (v) => _then(v as _$SettingInitial));

  @override
  _$SettingInitial get _value => super._value as _$SettingInitial;
}

/// @nodoc

class _$SettingInitial implements SettingInitial {
  const _$SettingInitial();

  @override
  String toString() {
    return 'SettingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NetworkIsarModel network) loaded,
    required TResult Function() error,
    required TResult Function(UserInfoEntity userInfoModel) loadUserSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
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
    required TResult Function(SettingInitial value) initial,
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingLoaded value) loaded,
    required TResult Function(SettingError value) error,
    required TResult Function(SettingStateLoadUserSuccess value)
        loadUserSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SettingInitial implements SettingState {
  const factory SettingInitial() = _$SettingInitial;
}

/// @nodoc
abstract class _$$SettingLoadingCopyWith<$Res> {
  factory _$$SettingLoadingCopyWith(
          _$SettingLoading value, $Res Function(_$SettingLoading) then) =
      __$$SettingLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingLoadingCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements _$$SettingLoadingCopyWith<$Res> {
  __$$SettingLoadingCopyWithImpl(
      _$SettingLoading _value, $Res Function(_$SettingLoading) _then)
      : super(_value, (v) => _then(v as _$SettingLoading));

  @override
  _$SettingLoading get _value => super._value as _$SettingLoading;
}

/// @nodoc

class _$SettingLoading implements SettingLoading {
  const _$SettingLoading();

  @override
  String toString() {
    return 'SettingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NetworkIsarModel network) loaded,
    required TResult Function() error,
    required TResult Function(UserInfoEntity userInfoModel) loadUserSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
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
    required TResult Function(SettingInitial value) initial,
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingLoaded value) loaded,
    required TResult Function(SettingError value) error,
    required TResult Function(SettingStateLoadUserSuccess value)
        loadUserSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingLoading implements SettingState {
  const factory SettingLoading() = _$SettingLoading;
}

/// @nodoc
abstract class _$$SettingLoadedCopyWith<$Res> {
  factory _$$SettingLoadedCopyWith(
          _$SettingLoaded value, $Res Function(_$SettingLoaded) then) =
      __$$SettingLoadedCopyWithImpl<$Res>;
  $Res call({NetworkIsarModel network});
}

/// @nodoc
class __$$SettingLoadedCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements _$$SettingLoadedCopyWith<$Res> {
  __$$SettingLoadedCopyWithImpl(
      _$SettingLoaded _value, $Res Function(_$SettingLoaded) _then)
      : super(_value, (v) => _then(v as _$SettingLoaded));

  @override
  _$SettingLoaded get _value => super._value as _$SettingLoaded;

  @override
  $Res call({
    Object? network = freezed,
  }) {
    return _then(_$SettingLoaded(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkIsarModel,
    ));
  }
}

/// @nodoc

class _$SettingLoaded implements SettingLoaded {
  const _$SettingLoaded({required this.network});

  @override
  final NetworkIsarModel network;

  @override
  String toString() {
    return 'SettingState.loaded(network: $network)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingLoaded &&
            const DeepCollectionEquality().equals(other.network, network));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(network));

  @JsonKey(ignore: true)
  @override
  _$$SettingLoadedCopyWith<_$SettingLoaded> get copyWith =>
      __$$SettingLoadedCopyWithImpl<_$SettingLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NetworkIsarModel network) loaded,
    required TResult Function() error,
    required TResult Function(UserInfoEntity userInfoModel) loadUserSuccess,
  }) {
    return loaded(network);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
  }) {
    return loaded?.call(network);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(network);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingInitial value) initial,
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingLoaded value) loaded,
    required TResult Function(SettingError value) error,
    required TResult Function(SettingStateLoadUserSuccess value)
        loadUserSuccess,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingLoaded implements SettingState {
  const factory SettingLoaded({required final NetworkIsarModel network}) =
      _$SettingLoaded;

  NetworkIsarModel get network => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SettingLoadedCopyWith<_$SettingLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingErrorCopyWith<$Res> {
  factory _$$SettingErrorCopyWith(
          _$SettingError value, $Res Function(_$SettingError) then) =
      __$$SettingErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingErrorCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements _$$SettingErrorCopyWith<$Res> {
  __$$SettingErrorCopyWithImpl(
      _$SettingError _value, $Res Function(_$SettingError) _then)
      : super(_value, (v) => _then(v as _$SettingError));

  @override
  _$SettingError get _value => super._value as _$SettingError;
}

/// @nodoc

class _$SettingError implements SettingError {
  const _$SettingError();

  @override
  String toString() {
    return 'SettingState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NetworkIsarModel network) loaded,
    required TResult Function() error,
    required TResult Function(UserInfoEntity userInfoModel) loadUserSuccess,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingInitial value) initial,
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingLoaded value) loaded,
    required TResult Function(SettingError value) error,
    required TResult Function(SettingStateLoadUserSuccess value)
        loadUserSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingError implements SettingState {
  const factory SettingError() = _$SettingError;
}

/// @nodoc
abstract class _$$SettingStateLoadUserSuccessCopyWith<$Res> {
  factory _$$SettingStateLoadUserSuccessCopyWith(
          _$SettingStateLoadUserSuccess value,
          $Res Function(_$SettingStateLoadUserSuccess) then) =
      __$$SettingStateLoadUserSuccessCopyWithImpl<$Res>;
  $Res call({UserInfoEntity userInfoModel});
}

/// @nodoc
class __$$SettingStateLoadUserSuccessCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements _$$SettingStateLoadUserSuccessCopyWith<$Res> {
  __$$SettingStateLoadUserSuccessCopyWithImpl(
      _$SettingStateLoadUserSuccess _value,
      $Res Function(_$SettingStateLoadUserSuccess) _then)
      : super(_value, (v) => _then(v as _$SettingStateLoadUserSuccess));

  @override
  _$SettingStateLoadUserSuccess get _value =>
      super._value as _$SettingStateLoadUserSuccess;

  @override
  $Res call({
    Object? userInfoModel = freezed,
  }) {
    return _then(_$SettingStateLoadUserSuccess(
      userInfoModel == freezed
          ? _value.userInfoModel
          : userInfoModel // ignore: cast_nullable_to_non_nullable
              as UserInfoEntity,
    ));
  }
}

/// @nodoc

class _$SettingStateLoadUserSuccess implements SettingStateLoadUserSuccess {
  const _$SettingStateLoadUserSuccess(this.userInfoModel);

  @override
  final UserInfoEntity userInfoModel;

  @override
  String toString() {
    return 'SettingState.loadUserSuccess(userInfoModel: $userInfoModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingStateLoadUserSuccess &&
            const DeepCollectionEquality()
                .equals(other.userInfoModel, userInfoModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userInfoModel));

  @JsonKey(ignore: true)
  @override
  _$$SettingStateLoadUserSuccessCopyWith<_$SettingStateLoadUserSuccess>
      get copyWith => __$$SettingStateLoadUserSuccessCopyWithImpl<
          _$SettingStateLoadUserSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NetworkIsarModel network) loaded,
    required TResult Function() error,
    required TResult Function(UserInfoEntity userInfoModel) loadUserSuccess,
  }) {
    return loadUserSuccess(userInfoModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
  }) {
    return loadUserSuccess?.call(userInfoModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NetworkIsarModel network)? loaded,
    TResult Function()? error,
    TResult Function(UserInfoEntity userInfoModel)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (loadUserSuccess != null) {
      return loadUserSuccess(userInfoModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingInitial value) initial,
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingLoaded value) loaded,
    required TResult Function(SettingError value) error,
    required TResult Function(SettingStateLoadUserSuccess value)
        loadUserSuccess,
  }) {
    return loadUserSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
  }) {
    return loadUserSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingInitial value)? initial,
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingLoaded value)? loaded,
    TResult Function(SettingError value)? error,
    TResult Function(SettingStateLoadUserSuccess value)? loadUserSuccess,
    required TResult orElse(),
  }) {
    if (loadUserSuccess != null) {
      return loadUserSuccess(this);
    }
    return orElse();
  }
}

abstract class SettingStateLoadUserSuccess implements SettingState {
  const factory SettingStateLoadUserSuccess(
      final UserInfoEntity userInfoModel) = _$SettingStateLoadUserSuccess;

  UserInfoEntity get userInfoModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SettingStateLoadUserSuccessCopyWith<_$SettingStateLoadUserSuccess>
      get copyWith => throw _privateConstructorUsedError;
}
