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
    required TResult Function(List<BedType> beds) initial,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<BedType> beds)? initial,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BedType> beds)? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
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
  $Res call({List<BedType> beds});
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

  @override
  $Res call({
    Object? beds = freezed,
  }) {
    return _then(_$MintStateInitial(
      beds: beds == freezed
          ? _value._beds
          : beds // ignore: cast_nullable_to_non_nullable
              as List<BedType>,
    ));
  }
}

/// @nodoc

class _$MintStateInitial
    with DiagnosticableTreeMixin
    implements MintStateInitial {
  const _$MintStateInitial({required final List<BedType> beds}) : _beds = beds;

  final List<BedType> _beds;
  @override
  List<BedType> get beds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MintState.initial(beds: $beds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MintState.initial'))
      ..add(DiagnosticsProperty('beds', beds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MintStateInitial &&
            const DeepCollectionEquality().equals(other._beds, _beds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_beds));

  @JsonKey(ignore: true)
  @override
  _$$MintStateInitialCopyWith<_$MintStateInitial> get copyWith =>
      __$$MintStateInitialCopyWithImpl<_$MintStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BedType> beds) initial,
    required TResult Function() loading,
  }) {
    return initial(beds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<BedType> beds)? initial,
    TResult Function()? loading,
  }) {
    return initial?.call(beds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BedType> beds)? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(beds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MintStateInitial implements MintState {
  const factory MintStateInitial({required final List<BedType> beds}) =
      _$MintStateInitial;

  List<BedType> get beds => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MintStateInitialCopyWith<_$MintStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(List<BedType> beds) initial,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<BedType> beds)? initial,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BedType> beds)? initial,
    TResult Function()? loading,
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
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateLoading value)? loading,
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
