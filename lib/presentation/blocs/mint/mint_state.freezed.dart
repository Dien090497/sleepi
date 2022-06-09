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
    required TResult Function(int indexSelected) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int indexSelected)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int indexSelected)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateSelected value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateSelected value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateSelected value)? loaded,
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
    required TResult Function(int indexSelected) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int indexSelected)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int indexSelected)? loaded,
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
    required TResult Function(MintStateSelected value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateSelected value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateSelected value)? loaded,
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
abstract class _$$MintStateSelectedCopyWith<$Res> {
  factory _$$MintStateSelectedCopyWith(
          _$MintStateSelected value, $Res Function(_$MintStateSelected) then) =
      __$$MintStateSelectedCopyWithImpl<$Res>;
  $Res call({int indexSelected});
}

/// @nodoc
class __$$MintStateSelectedCopyWithImpl<$Res>
    extends _$MintStateCopyWithImpl<$Res>
    implements _$$MintStateSelectedCopyWith<$Res> {
  __$$MintStateSelectedCopyWithImpl(
      _$MintStateSelected _value, $Res Function(_$MintStateSelected) _then)
      : super(_value, (v) => _then(v as _$MintStateSelected));

  @override
  _$MintStateSelected get _value => super._value as _$MintStateSelected;

  @override
  $Res call({
    Object? indexSelected = freezed,
  }) {
    return _then(_$MintStateSelected(
      indexSelected: indexSelected == freezed
          ? _value.indexSelected
          : indexSelected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MintStateSelected
    with DiagnosticableTreeMixin
    implements MintStateSelected {
  const _$MintStateSelected({required this.indexSelected});

  @override
  final int indexSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MintState.loaded(indexSelected: $indexSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MintState.loaded'))
      ..add(DiagnosticsProperty('indexSelected', indexSelected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MintStateSelected &&
            const DeepCollectionEquality()
                .equals(other.indexSelected, indexSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(indexSelected));

  @JsonKey(ignore: true)
  @override
  _$$MintStateSelectedCopyWith<_$MintStateSelected> get copyWith =>
      __$$MintStateSelectedCopyWithImpl<_$MintStateSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int indexSelected) loaded,
  }) {
    return loaded(indexSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int indexSelected)? loaded,
  }) {
    return loaded?.call(indexSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int indexSelected)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(indexSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MintStateInitial value) initial,
    required TResult Function(MintStateSelected value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateSelected value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MintStateInitial value)? initial,
    TResult Function(MintStateSelected value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MintStateSelected implements MintState {
  const factory MintStateSelected({required final int indexSelected}) =
      _$MintStateSelected;

  int get indexSelected => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MintStateSelectedCopyWith<_$MintStateSelected> get copyWith =>
      throw _privateConstructorUsedError;
}
