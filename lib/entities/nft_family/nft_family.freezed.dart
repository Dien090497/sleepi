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
