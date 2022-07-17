// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'socket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketStateInitial value) init,
    required TResult Function(SocketStateLoading value) loading,
    required TResult Function(SocketStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketStateCopyWith<$Res> {
  factory $SocketStateCopyWith(
          SocketState value, $Res Function(SocketState) then) =
      _$SocketStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SocketStateCopyWithImpl<$Res> implements $SocketStateCopyWith<$Res> {
  _$SocketStateCopyWithImpl(this._value, this._then);

  final SocketState _value;
  // ignore: unused_field
  final $Res Function(SocketState) _then;
}

/// @nodoc
abstract class _$$SocketStateInitialCopyWith<$Res> {
  factory _$$SocketStateInitialCopyWith(_$SocketStateInitial value,
          $Res Function(_$SocketStateInitial) then) =
      __$$SocketStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SocketStateInitialCopyWithImpl<$Res>
    extends _$SocketStateCopyWithImpl<$Res>
    implements _$$SocketStateInitialCopyWith<$Res> {
  __$$SocketStateInitialCopyWithImpl(
      _$SocketStateInitial _value, $Res Function(_$SocketStateInitial) _then)
      : super(_value, (v) => _then(v as _$SocketStateInitial));

  @override
  _$SocketStateInitial get _value => super._value as _$SocketStateInitial;
}

/// @nodoc

class _$SocketStateInitial implements SocketStateInitial {
  const _$SocketStateInitial();

  @override
  String toString() {
    return 'SocketState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SocketStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)
        loaded,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
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
    required TResult Function(SocketStateInitial value) init,
    required TResult Function(SocketStateLoading value) loading,
    required TResult Function(SocketStateLoaded value) loaded,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SocketStateInitial implements SocketState {
  const factory SocketStateInitial() = _$SocketStateInitial;
}

/// @nodoc
abstract class _$$SocketStateLoadingCopyWith<$Res> {
  factory _$$SocketStateLoadingCopyWith(_$SocketStateLoading value,
          $Res Function(_$SocketStateLoading) then) =
      __$$SocketStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SocketStateLoadingCopyWithImpl<$Res>
    extends _$SocketStateCopyWithImpl<$Res>
    implements _$$SocketStateLoadingCopyWith<$Res> {
  __$$SocketStateLoadingCopyWithImpl(
      _$SocketStateLoading _value, $Res Function(_$SocketStateLoading) _then)
      : super(_value, (v) => _then(v as _$SocketStateLoading));

  @override
  _$SocketStateLoading get _value => super._value as _$SocketStateLoading;
}

/// @nodoc

class _$SocketStateLoading implements SocketStateLoading {
  const _$SocketStateLoading();

  @override
  String toString() {
    return 'SocketState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SocketStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
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
    required TResult Function(SocketStateInitial value) init,
    required TResult Function(SocketStateLoading value) loading,
    required TResult Function(SocketStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SocketStateLoading implements SocketState {
  const factory SocketStateLoading() = _$SocketStateLoading;
}

/// @nodoc
abstract class _$$SocketStateLoadedCopyWith<$Res> {
  factory _$$SocketStateLoadedCopyWith(
          _$SocketStateLoaded value, $Res Function(_$SocketStateLoaded) then) =
      __$$SocketStateLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<SocketEntity> socketEntity,
      int maxSocket,
      int socketOpened,
      List<JewelEntity>? jewels,
      bool loadMoreJewel});
}

/// @nodoc
class __$$SocketStateLoadedCopyWithImpl<$Res>
    extends _$SocketStateCopyWithImpl<$Res>
    implements _$$SocketStateLoadedCopyWith<$Res> {
  __$$SocketStateLoadedCopyWithImpl(
      _$SocketStateLoaded _value, $Res Function(_$SocketStateLoaded) _then)
      : super(_value, (v) => _then(v as _$SocketStateLoaded));

  @override
  _$SocketStateLoaded get _value => super._value as _$SocketStateLoaded;

  @override
  $Res call({
    Object? socketEntity = freezed,
    Object? maxSocket = freezed,
    Object? socketOpened = freezed,
    Object? jewels = freezed,
    Object? loadMoreJewel = freezed,
  }) {
    return _then(_$SocketStateLoaded(
      socketEntity: socketEntity == freezed
          ? _value._socketEntity
          : socketEntity // ignore: cast_nullable_to_non_nullable
              as List<SocketEntity>,
      maxSocket: maxSocket == freezed
          ? _value.maxSocket
          : maxSocket // ignore: cast_nullable_to_non_nullable
              as int,
      socketOpened: socketOpened == freezed
          ? _value.socketOpened
          : socketOpened // ignore: cast_nullable_to_non_nullable
              as int,
      jewels: jewels == freezed
          ? _value._jewels
          : jewels // ignore: cast_nullable_to_non_nullable
              as List<JewelEntity>?,
      loadMoreJewel: loadMoreJewel == freezed
          ? _value.loadMoreJewel
          : loadMoreJewel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SocketStateLoaded implements SocketStateLoaded {
  const _$SocketStateLoaded(
      {required final List<SocketEntity> socketEntity,
      required this.maxSocket,
      required this.socketOpened,
      final List<JewelEntity>? jewels,
      this.loadMoreJewel = true})
      : _socketEntity = socketEntity,
        _jewels = jewels;

  final List<SocketEntity> _socketEntity;
  @override
  List<SocketEntity> get socketEntity {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socketEntity);
  }

  @override
  final int maxSocket;
  @override
  final int socketOpened;
  final List<JewelEntity>? _jewels;
  @override
  List<JewelEntity>? get jewels {
    final value = _jewels;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool loadMoreJewel;

  @override
  String toString() {
    return 'SocketState.loaded(socketEntity: $socketEntity, maxSocket: $maxSocket, socketOpened: $socketOpened, jewels: $jewels, loadMoreJewel: $loadMoreJewel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._socketEntity, _socketEntity) &&
            const DeepCollectionEquality().equals(other.maxSocket, maxSocket) &&
            const DeepCollectionEquality()
                .equals(other.socketOpened, socketOpened) &&
            const DeepCollectionEquality().equals(other._jewels, _jewels) &&
            const DeepCollectionEquality()
                .equals(other.loadMoreJewel, loadMoreJewel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_socketEntity),
      const DeepCollectionEquality().hash(maxSocket),
      const DeepCollectionEquality().hash(socketOpened),
      const DeepCollectionEquality().hash(_jewels),
      const DeepCollectionEquality().hash(loadMoreJewel));

  @JsonKey(ignore: true)
  @override
  _$$SocketStateLoadedCopyWith<_$SocketStateLoaded> get copyWith =>
      __$$SocketStateLoadedCopyWithImpl<_$SocketStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)
        loaded,
  }) {
    return loaded(socketEntity, maxSocket, socketOpened, jewels, loadMoreJewel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
  }) {
    return loaded?.call(
        socketEntity, maxSocket, socketOpened, jewels, loadMoreJewel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<SocketEntity> socketEntity, int maxSocket,
            int socketOpened, List<JewelEntity>? jewels, bool loadMoreJewel)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          socketEntity, maxSocket, socketOpened, jewels, loadMoreJewel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketStateInitial value) init,
    required TResult Function(SocketStateLoading value) loading,
    required TResult Function(SocketStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketStateInitial value)? init,
    TResult Function(SocketStateLoading value)? loading,
    TResult Function(SocketStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SocketStateLoaded implements SocketState {
  const factory SocketStateLoaded(
      {required final List<SocketEntity> socketEntity,
      required final int maxSocket,
      required final int socketOpened,
      final List<JewelEntity>? jewels,
      final bool loadMoreJewel}) = _$SocketStateLoaded;

  List<SocketEntity> get socketEntity;
  int get maxSocket;
  int get socketOpened;
  List<JewelEntity>? get jewels;
  bool get loadMoreJewel;
  @JsonKey(ignore: true)
  _$$SocketStateLoadedCopyWith<_$SocketStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
