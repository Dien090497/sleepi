// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)
        loaded,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$$UserInitialCopyWith<$Res> {
  factory _$$UserInitialCopyWith(
          _$UserInitial value, $Res Function(_$UserInitial) then) =
      __$$UserInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserInitialCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserInitialCopyWith<$Res> {
  __$$UserInitialCopyWithImpl(
      _$UserInitial _value, $Res Function(_$UserInitial) _then)
      : super(_value, (v) => _then(v as _$UserInitial));

  @override
  _$UserInitial get _value => super._value as _$UserInitial;
}

/// @nodoc

class _$UserInitial implements UserInitial {
  const _$UserInitial();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
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
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserInitial implements UserState {
  const factory UserInitial() = _$UserInitial;
}

/// @nodoc
abstract class _$$UserLoadedCopyWith<$Res> {
  factory _$$UserLoadedCopyWith(
          _$UserLoaded value, $Res Function(_$UserLoaded) then) =
      __$$UserLoadedCopyWithImpl<$Res>;
  $Res call(
      {UserInfoEntity userInfoEntity,
      List<TokenEntity> listTokens,
      bool loading});

  $UserInfoEntityCopyWith<$Res> get userInfoEntity;
}

/// @nodoc
class __$$UserLoadedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserLoadedCopyWith<$Res> {
  __$$UserLoadedCopyWithImpl(
      _$UserLoaded _value, $Res Function(_$UserLoaded) _then)
      : super(_value, (v) => _then(v as _$UserLoaded));

  @override
  _$UserLoaded get _value => super._value as _$UserLoaded;

  @override
  $Res call({
    Object? userInfoEntity = freezed,
    Object? listTokens = freezed,
    Object? loading = freezed,
  }) {
    return _then(_$UserLoaded(
      userInfoEntity == freezed
          ? _value.userInfoEntity
          : userInfoEntity // ignore: cast_nullable_to_non_nullable
              as UserInfoEntity,
      listTokens == freezed
          ? _value._listTokens
          : listTokens // ignore: cast_nullable_to_non_nullable
              as List<TokenEntity>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserInfoEntityCopyWith<$Res> get userInfoEntity {
    return $UserInfoEntityCopyWith<$Res>(_value.userInfoEntity, (value) {
      return _then(_value.copyWith(userInfoEntity: value));
    });
  }
}

/// @nodoc

class _$UserLoaded implements UserLoaded {
  const _$UserLoaded(this.userInfoEntity, final List<TokenEntity> listTokens,
      {this.loading = false})
      : _listTokens = listTokens;

  @override
  final UserInfoEntity userInfoEntity;
  final List<TokenEntity> _listTokens;
  @override
  List<TokenEntity> get listTokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTokens);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'UserState.loaded(userInfoEntity: $userInfoEntity, listTokens: $listTokens, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoaded &&
            const DeepCollectionEquality()
                .equals(other.userInfoEntity, userInfoEntity) &&
            const DeepCollectionEquality()
                .equals(other._listTokens, _listTokens) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userInfoEntity),
      const DeepCollectionEquality().hash(_listTokens),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$$UserLoadedCopyWith<_$UserLoaded> get copyWith =>
      __$$UserLoadedCopyWithImpl<_$UserLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return loaded(userInfoEntity, listTokens, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return loaded?.call(userInfoEntity, listTokens, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userInfoEntity, listTokens, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserLoaded implements UserState {
  const factory UserLoaded(
      final UserInfoEntity userInfoEntity, final List<TokenEntity> listTokens,
      {final bool loading}) = _$UserLoaded;

  UserInfoEntity get userInfoEntity => throw _privateConstructorUsedError;
  List<TokenEntity> get listTokens => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UserLoadedCopyWith<_$UserLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserErrorCopyWith<$Res> {
  factory _$$UserErrorCopyWith(
          _$UserError value, $Res Function(_$UserError) then) =
      __$$UserErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$UserErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserErrorCopyWith<$Res> {
  __$$UserErrorCopyWithImpl(
      _$UserError _value, $Res Function(_$UserError) _then)
      : super(_value, (v) => _then(v as _$UserError));

  @override
  _$UserError get _value => super._value as _$UserError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$UserError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserError implements UserError {
  const _$UserError(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'UserState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$UserErrorCopyWith<_$UserError> get copyWith =>
      __$$UserErrorCopyWithImpl<_$UserError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserInfoEntity userInfoEntity,
            List<TokenEntity> listTokens, bool loading)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserError implements UserState {
  const factory UserError(final String msg) = _$UserError;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UserErrorCopyWith<_$UserError> get copyWith =>
      throw _privateConstructorUsedError;
}
