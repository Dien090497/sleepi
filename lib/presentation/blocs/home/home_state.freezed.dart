// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> bedList) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) initial,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
    required TResult Function(HomeError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class _$$HomeInitialCopyWith<$Res> {
  factory _$$HomeInitialCopyWith(
          _$HomeInitial value, $Res Function(_$HomeInitial) then) =
      __$$HomeInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeInitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeInitialCopyWith<$Res> {
  __$$HomeInitialCopyWithImpl(
      _$HomeInitial _value, $Res Function(_$HomeInitial) _then)
      : super(_value, (v) => _then(v as _$HomeInitial));

  @override
  _$HomeInitial get _value => super._value as _$HomeInitial;
}

/// @nodoc

class _$HomeInitial with DiagnosticableTreeMixin implements HomeInitial {
  const _$HomeInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> bedList) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(HomeInitial value) initial,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
    required TResult Function(HomeError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomeInitial implements HomeState {
  const factory HomeInitial() = _$HomeInitial;
}

/// @nodoc
abstract class _$$HomeLoadingCopyWith<$Res> {
  factory _$$HomeLoadingCopyWith(
          _$HomeLoading value, $Res Function(_$HomeLoading) then) =
      __$$HomeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeLoadingCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeLoadingCopyWith<$Res> {
  __$$HomeLoadingCopyWithImpl(
      _$HomeLoading _value, $Res Function(_$HomeLoading) _then)
      : super(_value, (v) => _then(v as _$HomeLoading));

  @override
  _$HomeLoading get _value => super._value as _$HomeLoading;
}

/// @nodoc

class _$HomeLoading with DiagnosticableTreeMixin implements HomeLoading {
  const _$HomeLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> bedList) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(HomeInitial value) initial,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
    required TResult Function(HomeError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoading implements HomeState {
  const factory HomeLoading() = _$HomeLoading;
}

/// @nodoc
abstract class _$$HomeLoadedCopyWith<$Res> {
  factory _$$HomeLoadedCopyWith(
          _$HomeLoaded value, $Res Function(_$HomeLoaded) then) =
      __$$HomeLoadedCopyWithImpl<$Res>;
  $Res call({List<BedEntity> bedList});
}

/// @nodoc
class __$$HomeLoadedCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeLoadedCopyWith<$Res> {
  __$$HomeLoadedCopyWithImpl(
      _$HomeLoaded _value, $Res Function(_$HomeLoaded) _then)
      : super(_value, (v) => _then(v as _$HomeLoaded));

  @override
  _$HomeLoaded get _value => super._value as _$HomeLoaded;

  @override
  $Res call({
    Object? bedList = freezed,
  }) {
    return _then(_$HomeLoaded(
      bedList: bedList == freezed
          ? _value._bedList
          : bedList // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>,
    ));
  }
}

/// @nodoc

class _$HomeLoaded with DiagnosticableTreeMixin implements HomeLoaded {
  const _$HomeLoaded({required final List<BedEntity> bedList})
      : _bedList = bedList;

  final List<BedEntity> _bedList;
  @override
  List<BedEntity> get bedList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bedList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loaded(bedList: $bedList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.loaded'))
      ..add(DiagnosticsProperty('bedList', bedList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeLoaded &&
            const DeepCollectionEquality().equals(other._bedList, _bedList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bedList));

  @JsonKey(ignore: true)
  @override
  _$$HomeLoadedCopyWith<_$HomeLoaded> get copyWith =>
      __$$HomeLoadedCopyWithImpl<_$HomeLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> bedList) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(bedList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(bedList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(bedList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) initial,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
    required TResult Function(HomeError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoaded implements HomeState {
  const factory HomeLoaded({required final List<BedEntity> bedList}) =
      _$HomeLoaded;

  List<BedEntity> get bedList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$HomeLoadedCopyWith<_$HomeLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeErrorCopyWith<$Res> {
  factory _$$HomeErrorCopyWith(
          _$HomeError value, $Res Function(_$HomeError) then) =
      __$$HomeErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$HomeErrorCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeErrorCopyWith<$Res> {
  __$$HomeErrorCopyWithImpl(
      _$HomeError _value, $Res Function(_$HomeError) _then)
      : super(_value, (v) => _then(v as _$HomeError));

  @override
  _$HomeError get _value => super._value as _$HomeError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$HomeError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeError with DiagnosticableTreeMixin implements HomeError {
  const _$HomeError(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$HomeErrorCopyWith<_$HomeError> get copyWith =>
      __$$HomeErrorCopyWithImpl<_$HomeError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> bedList) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> bedList)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) initial,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
    required TResult Function(HomeError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? initial,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    TResult Function(HomeError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeError implements HomeState {
  const factory HomeError(final String message) = _$HomeError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$HomeErrorCopyWith<_$HomeError> get copyWith =>
      throw _privateConstructorUsedError;
}
