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
    required TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)
        initial,
    required TResult Function() done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)?
        initial,
    TResult Function()? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)?
        initial,
    TResult Function()? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IndividualPointInitial value) initial,
    required TResult Function(IndividualPointDone value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
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
      {double point,
      List<double> startAttributes,
      List<double> attributesChanged,
      List<String> attributesNames});
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
    Object? point = freezed,
    Object? startAttributes = freezed,
    Object? attributesChanged = freezed,
    Object? attributesNames = freezed,
  }) {
    return _then(_$IndividualPointInitial(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as double,
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
    ));
  }
}

/// @nodoc

class _$IndividualPointInitial
    with DiagnosticableTreeMixin
    implements IndividualPointInitial {
  const _$IndividualPointInitial(
      {required this.point,
      required final List<double> startAttributes,
      required final List<double> attributesChanged,
      required final List<String> attributesNames})
      : _startAttributes = startAttributes,
        _attributesChanged = attributesChanged,
        _attributesNames = attributesNames;

  @override
  final double point;
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

  final List<String> _attributesNames;
  @override
  List<String> get attributesNames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributesNames);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualPointState.initial(point: $point, startAttributes: $startAttributes, attributesChanged: $attributesChanged, attributesNames: $attributesNames)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualPointState.initial'))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('startAttributes', startAttributes))
      ..add(DiagnosticsProperty('attributesChanged', attributesChanged))
      ..add(DiagnosticsProperty('attributesNames', attributesNames));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualPointInitial &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality()
                .equals(other._startAttributes, _startAttributes) &&
            const DeepCollectionEquality()
                .equals(other._attributesChanged, _attributesChanged) &&
            const DeepCollectionEquality()
                .equals(other._attributesNames, _attributesNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(_startAttributes),
      const DeepCollectionEquality().hash(_attributesChanged),
      const DeepCollectionEquality().hash(_attributesNames));

  @JsonKey(ignore: true)
  @override
  _$$IndividualPointInitialCopyWith<_$IndividualPointInitial> get copyWith =>
      __$$IndividualPointInitialCopyWithImpl<_$IndividualPointInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)
        initial,
    required TResult Function() done,
  }) {
    return initial(point, startAttributes, attributesChanged, attributesNames);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)?
        initial,
    TResult Function()? done,
  }) {
    return initial?.call(
        point, startAttributes, attributesChanged, attributesNames);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)?
        initial,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          point, startAttributes, attributesChanged, attributesNames);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IndividualPointInitial value) initial,
    required TResult Function(IndividualPointDone value) done,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
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
      {required final double point,
      required final List<double> startAttributes,
      required final List<double> attributesChanged,
      required final List<String> attributesNames}) = _$IndividualPointInitial;

  double get point;
  List<double> get startAttributes;
  List<double> get attributesChanged;
  List<String> get attributesNames;
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
    required TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)
        initial,
    required TResult Function() done,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)?
        initial,
    TResult Function()? done,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double point, List<double> startAttributes,
            List<double> attributesChanged, List<String> attributesNames)?
        initial,
    TResult Function()? done,
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
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IndividualPointInitial value)? initial,
    TResult Function(IndividualPointDone value)? done,
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
