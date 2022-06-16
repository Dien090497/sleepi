// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passcode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasscodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity wallet) done,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasscodeStateCopyWith<$Res> {
  factory $PasscodeStateCopyWith(
          PasscodeState value, $Res Function(PasscodeState) then) =
      _$PasscodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasscodeStateCopyWithImpl<$Res>
    implements $PasscodeStateCopyWith<$Res> {
  _$PasscodeStateCopyWithImpl(this._value, this._then);

  final PasscodeState _value;
  // ignore: unused_field
  final $Res Function(PasscodeState) _then;
}

/// @nodoc
abstract class _$$PasscodeStateInitialCopyWith<$Res> {
  factory _$$PasscodeStateInitialCopyWith(_$PasscodeStateInitial value,
          $Res Function(_$PasscodeStateInitial) then) =
      __$$PasscodeStateInitialCopyWithImpl<$Res>;
  $Res call({String passCode, String mnemonic, bool isLoading});
}

/// @nodoc
class __$$PasscodeStateInitialCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$PasscodeStateInitialCopyWith<$Res> {
  __$$PasscodeStateInitialCopyWithImpl(_$PasscodeStateInitial _value,
      $Res Function(_$PasscodeStateInitial) _then)
      : super(_value, (v) => _then(v as _$PasscodeStateInitial));

  @override
  _$PasscodeStateInitial get _value => super._value as _$PasscodeStateInitial;

  @override
  $Res call({
    Object? passCode = freezed,
    Object? mnemonic = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$PasscodeStateInitial(
      passCode == freezed
          ? _value.passCode
          : passCode // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonic: mnemonic == freezed
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PasscodeStateInitial
    with DiagnosticableTreeMixin
    implements PasscodeStateInitial {
  const _$PasscodeStateInitial(this.passCode,
      {required this.mnemonic, this.isLoading = false});

  @override
  final String passCode;
  @override
  final String mnemonic;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.initial(passCode: $passCode, mnemonic: $mnemonic, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PasscodeState.initial'))
      ..add(DiagnosticsProperty('passCode', passCode))
      ..add(DiagnosticsProperty('mnemonic', mnemonic))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasscodeStateInitial &&
            const DeepCollectionEquality().equals(other.passCode, passCode) &&
            const DeepCollectionEquality().equals(other.mnemonic, mnemonic) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(passCode),
      const DeepCollectionEquality().hash(mnemonic),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$PasscodeStateInitialCopyWith<_$PasscodeStateInitial> get copyWith =>
      __$$PasscodeStateInitialCopyWithImpl<_$PasscodeStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity wallet) done,
    required TResult Function(String msg) error,
  }) {
    return initial(passCode, mnemonic, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
  }) {
    return initial?.call(passCode, mnemonic, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(passCode, mnemonic, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PasscodeStateInitial implements PasscodeState {
  const factory PasscodeStateInitial(final String passCode,
      {required final String mnemonic,
      final bool isLoading}) = _$PasscodeStateInitial;

  String get passCode => throw _privateConstructorUsedError;
  String get mnemonic => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PasscodeStateInitialCopyWith<_$PasscodeStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$createPassCodeDoneCopyWith<$Res> {
  factory _$$createPassCodeDoneCopyWith(_$createPassCodeDone value,
          $Res Function(_$createPassCodeDone) then) =
      __$$createPassCodeDoneCopyWithImpl<$Res>;
  $Res call({WalletInfoEntity wallet});

  $WalletInfoEntityCopyWith<$Res> get wallet;
}

/// @nodoc
class __$$createPassCodeDoneCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$createPassCodeDoneCopyWith<$Res> {
  __$$createPassCodeDoneCopyWithImpl(
      _$createPassCodeDone _value, $Res Function(_$createPassCodeDone) _then)
      : super(_value, (v) => _then(v as _$createPassCodeDone));

  @override
  _$createPassCodeDone get _value => super._value as _$createPassCodeDone;

  @override
  $Res call({
    Object? wallet = freezed,
  }) {
    return _then(_$createPassCodeDone(
      wallet == freezed
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletInfoEntity,
    ));
  }

  @override
  $WalletInfoEntityCopyWith<$Res> get wallet {
    return $WalletInfoEntityCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value));
    });
  }
}

/// @nodoc

class _$createPassCodeDone
    with DiagnosticableTreeMixin
    implements createPassCodeDone {
  const _$createPassCodeDone(this.wallet);

  @override
  final WalletInfoEntity wallet;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.done(wallet: $wallet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PasscodeState.done'))
      ..add(DiagnosticsProperty('wallet', wallet));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$createPassCodeDone &&
            const DeepCollectionEquality().equals(other.wallet, wallet));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(wallet));

  @JsonKey(ignore: true)
  @override
  _$$createPassCodeDoneCopyWith<_$createPassCodeDone> get copyWith =>
      __$$createPassCodeDoneCopyWithImpl<_$createPassCodeDone>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity wallet) done,
    required TResult Function(String msg) error,
  }) {
    return done(wallet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
  }) {
    return done?.call(wallet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(wallet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class createPassCodeDone implements PasscodeState {
  const factory createPassCodeDone(final WalletInfoEntity wallet) =
      _$createPassCodeDone;

  WalletInfoEntity get wallet => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$createPassCodeDoneCopyWith<_$createPassCodeDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$createNewPassCodeErrorCopyWith<$Res> {
  factory _$$createNewPassCodeErrorCopyWith(_$createNewPassCodeError value,
          $Res Function(_$createNewPassCodeError) then) =
      __$$createNewPassCodeErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$createNewPassCodeErrorCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$createNewPassCodeErrorCopyWith<$Res> {
  __$$createNewPassCodeErrorCopyWithImpl(_$createNewPassCodeError _value,
      $Res Function(_$createNewPassCodeError) _then)
      : super(_value, (v) => _then(v as _$createNewPassCodeError));

  @override
  _$createNewPassCodeError get _value =>
      super._value as _$createNewPassCodeError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$createNewPassCodeError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$createNewPassCodeError
    with DiagnosticableTreeMixin
    implements createNewPassCodeError {
  const _$createNewPassCodeError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PasscodeState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$createNewPassCodeError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$createNewPassCodeErrorCopyWith<_$createNewPassCodeError> get copyWith =>
      __$$createNewPassCodeErrorCopyWithImpl<_$createNewPassCodeError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity wallet) done,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity wallet)? done,
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
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class createNewPassCodeError implements PasscodeState {
  const factory createNewPassCodeError(final String msg) =
      _$createNewPassCodeError;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$createNewPassCodeErrorCopyWith<_$createNewPassCodeError> get copyWith =>
      throw _privateConstructorUsedError;
}
