// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_family.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NftFamilyEntity {
  List<BedEntity> get parent => throw _privateConstructorUsedError;
  List<BedEntity> get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NftFamilyEntityCopyWith<NftFamilyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftFamilyEntityCopyWith<$Res> {
  factory $NftFamilyEntityCopyWith(
          NftFamilyEntity value, $Res Function(NftFamilyEntity) then) =
      _$NftFamilyEntityCopyWithImpl<$Res>;
  $Res call({List<BedEntity> parent, List<BedEntity> children});
}

/// @nodoc
class _$NftFamilyEntityCopyWithImpl<$Res>
    implements $NftFamilyEntityCopyWith<$Res> {
  _$NftFamilyEntityCopyWithImpl(this._value, this._then);

  final NftFamilyEntity _value;
  // ignore: unused_field
  final $Res Function(NftFamilyEntity) _then;

  @override
  $Res call({
    Object? parent = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>,
    ));
  }
}

/// @nodoc
abstract class _$$_NftFamilyEntityCopyWith<$Res>
    implements $NftFamilyEntityCopyWith<$Res> {
  factory _$$_NftFamilyEntityCopyWith(
          _$_NftFamilyEntity value, $Res Function(_$_NftFamilyEntity) then) =
      __$$_NftFamilyEntityCopyWithImpl<$Res>;
  @override
  $Res call({List<BedEntity> parent, List<BedEntity> children});
}

/// @nodoc
class __$$_NftFamilyEntityCopyWithImpl<$Res>
    extends _$NftFamilyEntityCopyWithImpl<$Res>
    implements _$$_NftFamilyEntityCopyWith<$Res> {
  __$$_NftFamilyEntityCopyWithImpl(
      _$_NftFamilyEntity _value, $Res Function(_$_NftFamilyEntity) _then)
      : super(_value, (v) => _then(v as _$_NftFamilyEntity));

  @override
  _$_NftFamilyEntity get _value => super._value as _$_NftFamilyEntity;

  @override
  $Res call({
    Object? parent = freezed,
    Object? children = freezed,
  }) {
    return _then(_$_NftFamilyEntity(
      parent: parent == freezed
          ? _value._parent
          : parent // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>,
      children: children == freezed
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>,
    ));
  }
}

/// @nodoc

class _$_NftFamilyEntity
    with DiagnosticableTreeMixin
    implements _NftFamilyEntity {
  const _$_NftFamilyEntity(
      {required final List<BedEntity> parent,
      required final List<BedEntity> children})
      : _parent = parent,
        _children = children;

  final List<BedEntity> _parent;
  @override
  List<BedEntity> get parent {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parent);
  }

  final List<BedEntity> _children;
  @override
  List<BedEntity> get children {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NftFamilyEntity(parent: $parent, children: $children)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NftFamilyEntity'))
      ..add(DiagnosticsProperty('parent', parent))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NftFamilyEntity &&
            const DeepCollectionEquality().equals(other._parent, _parent) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_parent),
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  _$$_NftFamilyEntityCopyWith<_$_NftFamilyEntity> get copyWith =>
      __$$_NftFamilyEntityCopyWithImpl<_$_NftFamilyEntity>(this, _$identity);
}

abstract class _NftFamilyEntity implements NftFamilyEntity {
  const factory _NftFamilyEntity(
      {required final List<BedEntity> parent,
      required final List<BedEntity> children}) = _$_NftFamilyEntity;

  @override
  List<BedEntity> get parent;
  @override
  List<BedEntity> get children;
  @override
  @JsonKey(ignore: true)
  _$$_NftFamilyEntityCopyWith<_$_NftFamilyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FamilyDataEntity {
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FamilyDataEntityCopyWith<FamilyDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyDataEntityCopyWith<$Res> {
  factory $FamilyDataEntityCopyWith(
          FamilyDataEntity value, $Res Function(FamilyDataEntity) then) =
      _$FamilyDataEntityCopyWithImpl<$Res>;
  $Res call({int id, String image, String type});
}

/// @nodoc
class _$FamilyDataEntityCopyWithImpl<$Res>
    implements $FamilyDataEntityCopyWith<$Res> {
  _$FamilyDataEntityCopyWithImpl(this._value, this._then);

  final FamilyDataEntity _value;
  // ignore: unused_field
  final $Res Function(FamilyDataEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FamilyDataEntityCopyWith<$Res>
    implements $FamilyDataEntityCopyWith<$Res> {
  factory _$$_FamilyDataEntityCopyWith(
          _$_FamilyDataEntity value, $Res Function(_$_FamilyDataEntity) then) =
      __$$_FamilyDataEntityCopyWithImpl<$Res>;
  @override
  $Res call({int id, String image, String type});
}

/// @nodoc
class __$$_FamilyDataEntityCopyWithImpl<$Res>
    extends _$FamilyDataEntityCopyWithImpl<$Res>
    implements _$$_FamilyDataEntityCopyWith<$Res> {
  __$$_FamilyDataEntityCopyWithImpl(
      _$_FamilyDataEntity _value, $Res Function(_$_FamilyDataEntity) _then)
      : super(_value, (v) => _then(v as _$_FamilyDataEntity));

  @override
  _$_FamilyDataEntity get _value => super._value as _$_FamilyDataEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_FamilyDataEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FamilyDataEntity
    with DiagnosticableTreeMixin
    implements _FamilyDataEntity {
  const _$_FamilyDataEntity(
      {required this.id, required this.image, required this.type});

  @override
  final int id;
  @override
  final String image;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FamilyDataEntity(id: $id, image: $image, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FamilyDataEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FamilyDataEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_FamilyDataEntityCopyWith<_$_FamilyDataEntity> get copyWith =>
      __$$_FamilyDataEntityCopyWithImpl<_$_FamilyDataEntity>(this, _$identity);
}

abstract class _FamilyDataEntity implements FamilyDataEntity {
  const factory _FamilyDataEntity(
      {required final int id,
      required final String image,
      required final String type}) = _$_FamilyDataEntity;

  @override
  int get id;
  @override
  String get image;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_FamilyDataEntityCopyWith<_$_FamilyDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
