// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemStateInitital value) init,
    required TResult Function(ItemStateLoading value) loading,
    required TResult Function(ItemStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res> implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  final ItemState _value;
  // ignore: unused_field
  final $Res Function(ItemState) _then;
}

/// @nodoc
abstract class _$$ItemStateInititalCopyWith<$Res> {
  factory _$$ItemStateInititalCopyWith(
          _$ItemStateInitital value, $Res Function(_$ItemStateInitital) then) =
      __$$ItemStateInititalCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemStateInititalCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res>
    implements _$$ItemStateInititalCopyWith<$Res> {
  __$$ItemStateInititalCopyWithImpl(
      _$ItemStateInitital _value, $Res Function(_$ItemStateInitital) _then)
      : super(_value, (v) => _then(v as _$ItemStateInitital));

  @override
  _$ItemStateInitital get _value => super._value as _$ItemStateInitital;
}

/// @nodoc

class _$ItemStateInitital implements ItemStateInitital {
  const _$ItemStateInitital();

  @override
  String toString() {
    return 'ItemState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemStateInitital);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)
        loaded,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
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
    required TResult Function(ItemStateInitital value) init,
    required TResult Function(ItemStateLoading value) loading,
    required TResult Function(ItemStateLoaded value) loaded,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ItemStateInitital implements ItemState {
  const factory ItemStateInitital() = _$ItemStateInitital;
}

/// @nodoc
abstract class _$$ItemStateLoadingCopyWith<$Res> {
  factory _$$ItemStateLoadingCopyWith(
          _$ItemStateLoading value, $Res Function(_$ItemStateLoading) then) =
      __$$ItemStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemStateLoadingCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res>
    implements _$$ItemStateLoadingCopyWith<$Res> {
  __$$ItemStateLoadingCopyWithImpl(
      _$ItemStateLoading _value, $Res Function(_$ItemStateLoading) _then)
      : super(_value, (v) => _then(v as _$ItemStateLoading));

  @override
  _$ItemStateLoading get _value => super._value as _$ItemStateLoading;
}

/// @nodoc

class _$ItemStateLoading implements ItemStateLoading {
  const _$ItemStateLoading();

  @override
  String toString() {
    return 'ItemState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
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
    required TResult Function(ItemStateInitital value) init,
    required TResult Function(ItemStateLoading value) loading,
    required TResult Function(ItemStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ItemStateLoading implements ItemState {
  const factory ItemStateLoading() = _$ItemStateLoading;
}

/// @nodoc
abstract class _$$ItemStateLoadedCopyWith<$Res> {
  factory _$$ItemStateLoadedCopyWith(
          _$ItemStateLoaded value, $Res Function(_$ItemStateLoaded) then) =
      __$$ItemStateLoadedCopyWithImpl<$Res>;
  $Res call({List<ItemEntity>? itemList, bool loadMoreItem});
}

/// @nodoc
class __$$ItemStateLoadedCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res>
    implements _$$ItemStateLoadedCopyWith<$Res> {
  __$$ItemStateLoadedCopyWithImpl(
      _$ItemStateLoaded _value, $Res Function(_$ItemStateLoaded) _then)
      : super(_value, (v) => _then(v as _$ItemStateLoaded));

  @override
  _$ItemStateLoaded get _value => super._value as _$ItemStateLoaded;

  @override
  $Res call({
    Object? itemList = freezed,
    Object? loadMoreItem = freezed,
  }) {
    return _then(_$ItemStateLoaded(
      itemList: itemList == freezed
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ItemEntity>?,
      loadMoreItem: loadMoreItem == freezed
          ? _value.loadMoreItem
          : loadMoreItem // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ItemStateLoaded implements ItemStateLoaded {
  const _$ItemStateLoaded(
      {final List<ItemEntity>? itemList, this.loadMoreItem = true})
      : _itemList = itemList;

  final List<ItemEntity>? _itemList;
  @override
  List<ItemEntity>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool loadMoreItem;

  @override
  String toString() {
    return 'ItemState.loaded(itemList: $itemList, loadMoreItem: $loadMoreItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemStateLoaded &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            const DeepCollectionEquality()
                .equals(other.loadMoreItem, loadMoreItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemList),
      const DeepCollectionEquality().hash(loadMoreItem));

  @JsonKey(ignore: true)
  @override
  _$$ItemStateLoadedCopyWith<_$ItemStateLoaded> get copyWith =>
      __$$ItemStateLoadedCopyWithImpl<_$ItemStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)
        loaded,
  }) {
    return loaded(itemList, loadMoreItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
  }) {
    return loaded?.call(itemList, loadMoreItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<ItemEntity>? itemList, bool loadMoreItem)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(itemList, loadMoreItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemStateInitital value) init,
    required TResult Function(ItemStateLoading value) loading,
    required TResult Function(ItemStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemStateInitital value)? init,
    TResult Function(ItemStateLoading value)? loading,
    TResult Function(ItemStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ItemStateLoaded implements ItemState {
  const factory ItemStateLoaded(
      {final List<ItemEntity>? itemList,
      final bool loadMoreItem}) = _$ItemStateLoaded;

  List<ItemEntity>? get itemList;
  bool get loadMoreItem;
  @JsonKey(ignore: true)
  _$$ItemStateLoadedCopyWith<_$ItemStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
