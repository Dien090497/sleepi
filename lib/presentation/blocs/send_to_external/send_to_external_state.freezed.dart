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
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(sendToExternalError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
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
    required TResult Function(String msg) error,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
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
    required TResult Function(sendToExternalError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
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
    required TResult Function(String msg) error,
  }) {
    return done(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
  }) {
    return done?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
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
    required TResult Function(sendToExternalError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
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
abstract class _$$sendToExternalErrorCopyWith<$Res> {
  factory _$$sendToExternalErrorCopyWith(_$sendToExternalError value,
          $Res Function(_$sendToExternalError) then) =
      __$$sendToExternalErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$sendToExternalErrorCopyWithImpl<$Res>
    extends _$SendToExternalStateCopyWithImpl<$Res>
    implements _$$sendToExternalErrorCopyWith<$Res> {
  __$$sendToExternalErrorCopyWithImpl(
      _$sendToExternalError _value, $Res Function(_$sendToExternalError) _then)
      : super(_value, (v) => _then(v as _$sendToExternalError));

  @override
  _$sendToExternalError get _value => super._value as _$sendToExternalError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$sendToExternalError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$sendToExternalError
    with DiagnosticableTreeMixin
    implements sendToExternalError {
  const _$sendToExternalError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendToExternalState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendToExternalState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$sendToExternalError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$sendToExternalErrorCopyWith<_$sendToExternalError> get copyWith =>
      __$$sendToExternalErrorCopyWithImpl<_$sendToExternalError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(SendToExternalEntity entity) done,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(SendToExternalEntity entity)? done,
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
    required TResult Function(sendToExternalStateInitial value) initial,
    required TResult Function(sendToExternalDone value) done,
    required TResult Function(sendToExternalError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sendToExternalStateInitial value)? initial,
    TResult Function(sendToExternalDone value)? done,
    TResult Function(sendToExternalError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class sendToExternalError implements SendToExternalState {
  const factory sendToExternalError(final String msg) = _$sendToExternalError;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$sendToExternalErrorCopyWith<_$sendToExternalError> get copyWith =>
      throw _privateConstructorUsedError;
}
