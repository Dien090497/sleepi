// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NftDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            WalletInfoEntity walletInfoEntity,
            TokenEntity tokenEntity,
            List<NFTEntity> nftEntities,
            bool hasMore,
            NftType nftType)
        loaded,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftDetailInitial value) initial,
    required TResult Function(NftDetailLoaded value) loaded,
    required TResult Function(NftDetailError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftDetailStateCopyWith<$Res> {
  factory $NftDetailStateCopyWith(
          NftDetailState value, $Res Function(NftDetailState) then) =
      _$NftDetailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NftDetailStateCopyWithImpl<$Res>
    implements $NftDetailStateCopyWith<$Res> {
  _$NftDetailStateCopyWithImpl(this._value, this._then);

  final NftDetailState _value;
  // ignore: unused_field
  final $Res Function(NftDetailState) _then;
}

/// @nodoc
abstract class _$$NftDetailInitialCopyWith<$Res> {
  factory _$$NftDetailInitialCopyWith(
          _$NftDetailInitial value, $Res Function(_$NftDetailInitial) then) =
      __$$NftDetailInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NftDetailInitialCopyWithImpl<$Res>
    extends _$NftDetailStateCopyWithImpl<$Res>
    implements _$$NftDetailInitialCopyWith<$Res> {
  __$$NftDetailInitialCopyWithImpl(
      _$NftDetailInitial _value, $Res Function(_$NftDetailInitial) _then)
      : super(_value, (v) => _then(v as _$NftDetailInitial));

  @override
  _$NftDetailInitial get _value => super._value as _$NftDetailInitial;
}

/// @nodoc

class _$NftDetailInitial
    with DiagnosticableTreeMixin
    implements NftDetailInitial {
  const _$NftDetailInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NftDetailState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NftDetailState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NftDetailInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            WalletInfoEntity walletInfoEntity,
            TokenEntity tokenEntity,
            List<NFTEntity> nftEntities,
            bool hasMore,
            NftType nftType)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
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
    required TResult Function(NftDetailInitial value) initial,
    required TResult Function(NftDetailLoaded value) loaded,
    required TResult Function(NftDetailError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NftDetailInitial implements NftDetailState {
  const factory NftDetailInitial() = _$NftDetailInitial;
}

/// @nodoc
abstract class _$$NftDetailLoadedCopyWith<$Res> {
  factory _$$NftDetailLoadedCopyWith(
          _$NftDetailLoaded value, $Res Function(_$NftDetailLoaded) then) =
      __$$NftDetailLoadedCopyWithImpl<$Res>;
  $Res call(
      {WalletInfoEntity walletInfoEntity,
      TokenEntity tokenEntity,
      List<NFTEntity> nftEntities,
      bool hasMore,
      NftType nftType});

  $WalletInfoEntityCopyWith<$Res> get walletInfoEntity;
  $TokenEntityCopyWith<$Res> get tokenEntity;
}

/// @nodoc
class __$$NftDetailLoadedCopyWithImpl<$Res>
    extends _$NftDetailStateCopyWithImpl<$Res>
    implements _$$NftDetailLoadedCopyWith<$Res> {
  __$$NftDetailLoadedCopyWithImpl(
      _$NftDetailLoaded _value, $Res Function(_$NftDetailLoaded) _then)
      : super(_value, (v) => _then(v as _$NftDetailLoaded));

  @override
  _$NftDetailLoaded get _value => super._value as _$NftDetailLoaded;

  @override
  $Res call({
    Object? walletInfoEntity = freezed,
    Object? tokenEntity = freezed,
    Object? nftEntities = freezed,
    Object? hasMore = freezed,
    Object? nftType = freezed,
  }) {
    return _then(_$NftDetailLoaded(
      walletInfoEntity: walletInfoEntity == freezed
          ? _value.walletInfoEntity
          : walletInfoEntity // ignore: cast_nullable_to_non_nullable
              as WalletInfoEntity,
      tokenEntity: tokenEntity == freezed
          ? _value.tokenEntity
          : tokenEntity // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
      nftEntities: nftEntities == freezed
          ? _value._nftEntities
          : nftEntities // ignore: cast_nullable_to_non_nullable
              as List<NFTEntity>,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nftType: nftType == freezed
          ? _value.nftType
          : nftType // ignore: cast_nullable_to_non_nullable
              as NftType,
    ));
  }

  @override
  $WalletInfoEntityCopyWith<$Res> get walletInfoEntity {
    return $WalletInfoEntityCopyWith<$Res>(_value.walletInfoEntity, (value) {
      return _then(_value.copyWith(walletInfoEntity: value));
    });
  }

  @override
  $TokenEntityCopyWith<$Res> get tokenEntity {
    return $TokenEntityCopyWith<$Res>(_value.tokenEntity, (value) {
      return _then(_value.copyWith(tokenEntity: value));
    });
  }
}

/// @nodoc

class _$NftDetailLoaded
    with DiagnosticableTreeMixin
    implements NftDetailLoaded {
  const _$NftDetailLoaded(
      {required this.walletInfoEntity,
      required this.tokenEntity,
      required final List<NFTEntity> nftEntities,
      required this.hasMore,
      required this.nftType})
      : _nftEntities = nftEntities;

  @override
  final WalletInfoEntity walletInfoEntity;
  @override
  final TokenEntity tokenEntity;
  final List<NFTEntity> _nftEntities;
  @override
  List<NFTEntity> get nftEntities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nftEntities);
  }

  @override
  final bool hasMore;
  @override
  final NftType nftType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NftDetailState.loaded(walletInfoEntity: $walletInfoEntity, tokenEntity: $tokenEntity, nftEntities: $nftEntities, hasMore: $hasMore, nftType: $nftType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NftDetailState.loaded'))
      ..add(DiagnosticsProperty('walletInfoEntity', walletInfoEntity))
      ..add(DiagnosticsProperty('tokenEntity', tokenEntity))
      ..add(DiagnosticsProperty('nftEntities', nftEntities))
      ..add(DiagnosticsProperty('hasMore', hasMore))
      ..add(DiagnosticsProperty('nftType', nftType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftDetailLoaded &&
            const DeepCollectionEquality()
                .equals(other.walletInfoEntity, walletInfoEntity) &&
            const DeepCollectionEquality()
                .equals(other.tokenEntity, tokenEntity) &&
            const DeepCollectionEquality()
                .equals(other._nftEntities, _nftEntities) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore) &&
            const DeepCollectionEquality().equals(other.nftType, nftType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(walletInfoEntity),
      const DeepCollectionEquality().hash(tokenEntity),
      const DeepCollectionEquality().hash(_nftEntities),
      const DeepCollectionEquality().hash(hasMore),
      const DeepCollectionEquality().hash(nftType));

  @JsonKey(ignore: true)
  @override
  _$$NftDetailLoadedCopyWith<_$NftDetailLoaded> get copyWith =>
      __$$NftDetailLoadedCopyWithImpl<_$NftDetailLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            WalletInfoEntity walletInfoEntity,
            TokenEntity tokenEntity,
            List<NFTEntity> nftEntities,
            bool hasMore,
            NftType nftType)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return loaded(walletInfoEntity, tokenEntity, nftEntities, hasMore, nftType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return loaded?.call(
        walletInfoEntity, tokenEntity, nftEntities, hasMore, nftType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          walletInfoEntity, tokenEntity, nftEntities, hasMore, nftType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NftDetailInitial value) initial,
    required TResult Function(NftDetailLoaded value) loaded,
    required TResult Function(NftDetailError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class NftDetailLoaded implements NftDetailState {
  const factory NftDetailLoaded(
      {required final WalletInfoEntity walletInfoEntity,
      required final TokenEntity tokenEntity,
      required final List<NFTEntity> nftEntities,
      required final bool hasMore,
      required final NftType nftType}) = _$NftDetailLoaded;

  WalletInfoEntity get walletInfoEntity;
  TokenEntity get tokenEntity;
  List<NFTEntity> get nftEntities;
  bool get hasMore;
  NftType get nftType;
  @JsonKey(ignore: true)
  _$$NftDetailLoadedCopyWith<_$NftDetailLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NftDetailErrorCopyWith<$Res> {
  factory _$$NftDetailErrorCopyWith(
          _$NftDetailError value, $Res Function(_$NftDetailError) then) =
      __$$NftDetailErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$NftDetailErrorCopyWithImpl<$Res>
    extends _$NftDetailStateCopyWithImpl<$Res>
    implements _$$NftDetailErrorCopyWith<$Res> {
  __$$NftDetailErrorCopyWithImpl(
      _$NftDetailError _value, $Res Function(_$NftDetailError) _then)
      : super(_value, (v) => _then(v as _$NftDetailError));

  @override
  _$NftDetailError get _value => super._value as _$NftDetailError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$NftDetailError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NftDetailError with DiagnosticableTreeMixin implements NftDetailError {
  const _$NftDetailError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NftDetailState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NftDetailState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NftDetailError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$NftDetailErrorCopyWith<_$NftDetailError> get copyWith =>
      __$$NftDetailErrorCopyWithImpl<_$NftDetailError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            WalletInfoEntity walletInfoEntity,
            TokenEntity tokenEntity,
            List<NFTEntity> nftEntities,
            bool hasMore,
            NftType nftType)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(WalletInfoEntity walletInfoEntity, TokenEntity tokenEntity,
            List<NFTEntity> nftEntities, bool hasMore, NftType nftType)?
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
    required TResult Function(NftDetailInitial value) initial,
    required TResult Function(NftDetailLoaded value) loaded,
    required TResult Function(NftDetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NftDetailInitial value)? initial,
    TResult Function(NftDetailLoaded value)? loaded,
    TResult Function(NftDetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NftDetailError implements NftDetailState {
  const factory NftDetailError(final String msg) = _$NftDetailError;

  String get msg;
  @JsonKey(ignore: true)
  _$$NftDetailErrorCopyWith<_$NftDetailError> get copyWith =>
      throw _privateConstructorUsedError;
}
