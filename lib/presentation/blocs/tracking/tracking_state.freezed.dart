// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrackingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool success) posted,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackingStateInitial value) initial,
    required TResult Function(TrackingStateLoading value) loading,
    required TResult Function(TrackingStatePosted value) posted,
    required TResult Function(TrackingStateFail value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingStateCopyWith<$Res> {
  factory $TrackingStateCopyWith(
          TrackingState value, $Res Function(TrackingState) then) =
      _$TrackingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrackingStateCopyWithImpl<$Res>
    implements $TrackingStateCopyWith<$Res> {
  _$TrackingStateCopyWithImpl(this._value, this._then);

  final TrackingState _value;
  // ignore: unused_field
  final $Res Function(TrackingState) _then;
}

/// @nodoc
abstract class _$$TrackingStateInitialCopyWith<$Res> {
  factory _$$TrackingStateInitialCopyWith(_$TrackingStateInitial value,
          $Res Function(_$TrackingStateInitial) then) =
      __$$TrackingStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TrackingStateInitialCopyWithImpl<$Res>
    extends _$TrackingStateCopyWithImpl<$Res>
    implements _$$TrackingStateInitialCopyWith<$Res> {
  __$$TrackingStateInitialCopyWithImpl(_$TrackingStateInitial _value,
      $Res Function(_$TrackingStateInitial) _then)
      : super(_value, (v) => _then(v as _$TrackingStateInitial));

  @override
  _$TrackingStateInitial get _value => super._value as _$TrackingStateInitial;
}

/// @nodoc

class _$TrackingStateInitial
    with DiagnosticableTreeMixin
    implements TrackingStateInitial {
  const _$TrackingStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackingState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TrackingStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool success) posted,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
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
    required TResult Function(TrackingStateInitial value) initial,
    required TResult Function(TrackingStateLoading value) loading,
    required TResult Function(TrackingStatePosted value) posted,
    required TResult Function(TrackingStateFail value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TrackingStateInitial implements TrackingState {
  const factory TrackingStateInitial() = _$TrackingStateInitial;
}

/// @nodoc
abstract class _$$TrackingStateLoadingCopyWith<$Res> {
  factory _$$TrackingStateLoadingCopyWith(_$TrackingStateLoading value,
          $Res Function(_$TrackingStateLoading) then) =
      __$$TrackingStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TrackingStateLoadingCopyWithImpl<$Res>
    extends _$TrackingStateCopyWithImpl<$Res>
    implements _$$TrackingStateLoadingCopyWith<$Res> {
  __$$TrackingStateLoadingCopyWithImpl(_$TrackingStateLoading _value,
      $Res Function(_$TrackingStateLoading) _then)
      : super(_value, (v) => _then(v as _$TrackingStateLoading));

  @override
  _$TrackingStateLoading get _value => super._value as _$TrackingStateLoading;
}

/// @nodoc

class _$TrackingStateLoading
    with DiagnosticableTreeMixin
    implements TrackingStateLoading {
  const _$TrackingStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TrackingState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TrackingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool success) posted,
    required TResult Function(String msg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
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
    required TResult Function(TrackingStateInitial value) initial,
    required TResult Function(TrackingStateLoading value) loading,
    required TResult Function(TrackingStatePosted value) posted,
    required TResult Function(TrackingStateFail value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TrackingStateLoading implements TrackingState {
  const factory TrackingStateLoading() = _$TrackingStateLoading;
}

/// @nodoc
abstract class _$$TrackingStatePostedCopyWith<$Res> {
  factory _$$TrackingStatePostedCopyWith(_$TrackingStatePosted value,
          $Res Function(_$TrackingStatePosted) then) =
      __$$TrackingStatePostedCopyWithImpl<$Res>;
  $Res call({bool success});
}

/// @nodoc
class __$$TrackingStatePostedCopyWithImpl<$Res>
    extends _$TrackingStateCopyWithImpl<$Res>
    implements _$$TrackingStatePostedCopyWith<$Res> {
  __$$TrackingStatePostedCopyWithImpl(
      _$TrackingStatePosted _value, $Res Function(_$TrackingStatePosted) _then)
      : super(_value, (v) => _then(v as _$TrackingStatePosted));

  @override
  _$TrackingStatePosted get _value => super._value as _$TrackingStatePosted;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_$TrackingStatePosted(
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TrackingStatePosted
    with DiagnosticableTreeMixin
    implements TrackingStatePosted {
  const _$TrackingStatePosted(this.success);

  @override
  final bool success;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingState.posted(success: $success)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackingState.posted'))
      ..add(DiagnosticsProperty('success', success));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingStatePosted &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$$TrackingStatePostedCopyWith<_$TrackingStatePosted> get copyWith =>
      __$$TrackingStatePostedCopyWithImpl<_$TrackingStatePosted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool success) posted,
    required TResult Function(String msg) error,
  }) {
    return posted(success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
  }) {
    return posted?.call(success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (posted != null) {
      return posted(success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackingStateInitial value) initial,
    required TResult Function(TrackingStateLoading value) loading,
    required TResult Function(TrackingStatePosted value) posted,
    required TResult Function(TrackingStateFail value) error,
  }) {
    return posted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
  }) {
    return posted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
    required TResult orElse(),
  }) {
    if (posted != null) {
      return posted(this);
    }
    return orElse();
  }
}

abstract class TrackingStatePosted implements TrackingState {
  const factory TrackingStatePosted(final bool success) = _$TrackingStatePosted;

  bool get success;
  @JsonKey(ignore: true)
  _$$TrackingStatePostedCopyWith<_$TrackingStatePosted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrackingStateFailCopyWith<$Res> {
  factory _$$TrackingStateFailCopyWith(
          _$TrackingStateFail value, $Res Function(_$TrackingStateFail) then) =
      __$$TrackingStateFailCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$TrackingStateFailCopyWithImpl<$Res>
    extends _$TrackingStateCopyWithImpl<$Res>
    implements _$$TrackingStateFailCopyWith<$Res> {
  __$$TrackingStateFailCopyWithImpl(
      _$TrackingStateFail _value, $Res Function(_$TrackingStateFail) _then)
      : super(_value, (v) => _then(v as _$TrackingStateFail));

  @override
  _$TrackingStateFail get _value => super._value as _$TrackingStateFail;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$TrackingStateFail(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TrackingStateFail
    with DiagnosticableTreeMixin
    implements TrackingStateFail {
  const _$TrackingStateFail(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackingState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackingState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingStateFail &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$TrackingStateFailCopyWith<_$TrackingStateFail> get copyWith =>
      __$$TrackingStateFailCopyWithImpl<_$TrackingStateFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool success) posted,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool success)? posted,
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
    required TResult Function(TrackingStateInitial value) initial,
    required TResult Function(TrackingStateLoading value) loading,
    required TResult Function(TrackingStatePosted value) posted,
    required TResult Function(TrackingStateFail value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackingStateInitial value)? initial,
    TResult Function(TrackingStateLoading value)? loading,
    TResult Function(TrackingStatePosted value)? posted,
    TResult Function(TrackingStateFail value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TrackingStateFail implements TrackingState {
  const factory TrackingStateFail(final String msg) = _$TrackingStateFail;

  String get msg;
  @JsonKey(ignore: true)
  _$$TrackingStateFailCopyWith<_$TrackingStateFail> get copyWith =>
      throw _privateConstructorUsedError;
}
