// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'import_wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImportWalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(WalletInfoEntity entity,
            UserInfoEntity? userInfoEntity, List<TokenSpending> listTokens)
        success,
    required TResult Function(String mnemonic) verifyOtpSuccess,
    required TResult Function(String msg) errorOtp,
    required TResult Function(String msg) errorMnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportWalletInitial value) initial,
    required TResult Function(ImportWalletDone value) success,
    required TResult Function(ImportWalletVerifyOtpSuccess value)
        verifyOtpSuccess,
    required TResult Function(ImportWalletErrorOtp value) errorOtp,
    required TResult Function(ImportWalletErrorMnemonic value) errorMnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportWalletStateCopyWith<$Res> {
  factory $ImportWalletStateCopyWith(
          ImportWalletState value, $Res Function(ImportWalletState) then) =
      _$ImportWalletStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImportWalletStateCopyWithImpl<$Res>
    implements $ImportWalletStateCopyWith<$Res> {
  _$ImportWalletStateCopyWithImpl(this._value, this._then);

  final ImportWalletState _value;
  // ignore: unused_field
  final $Res Function(ImportWalletState) _then;
}

/// @nodoc
abstract class _$$ImportWalletInitialCopyWith<$Res> {
  factory _$$ImportWalletInitialCopyWith(_$ImportWalletInitial value,
          $Res Function(_$ImportWalletInitial) then) =
      __$$ImportWalletInitialCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$$ImportWalletInitialCopyWithImpl<$Res>
    extends _$ImportWalletStateCopyWithImpl<$Res>
    implements _$$ImportWalletInitialCopyWith<$Res> {
  __$$ImportWalletInitialCopyWithImpl(
      _$ImportWalletInitial _value, $Res Function(_$ImportWalletInitial) _then)
      : super(_value, (v) => _then(v as _$ImportWalletInitial));

  @override
  _$ImportWalletInitial get _value => super._value as _$ImportWalletInitial;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$ImportWalletInitial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ImportWalletInitial implements ImportWalletInitial {
  const _$ImportWalletInitial({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ImportWalletState.initial(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportWalletInitial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$ImportWalletInitialCopyWith<_$ImportWalletInitial> get copyWith =>
      __$$ImportWalletInitialCopyWithImpl<_$ImportWalletInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(WalletInfoEntity entity,
            UserInfoEntity? userInfoEntity, List<TokenSpending> listTokens)
        success,
    required TResult Function(String mnemonic) verifyOtpSuccess,
    required TResult Function(String msg) errorOtp,
    required TResult Function(String msg) errorMnemonic,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
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
    required TResult Function(ImportWalletInitial value) initial,
    required TResult Function(ImportWalletDone value) success,
    required TResult Function(ImportWalletVerifyOtpSuccess value)
        verifyOtpSuccess,
    required TResult Function(ImportWalletErrorOtp value) errorOtp,
    required TResult Function(ImportWalletErrorMnemonic value) errorMnemonic,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ImportWalletInitial implements ImportWalletState {
  const factory ImportWalletInitial({final bool isLoading}) =
      _$ImportWalletInitial;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$ImportWalletInitialCopyWith<_$ImportWalletInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportWalletDoneCopyWith<$Res> {
  factory _$$ImportWalletDoneCopyWith(
          _$ImportWalletDone value, $Res Function(_$ImportWalletDone) then) =
      __$$ImportWalletDoneCopyWithImpl<$Res>;
  $Res call(
      {WalletInfoEntity entity,
      UserInfoEntity? userInfoEntity,
      List<TokenSpending> listTokens});

  $WalletInfoEntityCopyWith<$Res> get entity;
  $UserInfoEntityCopyWith<$Res>? get userInfoEntity;
}

/// @nodoc
class __$$ImportWalletDoneCopyWithImpl<$Res>
    extends _$ImportWalletStateCopyWithImpl<$Res>
    implements _$$ImportWalletDoneCopyWith<$Res> {
  __$$ImportWalletDoneCopyWithImpl(
      _$ImportWalletDone _value, $Res Function(_$ImportWalletDone) _then)
      : super(_value, (v) => _then(v as _$ImportWalletDone));

  @override
  _$ImportWalletDone get _value => super._value as _$ImportWalletDone;

  @override
  $Res call({
    Object? entity = freezed,
    Object? userInfoEntity = freezed,
    Object? listTokens = freezed,
  }) {
    return _then(_$ImportWalletDone(
      entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as WalletInfoEntity,
      userInfoEntity == freezed
          ? _value.userInfoEntity
          : userInfoEntity // ignore: cast_nullable_to_non_nullable
              as UserInfoEntity?,
      listTokens == freezed
          ? _value._listTokens
          : listTokens // ignore: cast_nullable_to_non_nullable
              as List<TokenSpending>,
    ));
  }

  @override
  $WalletInfoEntityCopyWith<$Res> get entity {
    return $WalletInfoEntityCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value));
    });
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

class _$ImportWalletDone implements ImportWalletDone {
  const _$ImportWalletDone(
      this.entity, this.userInfoEntity, final List<TokenSpending> listTokens)
      : _listTokens = listTokens;

  @override
  final WalletInfoEntity entity;
  @override
  final UserInfoEntity? userInfoEntity;
  final List<TokenSpending> _listTokens;
  @override
  List<TokenSpending> get listTokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTokens);
  }

  @override
  String toString() {
    return 'ImportWalletState.success(entity: $entity, userInfoEntity: $userInfoEntity, listTokens: $listTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportWalletDone &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality()
                .equals(other.userInfoEntity, userInfoEntity) &&
            const DeepCollectionEquality()
                .equals(other._listTokens, _listTokens));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(userInfoEntity),
      const DeepCollectionEquality().hash(_listTokens));

  @JsonKey(ignore: true)
  @override
  _$$ImportWalletDoneCopyWith<_$ImportWalletDone> get copyWith =>
      __$$ImportWalletDoneCopyWithImpl<_$ImportWalletDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(WalletInfoEntity entity,
            UserInfoEntity? userInfoEntity, List<TokenSpending> listTokens)
        success,
    required TResult Function(String mnemonic) verifyOtpSuccess,
    required TResult Function(String msg) errorOtp,
    required TResult Function(String msg) errorMnemonic,
  }) {
    return success(entity, userInfoEntity, listTokens);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
  }) {
    return success?.call(entity, userInfoEntity, listTokens);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(entity, userInfoEntity, listTokens);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportWalletInitial value) initial,
    required TResult Function(ImportWalletDone value) success,
    required TResult Function(ImportWalletVerifyOtpSuccess value)
        verifyOtpSuccess,
    required TResult Function(ImportWalletErrorOtp value) errorOtp,
    required TResult Function(ImportWalletErrorMnemonic value) errorMnemonic,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ImportWalletDone implements ImportWalletState {
  const factory ImportWalletDone(
      final WalletInfoEntity entity,
      final UserInfoEntity? userInfoEntity,
      final List<TokenSpending> listTokens) = _$ImportWalletDone;

  WalletInfoEntity get entity;
  UserInfoEntity? get userInfoEntity;
  List<TokenSpending> get listTokens;
  @JsonKey(ignore: true)
  _$$ImportWalletDoneCopyWith<_$ImportWalletDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportWalletVerifyOtpSuccessCopyWith<$Res> {
  factory _$$ImportWalletVerifyOtpSuccessCopyWith(
          _$ImportWalletVerifyOtpSuccess value,
          $Res Function(_$ImportWalletVerifyOtpSuccess) then) =
      __$$ImportWalletVerifyOtpSuccessCopyWithImpl<$Res>;
  $Res call({String mnemonic});
}

/// @nodoc
class __$$ImportWalletVerifyOtpSuccessCopyWithImpl<$Res>
    extends _$ImportWalletStateCopyWithImpl<$Res>
    implements _$$ImportWalletVerifyOtpSuccessCopyWith<$Res> {
  __$$ImportWalletVerifyOtpSuccessCopyWithImpl(
      _$ImportWalletVerifyOtpSuccess _value,
      $Res Function(_$ImportWalletVerifyOtpSuccess) _then)
      : super(_value, (v) => _then(v as _$ImportWalletVerifyOtpSuccess));

  @override
  _$ImportWalletVerifyOtpSuccess get _value =>
      super._value as _$ImportWalletVerifyOtpSuccess;

  @override
  $Res call({
    Object? mnemonic = freezed,
  }) {
    return _then(_$ImportWalletVerifyOtpSuccess(
      mnemonic == freezed
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImportWalletVerifyOtpSuccess implements ImportWalletVerifyOtpSuccess {
  const _$ImportWalletVerifyOtpSuccess(this.mnemonic);

  @override
  final String mnemonic;

  @override
  String toString() {
    return 'ImportWalletState.verifyOtpSuccess(mnemonic: $mnemonic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportWalletVerifyOtpSuccess &&
            const DeepCollectionEquality().equals(other.mnemonic, mnemonic));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mnemonic));

  @JsonKey(ignore: true)
  @override
  _$$ImportWalletVerifyOtpSuccessCopyWith<_$ImportWalletVerifyOtpSuccess>
      get copyWith => __$$ImportWalletVerifyOtpSuccessCopyWithImpl<
          _$ImportWalletVerifyOtpSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(WalletInfoEntity entity,
            UserInfoEntity? userInfoEntity, List<TokenSpending> listTokens)
        success,
    required TResult Function(String mnemonic) verifyOtpSuccess,
    required TResult Function(String msg) errorOtp,
    required TResult Function(String msg) errorMnemonic,
  }) {
    return verifyOtpSuccess(mnemonic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
  }) {
    return verifyOtpSuccess?.call(mnemonic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (verifyOtpSuccess != null) {
      return verifyOtpSuccess(mnemonic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportWalletInitial value) initial,
    required TResult Function(ImportWalletDone value) success,
    required TResult Function(ImportWalletVerifyOtpSuccess value)
        verifyOtpSuccess,
    required TResult Function(ImportWalletErrorOtp value) errorOtp,
    required TResult Function(ImportWalletErrorMnemonic value) errorMnemonic,
  }) {
    return verifyOtpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
  }) {
    return verifyOtpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (verifyOtpSuccess != null) {
      return verifyOtpSuccess(this);
    }
    return orElse();
  }
}

abstract class ImportWalletVerifyOtpSuccess implements ImportWalletState {
  const factory ImportWalletVerifyOtpSuccess(final String mnemonic) =
      _$ImportWalletVerifyOtpSuccess;

  String get mnemonic;
  @JsonKey(ignore: true)
  _$$ImportWalletVerifyOtpSuccessCopyWith<_$ImportWalletVerifyOtpSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportWalletErrorOtpCopyWith<$Res> {
  factory _$$ImportWalletErrorOtpCopyWith(_$ImportWalletErrorOtp value,
          $Res Function(_$ImportWalletErrorOtp) then) =
      __$$ImportWalletErrorOtpCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$ImportWalletErrorOtpCopyWithImpl<$Res>
    extends _$ImportWalletStateCopyWithImpl<$Res>
    implements _$$ImportWalletErrorOtpCopyWith<$Res> {
  __$$ImportWalletErrorOtpCopyWithImpl(_$ImportWalletErrorOtp _value,
      $Res Function(_$ImportWalletErrorOtp) _then)
      : super(_value, (v) => _then(v as _$ImportWalletErrorOtp));

  @override
  _$ImportWalletErrorOtp get _value => super._value as _$ImportWalletErrorOtp;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$ImportWalletErrorOtp(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImportWalletErrorOtp implements ImportWalletErrorOtp {
  const _$ImportWalletErrorOtp(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'ImportWalletState.errorOtp(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportWalletErrorOtp &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$ImportWalletErrorOtpCopyWith<_$ImportWalletErrorOtp> get copyWith =>
      __$$ImportWalletErrorOtpCopyWithImpl<_$ImportWalletErrorOtp>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(WalletInfoEntity entity,
            UserInfoEntity? userInfoEntity, List<TokenSpending> listTokens)
        success,
    required TResult Function(String mnemonic) verifyOtpSuccess,
    required TResult Function(String msg) errorOtp,
    required TResult Function(String msg) errorMnemonic,
  }) {
    return errorOtp(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
  }) {
    return errorOtp?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (errorOtp != null) {
      return errorOtp(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportWalletInitial value) initial,
    required TResult Function(ImportWalletDone value) success,
    required TResult Function(ImportWalletVerifyOtpSuccess value)
        verifyOtpSuccess,
    required TResult Function(ImportWalletErrorOtp value) errorOtp,
    required TResult Function(ImportWalletErrorMnemonic value) errorMnemonic,
  }) {
    return errorOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
  }) {
    return errorOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (errorOtp != null) {
      return errorOtp(this);
    }
    return orElse();
  }
}

abstract class ImportWalletErrorOtp implements ImportWalletState {
  const factory ImportWalletErrorOtp(final String msg) = _$ImportWalletErrorOtp;

  String get msg;
  @JsonKey(ignore: true)
  _$$ImportWalletErrorOtpCopyWith<_$ImportWalletErrorOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportWalletErrorMnemonicCopyWith<$Res> {
  factory _$$ImportWalletErrorMnemonicCopyWith(
          _$ImportWalletErrorMnemonic value,
          $Res Function(_$ImportWalletErrorMnemonic) then) =
      __$$ImportWalletErrorMnemonicCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$ImportWalletErrorMnemonicCopyWithImpl<$Res>
    extends _$ImportWalletStateCopyWithImpl<$Res>
    implements _$$ImportWalletErrorMnemonicCopyWith<$Res> {
  __$$ImportWalletErrorMnemonicCopyWithImpl(_$ImportWalletErrorMnemonic _value,
      $Res Function(_$ImportWalletErrorMnemonic) _then)
      : super(_value, (v) => _then(v as _$ImportWalletErrorMnemonic));

  @override
  _$ImportWalletErrorMnemonic get _value =>
      super._value as _$ImportWalletErrorMnemonic;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$ImportWalletErrorMnemonic(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImportWalletErrorMnemonic implements ImportWalletErrorMnemonic {
  const _$ImportWalletErrorMnemonic(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'ImportWalletState.errorMnemonic(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportWalletErrorMnemonic &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$ImportWalletErrorMnemonicCopyWith<_$ImportWalletErrorMnemonic>
      get copyWith => __$$ImportWalletErrorMnemonicCopyWithImpl<
          _$ImportWalletErrorMnemonic>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(WalletInfoEntity entity,
            UserInfoEntity? userInfoEntity, List<TokenSpending> listTokens)
        success,
    required TResult Function(String mnemonic) verifyOtpSuccess,
    required TResult Function(String msg) errorOtp,
    required TResult Function(String msg) errorMnemonic,
  }) {
    return errorMnemonic(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
  }) {
    return errorMnemonic?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity, UserInfoEntity? userInfoEntity,
            List<TokenSpending> listTokens)?
        success,
    TResult Function(String mnemonic)? verifyOtpSuccess,
    TResult Function(String msg)? errorOtp,
    TResult Function(String msg)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (errorMnemonic != null) {
      return errorMnemonic(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImportWalletInitial value) initial,
    required TResult Function(ImportWalletDone value) success,
    required TResult Function(ImportWalletVerifyOtpSuccess value)
        verifyOtpSuccess,
    required TResult Function(ImportWalletErrorOtp value) errorOtp,
    required TResult Function(ImportWalletErrorMnemonic value) errorMnemonic,
  }) {
    return errorMnemonic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
  }) {
    return errorMnemonic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImportWalletInitial value)? initial,
    TResult Function(ImportWalletDone value)? success,
    TResult Function(ImportWalletVerifyOtpSuccess value)? verifyOtpSuccess,
    TResult Function(ImportWalletErrorOtp value)? errorOtp,
    TResult Function(ImportWalletErrorMnemonic value)? errorMnemonic,
    required TResult orElse(),
  }) {
    if (errorMnemonic != null) {
      return errorMnemonic(this);
    }
    return orElse();
  }
}

abstract class ImportWalletErrorMnemonic implements ImportWalletState {
  const factory ImportWalletErrorMnemonic(final String msg) =
      _$ImportWalletErrorMnemonic;

  String get msg;
  @JsonKey(ignore: true)
  _$$ImportWalletErrorMnemonicCopyWith<_$ImportWalletErrorMnemonic>
      get copyWith => throw _privateConstructorUsedError;
}
