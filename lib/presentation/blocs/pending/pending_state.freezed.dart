// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PendingState {
  PendingStatus get status => throw _privateConstructorUsedError;
  List<TransactionEntity> get list => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PendingStatus status,
            List<TransactionEntity> list, bool hasReachedMax)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PendingStatus status, List<TransactionEntity> list,
            bool hasReachedMax)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PendingStatus status, List<TransactionEntity> list,
            bool hasReachedMax)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PendingStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PendingStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PendingStateCopyWith<PendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingStateCopyWith<$Res> {
  factory $PendingStateCopyWith(
          PendingState value, $Res Function(PendingState) then) =
      _$PendingStateCopyWithImpl<$Res>;
  $Res call(
      {PendingStatus status, List<TransactionEntity> list, bool hasReachedMax});
}

/// @nodoc
class _$PendingStateCopyWithImpl<$Res> implements $PendingStateCopyWith<$Res> {
  _$PendingStateCopyWithImpl(this._value, this._then);

  final PendingState _value;
  // ignore: unused_field
  final $Res Function(PendingState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? list = freezed,
    Object? hasReachedMax = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PendingStatus,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      hasReachedMax: hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$PendingStateLoadedCopyWith<$Res>
    implements $PendingStateCopyWith<$Res> {
  factory _$$PendingStateLoadedCopyWith(_$PendingStateLoaded value,
          $Res Function(_$PendingStateLoaded) then) =
      __$$PendingStateLoadedCopyWithImpl<$Res>;
  @override
  $Res call(
      {PendingStatus status, List<TransactionEntity> list, bool hasReachedMax});
}

/// @nodoc
class __$$PendingStateLoadedCopyWithImpl<$Res>
    extends _$PendingStateCopyWithImpl<$Res>
    implements _$$PendingStateLoadedCopyWith<$Res> {
  __$$PendingStateLoadedCopyWithImpl(
      _$PendingStateLoaded _value, $Res Function(_$PendingStateLoaded) _then)
      : super(_value, (v) => _then(v as _$PendingStateLoaded));

  @override
  _$PendingStateLoaded get _value => super._value as _$PendingStateLoaded;

  @override
  $Res call({
    Object? status = freezed,
    Object? list = freezed,
    Object? hasReachedMax = freezed,
  }) {
    return _then(_$PendingStateLoaded(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PendingStatus,
      list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PendingStateLoaded implements PendingStateLoaded {
  const _$PendingStateLoaded(
      this.status, final List<TransactionEntity> list, this.hasReachedMax)
      : _list = list;

  @override
  final PendingStatus status;
  final List<TransactionEntity> _list;
  @override
  List<TransactionEntity> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final bool hasReachedMax;

  @override
  String toString() {
    return 'PendingState.loaded(status: $status, list: $list, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingStateLoaded &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other.hasReachedMax, hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(hasReachedMax));

  @JsonKey(ignore: true)
  @override
  _$$PendingStateLoadedCopyWith<_$PendingStateLoaded> get copyWith =>
      __$$PendingStateLoadedCopyWithImpl<_$PendingStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PendingStatus status,
            List<TransactionEntity> list, bool hasReachedMax)
        loaded,
  }) {
    return loaded(status, list, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PendingStatus status, List<TransactionEntity> list,
            bool hasReachedMax)?
        loaded,
  }) {
    return loaded?.call(status, list, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PendingStatus status, List<TransactionEntity> list,
            bool hasReachedMax)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(status, list, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PendingStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PendingStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PendingStateLoaded implements PendingState {
  const factory PendingStateLoaded(
      final PendingStatus status,
      final List<TransactionEntity> list,
      final bool hasReachedMax) = _$PendingStateLoaded;

  @override
  PendingStatus get status => throw _privateConstructorUsedError;
  @override
  List<TransactionEntity> get list => throw _privateConstructorUsedError;
  @override
  bool get hasReachedMax => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PendingStateLoadedCopyWith<_$PendingStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
