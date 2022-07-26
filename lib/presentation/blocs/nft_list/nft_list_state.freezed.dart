// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NftListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> listBed, bool isLoadMore,
            bool hasMore, int currentPage, int limit)
        loaded,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftListInitial value) initial,
    required TResult Function(NftListLoading value) loading,
    required TResult Function(NftListLoaded value) loaded,
    required TResult Function(NftListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftListStateCopyWith<$Res> {
  factory $NftListStateCopyWith(
          NftListState value, $Res Function(NftListState) then) =
      _$NftListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NftListStateCopyWithImpl<$Res> implements $NftListStateCopyWith<$Res> {
  _$NftListStateCopyWithImpl(this._value, this._then);

  final NftListState _value;
  // ignore: unused_field
  final $Res Function(NftListState) _then;
}

/// @nodoc
abstract class _$$NftListInitialCopyWith<$Res> {
  factory _$$NftListInitialCopyWith(
          _$NftListInitial value, $Res Function(_$NftListInitial) then) =
      __$$NftListInitialCopyWithImpl<$Res>;
  $Res call({int page, int limit});
}

/// @nodoc
class __$$NftListInitialCopyWithImpl<$Res>
    extends _$NftListStateCopyWithImpl<$Res>
    implements _$$NftListInitialCopyWith<$Res> {
  __$$NftListInitialCopyWithImpl(
      _$NftListInitial _value, $Res Function(_$NftListInitial) _then)
      : super(_value, (v) => _then(v as _$NftListInitial));

  @override
  _$NftListInitial get _value => super._value as _$NftListInitial;

  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$NftListInitial(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NftListInitial implements NftListInitial {
  const _$NftListInitial({this.page = 1, this.limit = 10});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NftListState.initial(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftListInitial &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit));

  @JsonKey(ignore: true)
  @override
  _$$NftListInitialCopyWith<_$NftListInitial> get copyWith =>
      __$$NftListInitialCopyWithImpl<_$NftListInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> listBed, bool isLoadMore,
            bool hasMore, int currentPage, int limit)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return initial(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return initial?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftListInitial value) initial,
    required TResult Function(NftListLoading value) loading,
    required TResult Function(NftListLoaded value) loaded,
    required TResult Function(NftListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NftListInitial implements NftListState {
  const factory NftListInitial({final int page, final int limit}) =
      _$NftListInitial;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$NftListInitialCopyWith<_$NftListInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NftListLoadingCopyWith<$Res> {
  factory _$$NftListLoadingCopyWith(
          _$NftListLoading value, $Res Function(_$NftListLoading) then) =
      __$$NftListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NftListLoadingCopyWithImpl<$Res>
    extends _$NftListStateCopyWithImpl<$Res>
    implements _$$NftListLoadingCopyWith<$Res> {
  __$$NftListLoadingCopyWithImpl(
      _$NftListLoading _value, $Res Function(_$NftListLoading) _then)
      : super(_value, (v) => _then(v as _$NftListLoading));

  @override
  _$NftListLoading get _value => super._value as _$NftListLoading;
}

/// @nodoc

class _$NftListLoading implements NftListLoading {
  const _$NftListLoading();

  @override
  String toString() {
    return 'NftListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NftListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> listBed, bool isLoadMore,
            bool hasMore, int currentPage, int limit)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
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
    required TResult Function(NftListInitial value) initial,
    required TResult Function(NftListLoading value) loading,
    required TResult Function(NftListLoaded value) loaded,
    required TResult Function(NftListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NftListLoading implements NftListState {
  const factory NftListLoading() = _$NftListLoading;
}

/// @nodoc
abstract class _$$NftListLoadedCopyWith<$Res> {
  factory _$$NftListLoadedCopyWith(
          _$NftListLoaded value, $Res Function(_$NftListLoaded) then) =
      __$$NftListLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<BedEntity> listBed,
      bool isLoadMore,
      bool hasMore,
      int currentPage,
      int limit});
}

/// @nodoc
class __$$NftListLoadedCopyWithImpl<$Res>
    extends _$NftListStateCopyWithImpl<$Res>
    implements _$$NftListLoadedCopyWith<$Res> {
  __$$NftListLoadedCopyWithImpl(
      _$NftListLoaded _value, $Res Function(_$NftListLoaded) _then)
      : super(_value, (v) => _then(v as _$NftListLoaded));

  @override
  _$NftListLoaded get _value => super._value as _$NftListLoaded;

  @override
  $Res call({
    Object? listBed = freezed,
    Object? isLoadMore = freezed,
    Object? hasMore = freezed,
    Object? currentPage = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$NftListLoaded(
      listBed == freezed
          ? _value._listBed
          : listBed // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>,
      isLoadMore: isLoadMore == freezed
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NftListLoaded implements NftListLoaded {
  const _$NftListLoaded(final List<BedEntity> listBed,
      {this.isLoadMore = false,
      this.hasMore = true,
      this.currentPage = 1,
      this.limit = 10})
      : _listBed = listBed;

  final List<BedEntity> _listBed;
  @override
  List<BedEntity> get listBed {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBed);
  }

  @override
  @JsonKey()
  final bool isLoadMore;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NftListState.loaded(listBed: $listBed, isLoadMore: $isLoadMore, hasMore: $hasMore, currentPage: $currentPage, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftListLoaded &&
            const DeepCollectionEquality().equals(other._listBed, _listBed) &&
            const DeepCollectionEquality()
                .equals(other.isLoadMore, isLoadMore) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.limit, limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listBed),
      const DeepCollectionEquality().hash(isLoadMore),
      const DeepCollectionEquality().hash(hasMore),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(limit));

  @JsonKey(ignore: true)
  @override
  _$$NftListLoadedCopyWith<_$NftListLoaded> get copyWith =>
      __$$NftListLoadedCopyWithImpl<_$NftListLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> listBed, bool isLoadMore,
            bool hasMore, int currentPage, int limit)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return loaded(listBed, isLoadMore, hasMore, currentPage, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return loaded?.call(listBed, isLoadMore, hasMore, currentPage, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(listBed, isLoadMore, hasMore, currentPage, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftListInitial value) initial,
    required TResult Function(NftListLoading value) loading,
    required TResult Function(NftListLoaded value) loaded,
    required TResult Function(NftListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class NftListLoaded implements NftListState {
  const factory NftListLoaded(final List<BedEntity> listBed,
      {final bool isLoadMore,
      final bool hasMore,
      final int currentPage,
      final int limit}) = _$NftListLoaded;

  List<BedEntity> get listBed;
  bool get isLoadMore;
  bool get hasMore;
  int get currentPage;
  int get limit;
  @JsonKey(ignore: true)
  _$$NftListLoadedCopyWith<_$NftListLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NftListErrorCopyWith<$Res> {
  factory _$$NftListErrorCopyWith(
          _$NftListError value, $Res Function(_$NftListError) then) =
      __$$NftListErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$NftListErrorCopyWithImpl<$Res>
    extends _$NftListStateCopyWithImpl<$Res>
    implements _$$NftListErrorCopyWith<$Res> {
  __$$NftListErrorCopyWithImpl(
      _$NftListError _value, $Res Function(_$NftListError) _then)
      : super(_value, (v) => _then(v as _$NftListError));

  @override
  _$NftListError get _value => super._value as _$NftListError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$NftListError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NftListError implements NftListError {
  const _$NftListError(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'NftListState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftListError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$NftListErrorCopyWith<_$NftListError> get copyWith =>
      __$$NftListErrorCopyWithImpl<_$NftListError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit) initial,
    required TResult Function() loading,
    required TResult Function(List<BedEntity> listBed, bool isLoadMore,
            bool hasMore, int currentPage, int limit)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit)? initial,
    TResult Function()? loading,
    TResult Function(List<BedEntity> listBed, bool isLoadMore, bool hasMore,
            int currentPage, int limit)?
        loaded,
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
    required TResult Function(NftListInitial value) initial,
    required TResult Function(NftListLoading value) loading,
    required TResult Function(NftListLoaded value) loaded,
    required TResult Function(NftListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftListInitial value)? initial,
    TResult Function(NftListLoading value)? loading,
    TResult Function(NftListLoaded value)? loaded,
    TResult Function(NftListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NftListError implements NftListState {
  const factory NftListError(final String msg) = _$NftListError;

  String get msg;
  @JsonKey(ignore: true)
  _$$NftListErrorCopyWith<_$NftListError> get copyWith =>
      throw _privateConstructorUsedError;
}
