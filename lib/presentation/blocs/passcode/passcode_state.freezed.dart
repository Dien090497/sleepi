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
    required TResult Function(bool isLoading) initial,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
    required TResult Function() inValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
    required TResult Function(checkPassCodeValid value) valid,
    required TResult Function(checkPassCodeInValid value) inValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
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
  $Res call({bool isLoading});
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
    Object? isLoading = freezed,
  }) {
    return _then(_$PasscodeStateInitial(
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
  const _$PasscodeStateInitial({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.initial(isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PasscodeState.initial'))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasscodeStateInitial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$PasscodeStateInitialCopyWith<_$PasscodeStateInitial> get copyWith =>
      __$$PasscodeStateInitialCopyWithImpl<_$PasscodeStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
    required TResult Function() inValid,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
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
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
    required TResult Function(checkPassCodeValid value) valid,
    required TResult Function(checkPassCodeInValid value) inValid,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PasscodeStateInitial implements PasscodeState {
  const factory PasscodeStateInitial({final bool isLoading}) =
      _$PasscodeStateInitial;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$PasscodeStateInitialCopyWith<_$PasscodeStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$createPassCodeDoneCopyWith<$Res> {
  factory _$$createPassCodeDoneCopyWith(_$createPassCodeDone value,
          $Res Function(_$createPassCodeDone) then) =
      __$$createPassCodeDoneCopyWithImpl<$Res>;
  $Res call({String passcode});
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
    Object? passcode = freezed,
  }) {
    return _then(_$createPassCodeDone(
      passcode == freezed
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$createPassCodeDone
    with DiagnosticableTreeMixin
    implements createPassCodeDone {
  const _$createPassCodeDone(this.passcode);

  @override
  final String passcode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.done(passcode: $passcode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PasscodeState.done'))
      ..add(DiagnosticsProperty('passcode', passcode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$createPassCodeDone &&
            const DeepCollectionEquality().equals(other.passcode, passcode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(passcode));

  @JsonKey(ignore: true)
  @override
  _$$createPassCodeDoneCopyWith<_$createPassCodeDone> get copyWith =>
      __$$createPassCodeDoneCopyWithImpl<_$createPassCodeDone>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
    required TResult Function() inValid,
  }) {
    return done(passcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
  }) {
    return done?.call(passcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(passcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
    required TResult Function(checkPassCodeValid value) valid,
    required TResult Function(checkPassCodeInValid value) inValid,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class createPassCodeDone implements PasscodeState {
  const factory createPassCodeDone(final String passcode) =
      _$createPassCodeDone;

  String get passcode;
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
    required TResult Function(bool isLoading) initial,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
    required TResult Function() inValid,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
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
    required TResult Function(checkPassCodeValid value) valid,
    required TResult Function(checkPassCodeInValid value) inValid,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
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

  String get msg;
  @JsonKey(ignore: true)
  _$$createNewPassCodeErrorCopyWith<_$createNewPassCodeError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$checkPassCodeValidCopyWith<$Res> {
  factory _$$checkPassCodeValidCopyWith(_$checkPassCodeValid value,
          $Res Function(_$checkPassCodeValid) then) =
      __$$checkPassCodeValidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$checkPassCodeValidCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$checkPassCodeValidCopyWith<$Res> {
  __$$checkPassCodeValidCopyWithImpl(
      _$checkPassCodeValid _value, $Res Function(_$checkPassCodeValid) _then)
      : super(_value, (v) => _then(v as _$checkPassCodeValid));

  @override
  _$checkPassCodeValid get _value => super._value as _$checkPassCodeValid;
}

/// @nodoc

class _$checkPassCodeValid
    with DiagnosticableTreeMixin
    implements checkPassCodeValid {
  const _$checkPassCodeValid();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.valid()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PasscodeState.valid'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$checkPassCodeValid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
    required TResult Function() inValid,
  }) {
    return valid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
  }) {
    return valid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
    required TResult Function(checkPassCodeValid value) valid,
    required TResult Function(checkPassCodeInValid value) inValid,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class checkPassCodeValid implements PasscodeState {
  const factory checkPassCodeValid() = _$checkPassCodeValid;
}

/// @nodoc
abstract class _$$checkPassCodeInValidCopyWith<$Res> {
  factory _$$checkPassCodeInValidCopyWith(_$checkPassCodeInValid value,
          $Res Function(_$checkPassCodeInValid) then) =
      __$$checkPassCodeInValidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$checkPassCodeInValidCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$checkPassCodeInValidCopyWith<$Res> {
  __$$checkPassCodeInValidCopyWithImpl(_$checkPassCodeInValid _value,
      $Res Function(_$checkPassCodeInValid) _then)
      : super(_value, (v) => _then(v as _$checkPassCodeInValid));

  @override
  _$checkPassCodeInValid get _value => super._value as _$checkPassCodeInValid;
}

/// @nodoc

class _$checkPassCodeInValid
    with DiagnosticableTreeMixin
    implements checkPassCodeInValid {
  const _$checkPassCodeInValid();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.inValid()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PasscodeState.inValid'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$checkPassCodeInValid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
    required TResult Function() inValid,
  }) {
    return inValid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
  }) {
    return inValid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    TResult Function()? inValid,
    required TResult orElse(),
  }) {
    if (inValid != null) {
      return inValid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeStateInitial value) initial,
    required TResult Function(createPassCodeDone value) done,
    required TResult Function(createNewPassCodeError value) error,
    required TResult Function(checkPassCodeValid value) valid,
    required TResult Function(checkPassCodeInValid value) inValid,
  }) {
    return inValid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
  }) {
    return inValid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeStateInitial value)? initial,
    TResult Function(createPassCodeDone value)? done,
    TResult Function(createNewPassCodeError value)? error,
    TResult Function(checkPassCodeValid value)? valid,
    TResult Function(checkPassCodeInValid value)? inValid,
    required TResult orElse(),
  }) {
    if (inValid != null) {
      return inValid(this);
    }
    return orElse();
  }
}

abstract class checkPassCodeInValid implements PasscodeState {
  const factory checkPassCodeInValid() = _$checkPassCodeInValid;
}
