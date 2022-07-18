// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'individual_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IndividualState {
  BedEntity get bed => throw _privateConstructorUsedError;
  bool get isRefresh => throw _privateConstructorUsedError;
  NftFamilyEntity? get nftFamily => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndividualStateCopyWith<IndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualStateCopyWith<$Res> {
  factory $IndividualStateCopyWith(
          IndividualState value, $Res Function(IndividualState) then) =
      _$IndividualStateCopyWithImpl<$Res>;
  $Res call(
      {BedEntity bed,
      bool isRefresh,
      NftFamilyEntity? nftFamily,
      bool isLoading});

  $BedEntityCopyWith<$Res> get bed;
  $NftFamilyEntityCopyWith<$Res>? get nftFamily;
}

/// @nodoc
class _$IndividualStateCopyWithImpl<$Res>
    implements $IndividualStateCopyWith<$Res> {
  _$IndividualStateCopyWithImpl(this._value, this._then);

  final IndividualState _value;
  // ignore: unused_field
  final $Res Function(IndividualState) _then;

  @override
  $Res call({
    Object? bed = freezed,
    Object? isRefresh = freezed,
    Object? nftFamily = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      bed: bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      nftFamily: nftFamily == freezed
          ? _value.nftFamily
          : nftFamily // ignore: cast_nullable_to_non_nullable
              as NftFamilyEntity?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $BedEntityCopyWith<$Res> get bed {
    return $BedEntityCopyWith<$Res>(_value.bed, (value) {
      return _then(_value.copyWith(bed: value));
    });
  }

  @override
  $NftFamilyEntityCopyWith<$Res>? get nftFamily {
    if (_value.nftFamily == null) {
      return null;
    }

    return $NftFamilyEntityCopyWith<$Res>(_value.nftFamily!, (value) {
      return _then(_value.copyWith(nftFamily: value));
    });
  }
}

/// @nodoc
abstract class _$$_IndividualStateCopyWith<$Res>
    implements $IndividualStateCopyWith<$Res> {
  factory _$$_IndividualStateCopyWith(
          _$_IndividualState value, $Res Function(_$_IndividualState) then) =
      __$$_IndividualStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BedEntity bed,
      bool isRefresh,
      NftFamilyEntity? nftFamily,
      bool isLoading});

  @override
  $BedEntityCopyWith<$Res> get bed;
  @override
  $NftFamilyEntityCopyWith<$Res>? get nftFamily;
}

/// @nodoc
class __$$_IndividualStateCopyWithImpl<$Res>
    extends _$IndividualStateCopyWithImpl<$Res>
    implements _$$_IndividualStateCopyWith<$Res> {
  __$$_IndividualStateCopyWithImpl(
      _$_IndividualState _value, $Res Function(_$_IndividualState) _then)
      : super(_value, (v) => _then(v as _$_IndividualState));

  @override
  _$_IndividualState get _value => super._value as _$_IndividualState;

  @override
  $Res call({
    Object? bed = freezed,
    Object? isRefresh = freezed,
    Object? nftFamily = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_IndividualState(
      bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      nftFamily: nftFamily == freezed
          ? _value.nftFamily
          : nftFamily // ignore: cast_nullable_to_non_nullable
              as NftFamilyEntity?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IndividualState
    with DiagnosticableTreeMixin
    implements _IndividualState {
  const _$_IndividualState(this.bed,
      {this.isRefresh = false, this.nftFamily, this.isLoading = false});

  @override
  final BedEntity bed;
  @override
  @JsonKey()
  final bool isRefresh;
  @override
  final NftFamilyEntity? nftFamily;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualState(bed: $bed, isRefresh: $isRefresh, nftFamily: $nftFamily, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualState'))
      ..add(DiagnosticsProperty('bed', bed))
      ..add(DiagnosticsProperty('isRefresh', isRefresh))
      ..add(DiagnosticsProperty('nftFamily', nftFamily))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndividualState &&
            const DeepCollectionEquality().equals(other.bed, bed) &&
            const DeepCollectionEquality().equals(other.isRefresh, isRefresh) &&
            const DeepCollectionEquality().equals(other.nftFamily, nftFamily) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bed),
      const DeepCollectionEquality().hash(isRefresh),
      const DeepCollectionEquality().hash(nftFamily),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_IndividualStateCopyWith<_$_IndividualState> get copyWith =>
      __$$_IndividualStateCopyWithImpl<_$_IndividualState>(this, _$identity);
}

abstract class _IndividualState implements IndividualState {
  const factory _IndividualState(final BedEntity bed,
      {final bool isRefresh,
      final NftFamilyEntity? nftFamily,
      final bool isLoading}) = _$_IndividualState;

  @override
  BedEntity get bed;
  @override
  bool get isRefresh;
  @override
  NftFamilyEntity? get nftFamily;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_IndividualStateCopyWith<_$_IndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}
