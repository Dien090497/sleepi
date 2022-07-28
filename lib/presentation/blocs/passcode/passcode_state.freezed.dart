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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeInitial value) initial,
    required TResult Function(PasscodeLoading value) loading,
    required TResult Function(PasscodeDone value) done,
    required TResult Function(PasscodeError value) error,
    required TResult Function(PasscodeValid value) valid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
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
abstract class _$$PasscodeInitialCopyWith<$Res> {
  factory _$$PasscodeInitialCopyWith(
          _$PasscodeInitial value, $Res Function(_$PasscodeInitial) then) =
      __$$PasscodeInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasscodeInitialCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$PasscodeInitialCopyWith<$Res> {
  __$$PasscodeInitialCopyWithImpl(
      _$PasscodeInitial _value, $Res Function(_$PasscodeInitial) _then)
      : super(_value, (v) => _then(v as _$PasscodeInitial));

  @override
  _$PasscodeInitial get _value => super._value as _$PasscodeInitial;
}

/// @nodoc

class _$PasscodeInitial
    with DiagnosticableTreeMixin
    implements PasscodeInitial {
  const _$PasscodeInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PasscodeState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasscodeInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
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
    required TResult Function(PasscodeInitial value) initial,
    required TResult Function(PasscodeLoading value) loading,
    required TResult Function(PasscodeDone value) done,
    required TResult Function(PasscodeError value) error,
    required TResult Function(PasscodeValid value) valid,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PasscodeInitial implements PasscodeState {
  const factory PasscodeInitial() = _$PasscodeInitial;
}

/// @nodoc
abstract class _$$PasscodeLoadingCopyWith<$Res> {
  factory _$$PasscodeLoadingCopyWith(
          _$PasscodeLoading value, $Res Function(_$PasscodeLoading) then) =
      __$$PasscodeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasscodeLoadingCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$PasscodeLoadingCopyWith<$Res> {
  __$$PasscodeLoadingCopyWithImpl(
      _$PasscodeLoading _value, $Res Function(_$PasscodeLoading) _then)
      : super(_value, (v) => _then(v as _$PasscodeLoading));

  @override
  _$PasscodeLoading get _value => super._value as _$PasscodeLoading;
}

/// @nodoc

class _$PasscodeLoading
    with DiagnosticableTreeMixin
    implements PasscodeLoading {
  const _$PasscodeLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasscodeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PasscodeState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasscodeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
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
    required TResult Function(PasscodeInitial value) initial,
    required TResult Function(PasscodeLoading value) loading,
    required TResult Function(PasscodeDone value) done,
    required TResult Function(PasscodeError value) error,
    required TResult Function(PasscodeValid value) valid,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PasscodeLoading implements PasscodeState {
  const factory PasscodeLoading() = _$PasscodeLoading;
}

/// @nodoc
abstract class _$$PasscodeDoneCopyWith<$Res> {
  factory _$$PasscodeDoneCopyWith(
          _$PasscodeDone value, $Res Function(_$PasscodeDone) then) =
      __$$PasscodeDoneCopyWithImpl<$Res>;
  $Res call({String passcode});
}

/// @nodoc
class __$$PasscodeDoneCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$PasscodeDoneCopyWith<$Res> {
  __$$PasscodeDoneCopyWithImpl(
      _$PasscodeDone _value, $Res Function(_$PasscodeDone) _then)
      : super(_value, (v) => _then(v as _$PasscodeDone));

  @override
  _$PasscodeDone get _value => super._value as _$PasscodeDone;

  @override
  $Res call({
    Object? passcode = freezed,
  }) {
    return _then(_$PasscodeDone(
      passcode == freezed
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasscodeDone with DiagnosticableTreeMixin implements PasscodeDone {
  const _$PasscodeDone(this.passcode);

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
            other is _$PasscodeDone &&
            const DeepCollectionEquality().equals(other.passcode, passcode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(passcode));

  @JsonKey(ignore: true)
  @override
  _$$PasscodeDoneCopyWith<_$PasscodeDone> get copyWith =>
      __$$PasscodeDoneCopyWithImpl<_$PasscodeDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
  }) {
    return done(passcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
  }) {
    return done?.call(passcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
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
    required TResult Function(PasscodeInitial value) initial,
    required TResult Function(PasscodeLoading value) loading,
    required TResult Function(PasscodeDone value) done,
    required TResult Function(PasscodeError value) error,
    required TResult Function(PasscodeValid value) valid,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class PasscodeDone implements PasscodeState {
  const factory PasscodeDone(final String passcode) = _$PasscodeDone;

  String get passcode;
  @JsonKey(ignore: true)
  _$$PasscodeDoneCopyWith<_$PasscodeDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasscodeErrorCopyWith<$Res> {
  factory _$$PasscodeErrorCopyWith(
          _$PasscodeError value, $Res Function(_$PasscodeError) then) =
      __$$PasscodeErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$PasscodeErrorCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$PasscodeErrorCopyWith<$Res> {
  __$$PasscodeErrorCopyWithImpl(
      _$PasscodeError _value, $Res Function(_$PasscodeError) _then)
      : super(_value, (v) => _then(v as _$PasscodeError));

  @override
  _$PasscodeError get _value => super._value as _$PasscodeError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$PasscodeError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasscodeError with DiagnosticableTreeMixin implements PasscodeError {
  const _$PasscodeError(this.msg);

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
            other is _$PasscodeError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$PasscodeErrorCopyWith<_$PasscodeError> get copyWith =>
      __$$PasscodeErrorCopyWithImpl<_$PasscodeError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
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
    required TResult Function(PasscodeInitial value) initial,
    required TResult Function(PasscodeLoading value) loading,
    required TResult Function(PasscodeDone value) done,
    required TResult Function(PasscodeError value) error,
    required TResult Function(PasscodeValid value) valid,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PasscodeError implements PasscodeState {
  const factory PasscodeError(final String msg) = _$PasscodeError;

  String get msg;
  @JsonKey(ignore: true)
  _$$PasscodeErrorCopyWith<_$PasscodeError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasscodeValidCopyWith<$Res> {
  factory _$$PasscodeValidCopyWith(
          _$PasscodeValid value, $Res Function(_$PasscodeValid) then) =
      __$$PasscodeValidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasscodeValidCopyWithImpl<$Res>
    extends _$PasscodeStateCopyWithImpl<$Res>
    implements _$$PasscodeValidCopyWith<$Res> {
  __$$PasscodeValidCopyWithImpl(
      _$PasscodeValid _value, $Res Function(_$PasscodeValid) _then)
      : super(_value, (v) => _then(v as _$PasscodeValid));

  @override
  _$PasscodeValid get _value => super._value as _$PasscodeValid;
}

/// @nodoc

class _$PasscodeValid with DiagnosticableTreeMixin implements PasscodeValid {
  const _$PasscodeValid();

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
        (other.runtimeType == runtimeType && other is _$PasscodeValid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String passcode) done,
    required TResult Function(String msg) error,
    required TResult Function() valid,
  }) {
    return valid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
  }) {
    return valid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String passcode)? done,
    TResult Function(String msg)? error,
    TResult Function()? valid,
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
    required TResult Function(PasscodeInitial value) initial,
    required TResult Function(PasscodeLoading value) loading,
    required TResult Function(PasscodeDone value) done,
    required TResult Function(PasscodeError value) error,
    required TResult Function(PasscodeValid value) valid,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeInitial value)? initial,
    TResult Function(PasscodeLoading value)? loading,
    TResult Function(PasscodeDone value)? done,
    TResult Function(PasscodeError value)? error,
    TResult Function(PasscodeValid value)? valid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class PasscodeValid implements PasscodeState {
  const factory PasscodeValid() = _$PasscodeValid;
}
