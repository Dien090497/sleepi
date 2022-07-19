// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'individual_point_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IndividualPointState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)
        initial,
    required TResult Function() done,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IndividualPointInitial value) initial,
    required TResult Function(IndividualPointDone value) done,
    required TResult Function(IndividualPointError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualPointStateCopyWith<$Res> {
  factory $IndividualPointStateCopyWith(IndividualPointState value,
          $Res Function(IndividualPointState) then) =
      _$IndividualPointStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IndividualPointStateCopyWithImpl<$Res>
    implements $IndividualPointStateCopyWith<$Res> {
  _$IndividualPointStateCopyWithImpl(this._value, this._then);

  final IndividualPointState _value;
  // ignore: unused_field
  final $Res Function(IndividualPointState) _then;
}

/// @nodoc
abstract class _$$IndividualPointInitialCopyWith<$Res> {
  factory _$$IndividualPointInitialCopyWith(_$IndividualPointInitial value,
          $Res Function(_$IndividualPointInitial) then) =
      __$$IndividualPointInitialCopyWithImpl<$Res>;
  $Res call(
      {double? maxPoint,
      double? point,
      BedEntity bed,
      List<double> startAttributes,
      List<double> attributesChanged,
      List<String> attributesNames,
      bool isLoading,
      double maxAttribute});

  $BedEntityCopyWith<$Res> get bed;
}

/// @nodoc
class __$$IndividualPointInitialCopyWithImpl<$Res>
    extends _$IndividualPointStateCopyWithImpl<$Res>
    implements _$$IndividualPointInitialCopyWith<$Res> {
  __$$IndividualPointInitialCopyWithImpl(_$IndividualPointInitial _value,
      $Res Function(_$IndividualPointInitial) _then)
      : super(_value, (v) => _then(v as _$IndividualPointInitial));

  @override
  _$IndividualPointInitial get _value =>
      super._value as _$IndividualPointInitial;

  @override
  $Res call({
    Object? maxPoint = freezed,
    Object? point = freezed,
    Object? bed = freezed,
    Object? startAttributes = freezed,
    Object? attributesChanged = freezed,
    Object? attributesNames = freezed,
    Object? isLoading = freezed,
    Object? maxAttribute = freezed,
  }) {
    return _then(_$IndividualPointInitial(
      maxPoint: maxPoint == freezed
          ? _value.maxPoint
          : maxPoint // ignore: cast_nullable_to_non_nullable
              as double?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as double?,
      bed: bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
      startAttributes: startAttributes == freezed
          ? _value._startAttributes
          : startAttributes // ignore: cast_nullable_to_non_nullable
              as List<double>,
      attributesChanged: attributesChanged == freezed
          ? _value._attributesChanged
          : attributesChanged // ignore: cast_nullable_to_non_nullable
              as List<double>,
      attributesNames: attributesNames == freezed
          ? _value._attributesNames
          : attributesNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      maxAttribute: maxAttribute == freezed
          ? _value.maxAttribute
          : maxAttribute // ignore: cast_nullable_to_non_nullable
              as double,
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

class _$IndividualPointInitial
    with DiagnosticableTreeMixin
    implements IndividualPointInitial {
  const _$IndividualPointInitial(
      {this.maxPoint,
      this.point,
      required this.bed,
      required final List<double> startAttributes,
      required final List<double> attributesChanged,
      required final List<String> attributesNames,
      this.isLoading = false,
      this.maxAttribute = 30})
      : _startAttributes = startAttributes,
        _attributesChanged = attributesChanged,
        _attributesNames = attributesNames;

  @override
  final double? maxPoint;
  @override
  final double? point;
  @override
  final BedEntity bed;
  final List<double> _startAttributes;
  @override
  List<double> get startAttributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_startAttributes);
  }

  final List<double> _attributesChanged;
  @override
  List<double> get attributesChanged {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributesChanged);
  }

// required List<double> attributesDistributed,
  final List<String> _attributesNames;
// required List<double> attributesDistributed,
  @override
  List<String> get attributesNames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributesNames);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final double maxAttribute;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualPointState.initial(maxPoint: $maxPoint, point: $point, bed: $bed, startAttributes: $startAttributes, attributesChanged: $attributesChanged, attributesNames: $attributesNames, isLoading: $isLoading, maxAttribute: $maxAttribute)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualPointState.initial'))
      ..add(DiagnosticsProperty('maxPoint', maxPoint))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('bed', bed))
      ..add(DiagnosticsProperty('startAttributes', startAttributes))
      ..add(DiagnosticsProperty('attributesChanged', attributesChanged))
      ..add(DiagnosticsProperty('attributesNames', attributesNames))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('maxAttribute', maxAttribute));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualPointInitial &&
            const DeepCollectionEquality().equals(other.maxPoint, maxPoint) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality().equals(other.bed, bed) &&
            const DeepCollectionEquality()
                .equals(other._startAttributes, _startAttributes) &&
            const DeepCollectionEquality()
                .equals(other._attributesChanged, _attributesChanged) &&
            const DeepCollectionEquality()
                .equals(other._attributesNames, _attributesNames) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.maxAttribute, maxAttribute));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maxPoint),
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(bed),
      const DeepCollectionEquality().hash(_startAttributes),
      const DeepCollectionEquality().hash(_attributesChanged),
      const DeepCollectionEquality().hash(_attributesNames),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(maxAttribute));

  @JsonKey(ignore: true)
  @override
  _$$IndividualPointInitialCopyWith<_$IndividualPointInitial> get copyWith =>
      __$$IndividualPointInitialCopyWithImpl<_$IndividualPointInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)
        initial,
    required TResult Function() done,
    required TResult Function(String msg) error,
  }) {
    return initial(maxPoint, point, bed, startAttributes, attributesChanged,
        attributesNames, isLoading, maxAttribute);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
  }) {
    return initial?.call(maxPoint, point, bed, startAttributes,
        attributesChanged, attributesNames, isLoading, maxAttribute);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(maxPoint, point, bed, startAttributes, attributesChanged,
          attributesNames, isLoading, maxAttribute);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IndividualPointInitial value) initial,
    required TResult Function(IndividualPointDone value) done,
    required TResult Function(IndividualPointError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class IndividualPointInitial implements IndividualPointState {
  const factory IndividualPointInitial(
      {final double? maxPoint,
      final double? point,
      required final BedEntity bed,
      required final List<double> startAttributes,
      required final List<double> attributesChanged,
      required final List<String> attributesNames,
      final bool isLoading,
      final double maxAttribute}) = _$IndividualPointInitial;

  double? get maxPoint;
  double? get point;
  BedEntity get bed;
  List<double> get startAttributes;
  List<double>
      get attributesChanged; // required List<double> attributesDistributed,
  List<String> get attributesNames;
  bool get isLoading;
  double get maxAttribute;
  @JsonKey(ignore: true)
  _$$IndividualPointInitialCopyWith<_$IndividualPointInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IndividualPointDoneCopyWith<$Res> {
  factory _$$IndividualPointDoneCopyWith(_$IndividualPointDone value,
          $Res Function(_$IndividualPointDone) then) =
      __$$IndividualPointDoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IndividualPointDoneCopyWithImpl<$Res>
    extends _$IndividualPointStateCopyWithImpl<$Res>
    implements _$$IndividualPointDoneCopyWith<$Res> {
  __$$IndividualPointDoneCopyWithImpl(
      _$IndividualPointDone _value, $Res Function(_$IndividualPointDone) _then)
      : super(_value, (v) => _then(v as _$IndividualPointDone));

  @override
  _$IndividualPointDone get _value => super._value as _$IndividualPointDone;
}

/// @nodoc

class _$IndividualPointDone
    with DiagnosticableTreeMixin
    implements IndividualPointDone {
  const _$IndividualPointDone();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualPointState.done()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'IndividualPointState.done'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IndividualPointDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)
        initial,
    required TResult Function() done,
    required TResult Function(String msg) error,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IndividualPointInitial value) initial,
    required TResult Function(IndividualPointDone value) done,
    required TResult Function(IndividualPointError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class IndividualPointDone implements IndividualPointState {
  const factory IndividualPointDone() = _$IndividualPointDone;
}

/// @nodoc
abstract class _$$IndividualPointErrorCopyWith<$Res> {
  factory _$$IndividualPointErrorCopyWith(_$IndividualPointError value,
          $Res Function(_$IndividualPointError) then) =
      __$$IndividualPointErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$IndividualPointErrorCopyWithImpl<$Res>
    extends _$IndividualPointStateCopyWithImpl<$Res>
    implements _$$IndividualPointErrorCopyWith<$Res> {
  __$$IndividualPointErrorCopyWithImpl(_$IndividualPointError _value,
      $Res Function(_$IndividualPointError) _then)
      : super(_value, (v) => _then(v as _$IndividualPointError));

  @override
  _$IndividualPointError get _value => super._value as _$IndividualPointError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$IndividualPointError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IndividualPointError
    with DiagnosticableTreeMixin
    implements IndividualPointError {
  const _$IndividualPointError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualPointState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualPointState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualPointError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$IndividualPointErrorCopyWith<_$IndividualPointError> get copyWith =>
      __$$IndividualPointErrorCopyWithImpl<_$IndividualPointError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)
        initial,
    required TResult Function() done,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double? maxPoint,
            double? point,
            BedEntity bed,
            List<double> startAttributes,
            List<double> attributesChanged,
            List<String> attributesNames,
            bool isLoading,
            double maxAttribute)?
        initial,
    TResult Function()? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IndividualPointInitial value) initial,
    required TResult Function(IndividualPointDone value) done,
    required TResult Function(IndividualPointError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
    TResult Function(IndividualPointError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class IndividualPointError implements IndividualPointState {
  const factory IndividualPointError(final String msg) = _$IndividualPointError;

  String get msg;
  @JsonKey(ignore: true)
  _$$IndividualPointErrorCopyWith<_$IndividualPointError> get copyWith =>
      throw _privateConstructorUsedError;
}
