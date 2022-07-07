// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryEntity {
  String? get transactionHash => throw _privateConstructorUsedError;
  int get chainId => throw _privateConstructorUsedError;
  String get addressToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryEntityCopyWith<HistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEntityCopyWith<$Res> {
  factory $HistoryEntityCopyWith(
          HistoryEntity value, $Res Function(HistoryEntity) then) =
      _$HistoryEntityCopyWithImpl<$Res>;
  $Res call({String? transactionHash, int chainId, String addressToken});
}

/// @nodoc
class _$HistoryEntityCopyWithImpl<$Res>
    implements $HistoryEntityCopyWith<$Res> {
  _$HistoryEntityCopyWithImpl(this._value, this._then);

  final HistoryEntity _value;
  // ignore: unused_field
  final $Res Function(HistoryEntity) _then;

  @override
  $Res call({
    Object? transactionHash = freezed,
    Object? chainId = freezed,
    Object? addressToken = freezed,
  }) {
    return _then(_value.copyWith(
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
      chainId: chainId == freezed
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      addressToken: addressToken == freezed
          ? _value.addressToken
          : addressToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryEntityCopyWith<$Res>
    implements $HistoryEntityCopyWith<$Res> {
  factory _$$_HistoryEntityCopyWith(
          _$_HistoryEntity value, $Res Function(_$_HistoryEntity) then) =
      __$$_HistoryEntityCopyWithImpl<$Res>;
  @override
  $Res call({String? transactionHash, int chainId, String addressToken});
}

/// @nodoc
class __$$_HistoryEntityCopyWithImpl<$Res>
    extends _$HistoryEntityCopyWithImpl<$Res>
    implements _$$_HistoryEntityCopyWith<$Res> {
  __$$_HistoryEntityCopyWithImpl(
      _$_HistoryEntity _value, $Res Function(_$_HistoryEntity) _then)
      : super(_value, (v) => _then(v as _$_HistoryEntity));

  @override
  _$_HistoryEntity get _value => super._value as _$_HistoryEntity;

  @override
  $Res call({
    Object? transactionHash = freezed,
    Object? chainId = freezed,
    Object? addressToken = freezed,
  }) {
    return _then(_$_HistoryEntity(
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
      chainId: chainId == freezed
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      addressToken: addressToken == freezed
          ? _value.addressToken
          : addressToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryEntity implements _HistoryEntity {
  const _$_HistoryEntity(
      {required this.transactionHash,
      required this.chainId,
      required this.addressToken});

  @override
  final String? transactionHash;
  @override
  final int chainId;
  @override
  final String addressToken;

  @override
  String toString() {
    return 'HistoryEntity(transactionHash: $transactionHash, chainId: $chainId, addressToken: $addressToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryEntity &&
            const DeepCollectionEquality()
                .equals(other.transactionHash, transactionHash) &&
            const DeepCollectionEquality().equals(other.chainId, chainId) &&
            const DeepCollectionEquality()
                .equals(other.addressToken, addressToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionHash),
      const DeepCollectionEquality().hash(chainId),
      const DeepCollectionEquality().hash(addressToken));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryEntityCopyWith<_$_HistoryEntity> get copyWith =>
      __$$_HistoryEntityCopyWithImpl<_$_HistoryEntity>(this, _$identity);
}

abstract class _HistoryEntity implements HistoryEntity {
  const factory _HistoryEntity(
      {required final String? transactionHash,
      required final int chainId,
      required final String addressToken}) = _$_HistoryEntity;

  @override
  String? get transactionHash => throw _privateConstructorUsedError;
  @override
  int get chainId => throw _privateConstructorUsedError;
  @override
  String get addressToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryEntityCopyWith<_$_HistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
