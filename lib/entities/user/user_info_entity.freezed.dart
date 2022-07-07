// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInfoEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isAccountDisabled => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInfoEntityCopyWith<UserInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoEntityCopyWith<$Res> {
  factory $UserInfoEntityCopyWith(
          UserInfoEntity value, $Res Function(UserInfoEntity) then) =
      _$UserInfoEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      String? username,
      List<String> roles,
      String email,
      bool isAccountDisabled,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$UserInfoEntityCopyWithImpl<$Res>
    implements $UserInfoEntityCopyWith<$Res> {
  _$UserInfoEntityCopyWithImpl(this._value, this._then);

  final UserInfoEntity _value;
  // ignore: unused_field
  final $Res Function(UserInfoEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? roles = freezed,
    Object? email = freezed,
    Object? isAccountDisabled = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isAccountDisabled: isAccountDisabled == freezed
          ? _value.isAccountDisabled
          : isAccountDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserInfoEntityCopyWith<$Res>
    implements $UserInfoEntityCopyWith<$Res> {
  factory _$$_UserInfoEntityCopyWith(
          _$_UserInfoEntity value, $Res Function(_$_UserInfoEntity) then) =
      __$$_UserInfoEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      String? username,
      List<String> roles,
      String email,
      bool isAccountDisabled,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$_UserInfoEntityCopyWithImpl<$Res>
    extends _$UserInfoEntityCopyWithImpl<$Res>
    implements _$$_UserInfoEntityCopyWith<$Res> {
  __$$_UserInfoEntityCopyWithImpl(
      _$_UserInfoEntity _value, $Res Function(_$_UserInfoEntity) _then)
      : super(_value, (v) => _then(v as _$_UserInfoEntity));

  @override
  _$_UserInfoEntity get _value => super._value as _$_UserInfoEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? roles = freezed,
    Object? email = freezed,
    Object? isAccountDisabled = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserInfoEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: roles == freezed
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isAccountDisabled: isAccountDisabled == freezed
          ? _value.isAccountDisabled
          : isAccountDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserInfoEntity
    with DiagnosticableTreeMixin
    implements _UserInfoEntity {
  const _$_UserInfoEntity(
      {required this.id,
      required this.name,
      required this.username,
      required final List<String> roles,
      required this.email,
      required this.isAccountDisabled,
      required this.createdAt,
      required this.updatedAt})
      : _roles = roles;

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? username;
  final List<String> _roles;
  @override
  List<String> get roles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String email;
  @override
  final bool isAccountDisabled;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfoEntity(id: $id, name: $name, username: $username, roles: $roles, email: $email, isAccountDisabled: $isAccountDisabled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfoEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('roles', roles))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('isAccountDisabled', isAccountDisabled))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.isAccountDisabled, isAccountDisabled) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isAccountDisabled),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_UserInfoEntityCopyWith<_$_UserInfoEntity> get copyWith =>
      __$$_UserInfoEntityCopyWithImpl<_$_UserInfoEntity>(this, _$identity);
}

abstract class _UserInfoEntity implements UserInfoEntity {
  const factory _UserInfoEntity(
      {required final int id,
      required final String? name,
      required final String? username,
      required final List<String> roles,
      required final String email,
      required final bool isAccountDisabled,
      required final String createdAt,
      required final String updatedAt}) = _$_UserInfoEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  List<String> get roles => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  bool get isAccountDisabled => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoEntityCopyWith<_$_UserInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
