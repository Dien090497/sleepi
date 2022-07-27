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
  List<double> get currentPoints => throw _privateConstructorUsedError;
  List<BedEntity>? get queryParent => throw _privateConstructorUsedError;
  List<BedEntity>? get queryChildren => throw _privateConstructorUsedError;
  bool get isRefresh => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBase => throw _privateConstructorUsedError;

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
      List<double> currentPoints,
      List<BedEntity>? queryParent,
      List<BedEntity>? queryChildren,
      bool isRefresh,
      bool isLoading,
      bool isBase});

  $BedEntityCopyWith<$Res> get bed;
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
    Object? currentPoints = freezed,
    Object? queryParent = freezed,
    Object? queryChildren = freezed,
    Object? isRefresh = freezed,
    Object? isLoading = freezed,
    Object? isBase = freezed,
  }) {
    return _then(_value.copyWith(
      bed: bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
      currentPoints: currentPoints == freezed
          ? _value.currentPoints
          : currentPoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      queryParent: queryParent == freezed
          ? _value.queryParent
          : queryParent // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>?,
      queryChildren: queryChildren == freezed
          ? _value.queryChildren
          : queryChildren // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>?,
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBase: isBase == freezed
          ? _value.isBase
          : isBase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $BedEntityCopyWith<$Res> get bed {
    return $BedEntityCopyWith<$Res>(_value.bed, (value) {
      return _then(_value.copyWith(bed: value));
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
      List<double> currentPoints,
      List<BedEntity>? queryParent,
      List<BedEntity>? queryChildren,
      bool isRefresh,
      bool isLoading,
      bool isBase});

  @override
  $BedEntityCopyWith<$Res> get bed;
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
    Object? currentPoints = freezed,
    Object? queryParent = freezed,
    Object? queryChildren = freezed,
    Object? isRefresh = freezed,
    Object? isLoading = freezed,
    Object? isBase = freezed,
  }) {
    return _then(_$_IndividualState(
      bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
      currentPoints: currentPoints == freezed
          ? _value._currentPoints
          : currentPoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      queryParent: queryParent == freezed
          ? _value._queryParent
          : queryParent // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>?,
      queryChildren: queryChildren == freezed
          ? _value._queryChildren
          : queryChildren // ignore: cast_nullable_to_non_nullable
              as List<BedEntity>?,
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBase: isBase == freezed
          ? _value.isBase
          : isBase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IndividualState
    with DiagnosticableTreeMixin
    implements _IndividualState {
  const _$_IndividualState(this.bed,
      {required final List<double> currentPoints,
      final List<BedEntity>? queryParent,
      final List<BedEntity>? queryChildren,
      this.isRefresh = false,
      this.isLoading = false,
      this.isBase = false})
      : _currentPoints = currentPoints,
        _queryParent = queryParent,
        _queryChildren = queryChildren;

  @override
  final BedEntity bed;
  final List<double> _currentPoints;
  @override
  List<double> get currentPoints {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentPoints);
  }

  final List<BedEntity>? _queryParent;
  @override
  List<BedEntity>? get queryParent {
    final value = _queryParent;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BedEntity>? _queryChildren;
  @override
  List<BedEntity>? get queryChildren {
    final value = _queryChildren;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isRefresh;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBase;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualState(bed: $bed, currentPoints: $currentPoints, queryParent: $queryParent, queryChildren: $queryChildren, isRefresh: $isRefresh, isLoading: $isLoading, isBase: $isBase)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualState'))
      ..add(DiagnosticsProperty('bed', bed))
      ..add(DiagnosticsProperty('currentPoints', currentPoints))
      ..add(DiagnosticsProperty('queryParent', queryParent))
      ..add(DiagnosticsProperty('queryChildren', queryChildren))
      ..add(DiagnosticsProperty('isRefresh', isRefresh))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isBase', isBase));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndividualState &&
            const DeepCollectionEquality().equals(other.bed, bed) &&
            const DeepCollectionEquality()
                .equals(other._currentPoints, _currentPoints) &&
            const DeepCollectionEquality()
                .equals(other._queryParent, _queryParent) &&
            const DeepCollectionEquality()
                .equals(other._queryChildren, _queryChildren) &&
            const DeepCollectionEquality().equals(other.isRefresh, isRefresh) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isBase, isBase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bed),
      const DeepCollectionEquality().hash(_currentPoints),
      const DeepCollectionEquality().hash(_queryParent),
      const DeepCollectionEquality().hash(_queryChildren),
      const DeepCollectionEquality().hash(isRefresh),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isBase));

  @JsonKey(ignore: true)
  @override
  _$$_IndividualStateCopyWith<_$_IndividualState> get copyWith =>
      __$$_IndividualStateCopyWithImpl<_$_IndividualState>(this, _$identity);
}

abstract class _IndividualState implements IndividualState {
  const factory _IndividualState(final BedEntity bed,
      {required final List<double> currentPoints,
      final List<BedEntity>? queryParent,
      final List<BedEntity>? queryChildren,
      final bool isRefresh,
      final bool isLoading,
      final bool isBase}) = _$_IndividualState;

  @override
  BedEntity get bed;
  @override
  List<double> get currentPoints;
  @override
  List<BedEntity>? get queryParent;
  @override
  List<BedEntity>? get queryChildren;
  @override
  bool get isRefresh;
  @override
  bool get isLoading;
  @override
  bool get isBase;
  @override
  @JsonKey(ignore: true)
  _$$_IndividualStateCopyWith<_$_IndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}
