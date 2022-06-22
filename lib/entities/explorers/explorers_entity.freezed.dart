// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'explorers_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExplorersEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get standard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExplorersEntityCopyWith<ExplorersEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExplorersEntityCopyWith<$Res> {
  factory $ExplorersEntityCopyWith(
          ExplorersEntity value, $Res Function(ExplorersEntity) then) =
      _$ExplorersEntityCopyWithImpl<$Res>;
  $Res call({int id, String name, String url, String standard});
}

/// @nodoc
class _$ExplorersEntityCopyWithImpl<$Res>
    implements $ExplorersEntityCopyWith<$Res> {
  _$ExplorersEntityCopyWithImpl(this._value, this._then);

  final ExplorersEntity _value;
  // ignore: unused_field
  final $Res Function(ExplorersEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? standard = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ExplorersEntityCopyWith<$Res>
    implements $ExplorersEntityCopyWith<$Res> {
  factory _$$_ExplorersEntityCopyWith(
          _$_ExplorersEntity value, $Res Function(_$_ExplorersEntity) then) =
      __$$_ExplorersEntityCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String url, String standard});
}

/// @nodoc
class __$$_ExplorersEntityCopyWithImpl<$Res>
    extends _$ExplorersEntityCopyWithImpl<$Res>
    implements _$$_ExplorersEntityCopyWith<$Res> {
  __$$_ExplorersEntityCopyWithImpl(
      _$_ExplorersEntity _value, $Res Function(_$_ExplorersEntity) _then)
      : super(_value, (v) => _then(v as _$_ExplorersEntity));

  @override
  _$_ExplorersEntity get _value => super._value as _$_ExplorersEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? standard = freezed,
  }) {
    return _then(_$_ExplorersEntity(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ExplorersEntity implements _ExplorersEntity {
  const _$_ExplorersEntity(this.id, this.name, this.url, this.standard);

  @override
  final int id;
  @override
  final String name;
  @override
  final String url;
  @override
  final String standard;

  @override
  String toString() {
    return 'ExplorersEntity(id: $id, name: $name, url: $url, standard: $standard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExplorersEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.standard, standard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(standard));

  @JsonKey(ignore: true)
  @override
  _$$_ExplorersEntityCopyWith<_$_ExplorersEntity> get copyWith =>
      __$$_ExplorersEntityCopyWithImpl<_$_ExplorersEntity>(this, _$identity);
}

abstract class _ExplorersEntity implements ExplorersEntity {
  const factory _ExplorersEntity(final int id, final String name,
      final String url, final String standard) = _$_ExplorersEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get standard => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ExplorersEntityCopyWith<_$_ExplorersEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
