// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)
        done,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashDone value) done,
    required TResult Function(SplashError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;
}

/// @nodoc
abstract class _$$SplashInitialCopyWith<$Res> {
  factory _$$SplashInitialCopyWith(
          _$SplashInitial value, $Res Function(_$SplashInitial) then) =
      __$$SplashInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashInitialCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res>
    implements _$$SplashInitialCopyWith<$Res> {
  __$$SplashInitialCopyWithImpl(
      _$SplashInitial _value, $Res Function(_$SplashInitial) _then)
      : super(_value, (v) => _then(v as _$SplashInitial));

  @override
  _$SplashInitial get _value => super._value as _$SplashInitial;
}

/// @nodoc

class _$SplashInitial with DiagnosticableTreeMixin implements SplashInitial {
  const _$SplashInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SplashState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)
        done,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
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
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashDone value) done,
    required TResult Function(SplashError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SplashInitial implements SplashState {
  const factory SplashInitial() = _$SplashInitial;
}

/// @nodoc
abstract class _$$SplashDoneCopyWith<$Res> {
  factory _$$SplashDoneCopyWith(
          _$SplashDone value, $Res Function(_$SplashDone) then) =
      __$$SplashDoneCopyWithImpl<$Res>;
  $Res call(
      {bool isSafeDevice,
      UserInfoEntity? userInfoEntity,
      List<TokenSpending> listTokens,
      UserStatusTrackingModel? userStatusTrackingModel});

  $UserInfoEntityCopyWith<$Res>? get userInfoEntity;
}

/// @nodoc
class __$$SplashDoneCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$SplashDoneCopyWith<$Res> {
  __$$SplashDoneCopyWithImpl(
      _$SplashDone _value, $Res Function(_$SplashDone) _then)
      : super(_value, (v) => _then(v as _$SplashDone));

  @override
  _$SplashDone get _value => super._value as _$SplashDone;

  @override
  $Res call({
    Object? isSafeDevice = freezed,
    Object? userInfoEntity = freezed,
    Object? listTokens = freezed,
    Object? userStatusTrackingModel = freezed,
  }) {
    return _then(_$SplashDone(
      isSafeDevice: isSafeDevice == freezed
          ? _value.isSafeDevice
          : isSafeDevice // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfoEntity: userInfoEntity == freezed
          ? _value.userInfoEntity
          : userInfoEntity // ignore: cast_nullable_to_non_nullable
              as UserInfoEntity?,
      listTokens: listTokens == freezed
          ? _value._listTokens
          : listTokens // ignore: cast_nullable_to_non_nullable
              as List<TokenSpending>,
      userStatusTrackingModel: userStatusTrackingModel == freezed
          ? _value.userStatusTrackingModel
          : userStatusTrackingModel // ignore: cast_nullable_to_non_nullable
              as UserStatusTrackingModel?,
    ));
  }

  @override
  $UserInfoEntityCopyWith<$Res>? get userInfoEntity {
    if (_value.userInfoEntity == null) {
      return null;
    }

    return $UserInfoEntityCopyWith<$Res>(_value.userInfoEntity!, (value) {
      return _then(_value.copyWith(userInfoEntity: value));
    });
  }
}

/// @nodoc

class _$SplashDone with DiagnosticableTreeMixin implements SplashDone {
  const _$SplashDone(
      {required this.isSafeDevice,
      required this.userInfoEntity,
      required final List<TokenSpending> listTokens,
      required this.userStatusTrackingModel})
      : _listTokens = listTokens;

  @override
  final bool isSafeDevice;
  @override
  final UserInfoEntity? userInfoEntity;
  final List<TokenSpending> _listTokens;
  @override
  List<TokenSpending> get listTokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTokens);
  }

  @override
  final UserStatusTrackingModel? userStatusTrackingModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashState.done(isSafeDevice: $isSafeDevice, userInfoEntity: $userInfoEntity, listTokens: $listTokens, userStatusTrackingModel: $userStatusTrackingModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashState.done'))
      ..add(DiagnosticsProperty('isSafeDevice', isSafeDevice))
      ..add(DiagnosticsProperty('userInfoEntity', userInfoEntity))
      ..add(DiagnosticsProperty('listTokens', listTokens))
      ..add(DiagnosticsProperty(
          'userStatusTrackingModel', userStatusTrackingModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashDone &&
            const DeepCollectionEquality()
                .equals(other.isSafeDevice, isSafeDevice) &&
            const DeepCollectionEquality()
                .equals(other.userInfoEntity, userInfoEntity) &&
            const DeepCollectionEquality()
                .equals(other._listTokens, _listTokens) &&
            const DeepCollectionEquality().equals(
                other.userStatusTrackingModel, userStatusTrackingModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSafeDevice),
      const DeepCollectionEquality().hash(userInfoEntity),
      const DeepCollectionEquality().hash(_listTokens),
      const DeepCollectionEquality().hash(userStatusTrackingModel));

  @JsonKey(ignore: true)
  @override
  _$$SplashDoneCopyWith<_$SplashDone> get copyWith =>
      __$$SplashDoneCopyWithImpl<_$SplashDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)
        done,
    required TResult Function(String msg) error,
  }) {
    return done(
        isSafeDevice, userInfoEntity, listTokens, userStatusTrackingModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
    TResult Function(String msg)? error,
  }) {
    return done?.call(
        isSafeDevice, userInfoEntity, listTokens, userStatusTrackingModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(
          isSafeDevice, userInfoEntity, listTokens, userStatusTrackingModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashDone value) done,
    required TResult Function(SplashError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class SplashDone implements SplashState {
  const factory SplashDone(
          {required final bool isSafeDevice,
          required final UserInfoEntity? userInfoEntity,
          required final List<TokenSpending> listTokens,
          required final UserStatusTrackingModel? userStatusTrackingModel}) =
      _$SplashDone;

  bool get isSafeDevice;
  UserInfoEntity? get userInfoEntity;
  List<TokenSpending> get listTokens;
  UserStatusTrackingModel? get userStatusTrackingModel;
  @JsonKey(ignore: true)
  _$$SplashDoneCopyWith<_$SplashDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashErrorCopyWith<$Res> {
  factory _$$SplashErrorCopyWith(
          _$SplashError value, $Res Function(_$SplashError) then) =
      __$$SplashErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$SplashErrorCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$SplashErrorCopyWith<$Res> {
  __$$SplashErrorCopyWithImpl(
      _$SplashError _value, $Res Function(_$SplashError) _then)
      : super(_value, (v) => _then(v as _$SplashError));

  @override
  _$SplashError get _value => super._value as _$SplashError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$SplashError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SplashError with DiagnosticableTreeMixin implements SplashError {
  const _$SplashError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$SplashErrorCopyWith<_$SplashError> get copyWith =>
      __$$SplashErrorCopyWithImpl<_$SplashError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)
        done,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            bool isSafeDevice,
            UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens,
            UserStatusTrackingModel? userStatusTrackingModel)?
        done,
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
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashDone value) done,
    required TResult Function(SplashError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashDone value)? done,
    TResult Function(SplashError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SplashError implements SplashState {
  const factory SplashError(final String msg) = _$SplashError;

  String get msg;
  @JsonKey(ignore: true)
  _$$SplashErrorCopyWith<_$SplashError> get copyWith =>
      throw _privateConstructorUsedError;
}
