// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'market_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarketEntity {
  int get categoryId => throw _privateConstructorUsedError;
  String? get sortPrice => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  String? get classNft => throw _privateConstructorUsedError;
  String? get quality => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarketEntityCopyWith<MarketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketEntityCopyWith<$Res> {
  factory $MarketEntityCopyWith(
          MarketEntity value, $Res Function(MarketEntity) then) =
      _$MarketEntityCopyWithImpl<$Res>;
  $Res call(
      {int categoryId,
      String? sortPrice,
      String? type,
      int? level,
      String? classNft,
      String? quality});
}

/// @nodoc
class _$MarketEntityCopyWithImpl<$Res> implements $MarketEntityCopyWith<$Res> {
  _$MarketEntityCopyWithImpl(this._value, this._then);

  final MarketEntity _value;
  // ignore: unused_field
  final $Res Function(MarketEntity) _then;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? sortPrice = freezed,
    Object? type = freezed,
    Object? level = freezed,
    Object? classNft = freezed,
    Object? quality = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      sortPrice: sortPrice == freezed
          ? _value.sortPrice
          : sortPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      classNft: classNft == freezed
          ? _value.classNft
          : classNft // ignore: cast_nullable_to_non_nullable
              as String?,
      quality: quality == freezed
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MarketEntityCopyWith<$Res>
    implements $MarketEntityCopyWith<$Res> {
  factory _$$_MarketEntityCopyWith(
          _$_MarketEntity value, $Res Function(_$_MarketEntity) then) =
      __$$_MarketEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int categoryId,
      String? sortPrice,
      String? type,
      int? level,
      String? classNft,
      String? quality});
}

/// @nodoc
class __$$_MarketEntityCopyWithImpl<$Res>
    extends _$MarketEntityCopyWithImpl<$Res>
    implements _$$_MarketEntityCopyWith<$Res> {
  __$$_MarketEntityCopyWithImpl(
      _$_MarketEntity _value, $Res Function(_$_MarketEntity) _then)
      : super(_value, (v) => _then(v as _$_MarketEntity));

  @override
  _$_MarketEntity get _value => super._value as _$_MarketEntity;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? sortPrice = freezed,
    Object? type = freezed,
    Object? level = freezed,
    Object? classNft = freezed,
    Object? quality = freezed,
  }) {
    return _then(_$_MarketEntity(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      sortPrice: sortPrice == freezed
          ? _value.sortPrice
          : sortPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      classNft: classNft == freezed
          ? _value.classNft
          : classNft // ignore: cast_nullable_to_non_nullable
              as String?,
      quality: quality == freezed
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MarketEntity implements _MarketEntity {
  const _$_MarketEntity(
      {required this.categoryId,
      this.sortPrice,
      this.type,
      this.level,
      this.classNft,
      this.quality});

  @override
  final int categoryId;
  @override
  final String? sortPrice;
  @override
  final String? type;
  @override
  final int? level;
  @override
  final String? classNft;
  @override
  final String? quality;

  @override
  String toString() {
    return 'MarketEntity(categoryId: $categoryId, sortPrice: $sortPrice, type: $type, level: $level, classNft: $classNft, quality: $quality)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketEntity &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.sortPrice, sortPrice) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.classNft, classNft) &&
            const DeepCollectionEquality().equals(other.quality, quality));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(sortPrice),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(classNft),
      const DeepCollectionEquality().hash(quality));

  @JsonKey(ignore: true)
  @override
  _$$_MarketEntityCopyWith<_$_MarketEntity> get copyWith =>
      __$$_MarketEntityCopyWithImpl<_$_MarketEntity>(this, _$identity);
}

abstract class _MarketEntity implements MarketEntity {
  const factory _MarketEntity(
      {required final int categoryId,
      final String? sortPrice,
      final String? type,
      final int? level,
      final String? classNft,
      final String? quality}) = _$_MarketEntity;

  @override
  int get categoryId => throw _privateConstructorUsedError;
  @override
  String? get sortPrice => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  int? get level => throw _privateConstructorUsedError;
  @override
  String? get classNft => throw _privateConstructorUsedError;
  @override
  String? get quality => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MarketEntityCopyWith<_$_MarketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
