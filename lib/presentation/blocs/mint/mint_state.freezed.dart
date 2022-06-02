// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mint_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MintState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
    required TResult Function(MintStateLoaded value) loaded,
    required TResult Function(MintStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MintStateCopyWith<$Res> {
  factory $MintStateCopyWith(MintState value, $Res Function(MintState) then) =
      _$MintStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MintStateCopyWithImpl<$Res> implements $MintStateCopyWith<$Res> {
  _$MintStateCopyWithImpl(this._value, this._then);

  final MintState _value;
  // ignore: unused_field
  final $Res Function(MintState) _then;
}

/// @nodoc
abstract class _$$MintStateInitialCopyWith<$Res> {
  factory _$$MintStateInitialCopyWith(
          _$MintStateInitial value, $Res Function(_$MintStateInitial) then) =
      __$$MintStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MintStateInitialCopyWithImpl<$Res>
    extends _$MintStateCopyWithImpl<$Res>
    implements _$$MintStateInitialCopyWith<$Res> {
  __$$MintStateInitialCopyWithImpl(
      _$MintStateInitial _value, $Res Function(_$MintStateInitial) _then)
      : super(_value, (v) => _then(v as _$MintStateInitial));

  @override
  _$MintStateInitial get _value => super._value as _$MintStateInitial;
}

/// @nodoc

class _$MintStateInitial
    with DiagnosticableTreeMixin
    implements MintStateInitial {
  const _$MintStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MintState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MintState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MintStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
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
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
    required TResult Function(MintStateLoaded value) loaded,
    required TResult Function(MintStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MintStateInitial implements MintState {
  const factory MintStateInitial() = _$MintStateInitial;
}

/// @nodoc
abstract class _$$MintStateLoadingCopyWith<$Res> {
  factory _$$MintStateLoadingCopyWith(
          _$MintStateLoading value, $Res Function(_$MintStateLoading) then) =
      __$$MintStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MintStateLoadingCopyWithImpl<$Res>
    extends _$MintStateCopyWithImpl<$Res>
    implements _$$MintStateLoadingCopyWith<$Res> {
  __$$MintStateLoadingCopyWithImpl(
      _$MintStateLoading _value, $Res Function(_$MintStateLoading) _then)
      : super(_value, (v) => _then(v as _$MintStateLoading));

  @override
  _$MintStateLoading get _value => super._value as _$MintStateLoading;
}

/// @nodoc

class _$MintStateLoading
    with DiagnosticableTreeMixin
    implements MintStateLoading {
  const _$MintStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MintState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MintState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MintStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
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
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
    required TResult Function(MintStateLoaded value) loaded,
    required TResult Function(MintStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MintStateLoading implements MintState {
  const factory MintStateLoading() = _$MintStateLoading;
}

/// @nodoc
abstract class _$$MintStateLoadedCopyWith<$Res> {
  factory _$$MintStateLoadedCopyWith(
          _$MintStateLoaded value, $Res Function(_$MintStateLoaded) then) =
      __$$MintStateLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MintStateLoadedCopyWithImpl<$Res>
    extends _$MintStateCopyWithImpl<$Res>
    implements _$$MintStateLoadedCopyWith<$Res> {
  __$$MintStateLoadedCopyWithImpl(
      _$MintStateLoaded _value, $Res Function(_$MintStateLoaded) _then)
      : super(_value, (v) => _then(v as _$MintStateLoaded));

  @override
  _$MintStateLoaded get _value => super._value as _$MintStateLoaded;
}

/// @nodoc

class _$MintStateLoaded
    with DiagnosticableTreeMixin
    implements MintStateLoaded {
  const _$MintStateLoaded();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MintState.loaded()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MintState.loaded'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MintStateLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
    required TResult Function(MintStateLoaded value) loaded,
    required TResult Function(MintStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MintStateLoaded implements MintState {
  const factory MintStateLoaded() = _$MintStateLoaded;
}

/// @nodoc
abstract class _$$MintStateErrorCopyWith<$Res> {
  factory _$$MintStateErrorCopyWith(
          _$MintStateError value, $Res Function(_$MintStateError) then) =
      __$$MintStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MintStateErrorCopyWithImpl<$Res> extends _$MintStateCopyWithImpl<$Res>
    implements _$$MintStateErrorCopyWith<$Res> {
  __$$MintStateErrorCopyWithImpl(
      _$MintStateError _value, $Res Function(_$MintStateError) _then)
      : super(_value, (v) => _then(v as _$MintStateError));

  @override
  _$MintStateError get _value => super._value as _$MintStateError;
}

/// @nodoc

class _$MintStateError with DiagnosticableTreeMixin implements MintStateError {
  const _$MintStateError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MintState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MintState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MintStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
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
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
    required TResult Function(MintStateLoaded value) loaded,
    required TResult Function(MintStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    TResult Function(MintStateLoaded value)? loaded,
    TResult Function(MintStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MintStateError implements MintState {
  const factory MintStateError() = _$MintStateError;
}
