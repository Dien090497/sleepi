// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NFTEntity {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get isLock => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  NftAttributeEntity get attribute => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NFTEntityCopyWith<NFTEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTEntityCopyWith<$Res> {
  factory $NFTEntityCopyWith(NFTEntity value, $Res Function(NFTEntity) then) =
      _$NFTEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int categoryId,
      int isLock,
      String status,
      NftAttributeEntity attribute});

  $NftAttributeEntityCopyWith<$Res> get attribute;
}

/// @nodoc
class _$NFTEntityCopyWithImpl<$Res> implements $NFTEntityCopyWith<$Res> {
  _$NFTEntityCopyWithImpl(this._value, this._then);

  final NFTEntity _value;
  // ignore: unused_field
  final $Res Function(NFTEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? isLock = freezed,
    Object? status = freezed,
    Object? attribute = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      isLock: isLock == freezed
          ? _value.isLock
          : isLock // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: attribute == freezed
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as NftAttributeEntity,
    ));
  }

  @override
  $NftAttributeEntityCopyWith<$Res> get attribute {
    return $NftAttributeEntityCopyWith<$Res>(_value.attribute, (value) {
      return _then(_value.copyWith(attribute: value));
    });
  }
}

/// @nodoc
abstract class _$$_NFTEntityCopyWith<$Res> implements $NFTEntityCopyWith<$Res> {
  factory _$$_NFTEntityCopyWith(
          _$_NFTEntity value, $Res Function(_$_NFTEntity) then) =
      __$$_NFTEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int categoryId,
      int isLock,
      String status,
      NftAttributeEntity attribute});

  @override
  $NftAttributeEntityCopyWith<$Res> get attribute;
}

/// @nodoc
class __$$_NFTEntityCopyWithImpl<$Res> extends _$NFTEntityCopyWithImpl<$Res>
    implements _$$_NFTEntityCopyWith<$Res> {
  __$$_NFTEntityCopyWithImpl(
      _$_NFTEntity _value, $Res Function(_$_NFTEntity) _then)
      : super(_value, (v) => _then(v as _$_NFTEntity));

  @override
  _$_NFTEntity get _value => super._value as _$_NFTEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? isLock = freezed,
    Object? status = freezed,
    Object? attribute = freezed,
  }) {
    return _then(_$_NFTEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      isLock: isLock == freezed
          ? _value.isLock
          : isLock // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: attribute == freezed
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as NftAttributeEntity,
    ));
  }
}

/// @nodoc

class _$_NFTEntity with DiagnosticableTreeMixin implements _NFTEntity {
  const _$_NFTEntity(
      {required this.id,
      required this.categoryId,
      required this.isLock,
      required this.status,
      required this.attribute});

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final int isLock;
  @override
  final String status;
  @override
  final NftAttributeEntity attribute;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NFTEntity(id: $id, categoryId: $categoryId, isLock: $isLock, status: $status, attribute: $attribute)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NFTEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('isLock', isLock))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('attribute', attribute));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NFTEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.isLock, isLock) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.attribute, attribute));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(isLock),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(attribute));

  @JsonKey(ignore: true)
  @override
  _$$_NFTEntityCopyWith<_$_NFTEntity> get copyWith =>
      __$$_NFTEntityCopyWithImpl<_$_NFTEntity>(this, _$identity);
}

abstract class _NFTEntity implements NFTEntity {
  const factory _NFTEntity(
      {required final int id,
      required final int categoryId,
      required final int isLock,
      required final String status,
      required final NftAttributeEntity attribute}) = _$_NFTEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get categoryId => throw _privateConstructorUsedError;
  @override
  int get isLock => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  NftAttributeEntity get attribute => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NFTEntityCopyWith<_$_NFTEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
