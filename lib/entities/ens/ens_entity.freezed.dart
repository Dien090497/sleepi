// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ens_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EnsEntity {
  int get id => throw _privateConstructorUsedError;
  String get registry => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnsEntityCopyWith<EnsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnsEntityCopyWith<$Res> {
  factory $EnsEntityCopyWith(EnsEntity value, $Res Function(EnsEntity) then) =
      _$EnsEntityCopyWithImpl<$Res>;
  $Res call({int id, String registry});
}

/// @nodoc
class _$EnsEntityCopyWithImpl<$Res> implements $EnsEntityCopyWith<$Res> {
  _$EnsEntityCopyWithImpl(this._value, this._then);

  final EnsEntity _value;
  // ignore: unused_field
  final $Res Function(EnsEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? registry = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      registry: registry == freezed
          ? _value.registry
          : registry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EnsEntityCopyWith<$Res> implements $EnsEntityCopyWith<$Res> {
  factory _$$_EnsEntityCopyWith(
          _$_EnsEntity value, $Res Function(_$_EnsEntity) then) =
      __$$_EnsEntityCopyWithImpl<$Res>;
  @override
  $Res call({int id, String registry});
}

/// @nodoc
class __$$_EnsEntityCopyWithImpl<$Res> extends _$EnsEntityCopyWithImpl<$Res>
    implements _$$_EnsEntityCopyWith<$Res> {
  __$$_EnsEntityCopyWithImpl(
      _$_EnsEntity _value, $Res Function(_$_EnsEntity) _then)
      : super(_value, (v) => _then(v as _$_EnsEntity));

  @override
  _$_EnsEntity get _value => super._value as _$_EnsEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? registry = freezed,
  }) {
    return _then(_$_EnsEntity(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      registry == freezed
          ? _value.registry
          : registry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EnsEntity with DiagnosticableTreeMixin implements _EnsEntity {
  const _$_EnsEntity(this.id, this.registry);

  @override
  final int id;
  @override
  final String registry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EnsEntity(id: $id, registry: $registry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EnsEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('registry', registry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnsEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.registry, registry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(registry));

  @JsonKey(ignore: true)
  @override
  _$$_EnsEntityCopyWith<_$_EnsEntity> get copyWith =>
      __$$_EnsEntityCopyWithImpl<_$_EnsEntity>(this, _$identity);
}

abstract class _EnsEntity implements EnsEntity {
  const factory _EnsEntity(final int id, final String registry) = _$_EnsEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get registry => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EnsEntityCopyWith<_$_EnsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
