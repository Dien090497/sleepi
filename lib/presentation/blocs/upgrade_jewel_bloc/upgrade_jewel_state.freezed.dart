// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upgrade_jewel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JewelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<JewelEntity> jewels, bool isLoadMore) loaded,
    required TResult Function() loadUpgraded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JewelStateInit value) init,
    required TResult Function(JewelStateLoaded value) loaded,
    required TResult Function(JewelStateUgraded value) loadUpgraded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JewelStateCopyWith<$Res> {
  factory $JewelStateCopyWith(
          JewelState value, $Res Function(JewelState) then) =
      _$JewelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$JewelStateCopyWithImpl<$Res> implements $JewelStateCopyWith<$Res> {
  _$JewelStateCopyWithImpl(this._value, this._then);

  final JewelState _value;
  // ignore: unused_field
  final $Res Function(JewelState) _then;
}

/// @nodoc
abstract class _$$JewelStateInitCopyWith<$Res> {
  factory _$$JewelStateInitCopyWith(
          _$JewelStateInit value, $Res Function(_$JewelStateInit) then) =
      __$$JewelStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JewelStateInitCopyWithImpl<$Res>
    extends _$JewelStateCopyWithImpl<$Res>
    implements _$$JewelStateInitCopyWith<$Res> {
  __$$JewelStateInitCopyWithImpl(
      _$JewelStateInit _value, $Res Function(_$JewelStateInit) _then)
      : super(_value, (v) => _then(v as _$JewelStateInit));

  @override
  _$JewelStateInit get _value => super._value as _$JewelStateInit;
}

/// @nodoc

class _$JewelStateInit implements JewelStateInit {
  const _$JewelStateInit();

  @override
  String toString() {
    return 'JewelState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JewelStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<JewelEntity> jewels, bool isLoadMore) loaded,
    required TResult Function() loadUpgraded,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JewelStateInit value) init,
    required TResult Function(JewelStateLoaded value) loaded,
    required TResult Function(JewelStateUgraded value) loadUpgraded,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class JewelStateInit implements JewelState {
  const factory JewelStateInit() = _$JewelStateInit;
}

/// @nodoc
abstract class _$$JewelStateLoadedCopyWith<$Res> {
  factory _$$JewelStateLoadedCopyWith(
          _$JewelStateLoaded value, $Res Function(_$JewelStateLoaded) then) =
      __$$JewelStateLoadedCopyWithImpl<$Res>;
  $Res call({List<JewelEntity> jewels, bool isLoadMore});
}

/// @nodoc
class __$$JewelStateLoadedCopyWithImpl<$Res>
    extends _$JewelStateCopyWithImpl<$Res>
    implements _$$JewelStateLoadedCopyWith<$Res> {
  __$$JewelStateLoadedCopyWithImpl(
      _$JewelStateLoaded _value, $Res Function(_$JewelStateLoaded) _then)
      : super(_value, (v) => _then(v as _$JewelStateLoaded));

  @override
  _$JewelStateLoaded get _value => super._value as _$JewelStateLoaded;

  @override
  $Res call({
    Object? jewels = freezed,
    Object? isLoadMore = freezed,
  }) {
    return _then(_$JewelStateLoaded(
      jewels: jewels == freezed
          ? _value._jewels
          : jewels // ignore: cast_nullable_to_non_nullable
              as List<JewelEntity>,
      isLoadMore: isLoadMore == freezed
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$JewelStateLoaded implements JewelStateLoaded {
  const _$JewelStateLoaded(
      {final List<JewelEntity> jewels = const [], this.isLoadMore = true})
      : _jewels = jewels;

  final List<JewelEntity> _jewels;
  @override
  @JsonKey()
  List<JewelEntity> get jewels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jewels);
  }

  @override
  @JsonKey()
  final bool isLoadMore;

  @override
  String toString() {
    return 'JewelState.loaded(jewels: $jewels, isLoadMore: $isLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JewelStateLoaded &&
            const DeepCollectionEquality().equals(other._jewels, _jewels) &&
            const DeepCollectionEquality()
                .equals(other.isLoadMore, isLoadMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_jewels),
      const DeepCollectionEquality().hash(isLoadMore));

  @JsonKey(ignore: true)
  @override
  _$$JewelStateLoadedCopyWith<_$JewelStateLoaded> get copyWith =>
      __$$JewelStateLoadedCopyWithImpl<_$JewelStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<JewelEntity> jewels, bool isLoadMore) loaded,
    required TResult Function() loadUpgraded,
  }) {
    return loaded(jewels, isLoadMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
  }) {
    return loaded?.call(jewels, isLoadMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(jewels, isLoadMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JewelStateInit value) init,
    required TResult Function(JewelStateLoaded value) loaded,
    required TResult Function(JewelStateUgraded value) loadUpgraded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class JewelStateLoaded implements JewelState {
  const factory JewelStateLoaded(
      {final List<JewelEntity> jewels,
      final bool isLoadMore}) = _$JewelStateLoaded;

  List<JewelEntity> get jewels;
  bool get isLoadMore;
  @JsonKey(ignore: true)
  _$$JewelStateLoadedCopyWith<_$JewelStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JewelStateUgradedCopyWith<$Res> {
  factory _$$JewelStateUgradedCopyWith(
          _$JewelStateUgraded value, $Res Function(_$JewelStateUgraded) then) =
      __$$JewelStateUgradedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JewelStateUgradedCopyWithImpl<$Res>
    extends _$JewelStateCopyWithImpl<$Res>
    implements _$$JewelStateUgradedCopyWith<$Res> {
  __$$JewelStateUgradedCopyWithImpl(
      _$JewelStateUgraded _value, $Res Function(_$JewelStateUgraded) _then)
      : super(_value, (v) => _then(v as _$JewelStateUgraded));

  @override
  _$JewelStateUgraded get _value => super._value as _$JewelStateUgraded;
}

/// @nodoc

class _$JewelStateUgraded implements JewelStateUgraded {
  const _$JewelStateUgraded();

  @override
  String toString() {
    return 'JewelState.loadUpgraded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JewelStateUgraded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<JewelEntity> jewels, bool isLoadMore) loaded,
    required TResult Function() loadUpgraded,
  }) {
    return loadUpgraded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
  }) {
    return loadUpgraded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<JewelEntity> jewels, bool isLoadMore)? loaded,
    TResult Function()? loadUpgraded,
    required TResult orElse(),
  }) {
    if (loadUpgraded != null) {
      return loadUpgraded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JewelStateInit value) init,
    required TResult Function(JewelStateLoaded value) loaded,
    required TResult Function(JewelStateUgraded value) loadUpgraded,
  }) {
    return loadUpgraded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
  }) {
    return loadUpgraded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JewelStateInit value)? init,
    TResult Function(JewelStateLoaded value)? loaded,
    TResult Function(JewelStateUgraded value)? loadUpgraded,
    required TResult orElse(),
  }) {
    if (loadUpgraded != null) {
      return loadUpgraded(this);
    }
    return orElse();
  }
}

abstract class JewelStateUgraded implements JewelState {
  const factory JewelStateUgraded() = _$JewelStateUgraded;
}
