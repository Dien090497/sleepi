// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chart_month_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChartMonthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)
        loaded,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartMonthInitial value) initial,
    required TResult Function(ChartMonthLoaded value) loaded,
    required TResult Function(ChartMonthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartMonthStateCopyWith<$Res> {
  factory $ChartMonthStateCopyWith(
          ChartMonthState value, $Res Function(ChartMonthState) then) =
      _$ChartMonthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChartMonthStateCopyWithImpl<$Res>
    implements $ChartMonthStateCopyWith<$Res> {
  _$ChartMonthStateCopyWithImpl(this._value, this._then);

  final ChartMonthState _value;
  // ignore: unused_field
  final $Res Function(ChartMonthState) _then;
}

/// @nodoc
abstract class _$$ChartMonthInitialCopyWith<$Res> {
  factory _$$ChartMonthInitialCopyWith(
          _$ChartMonthInitial value, $Res Function(_$ChartMonthInitial) then) =
      __$$ChartMonthInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChartMonthInitialCopyWithImpl<$Res>
    extends _$ChartMonthStateCopyWithImpl<$Res>
    implements _$$ChartMonthInitialCopyWith<$Res> {
  __$$ChartMonthInitialCopyWithImpl(
      _$ChartMonthInitial _value, $Res Function(_$ChartMonthInitial) _then)
      : super(_value, (v) => _then(v as _$ChartMonthInitial));

  @override
  _$ChartMonthInitial get _value => super._value as _$ChartMonthInitial;
}

/// @nodoc

class _$ChartMonthInitial
    with DiagnosticableTreeMixin
    implements ChartMonthInitial {
  const _$ChartMonthInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartMonthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChartMonthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChartMonthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartMonthInitial value) initial,
    required TResult Function(ChartMonthLoaded value) loaded,
    required TResult Function(ChartMonthError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChartMonthInitial implements ChartMonthState {
  const factory ChartMonthInitial() = _$ChartMonthInitial;
}

/// @nodoc
abstract class _$$ChartMonthLoadedCopyWith<$Res> {
  factory _$$ChartMonthLoadedCopyWith(
          _$ChartMonthLoaded value, $Res Function(_$ChartMonthLoaded) then) =
      __$$ChartMonthLoadedCopyWithImpl<$Res>;
  $Res call(
      {DateTime selectedDate,
      DateTime firstAllowedDate,
      DateTime lastAllowedDate,
      List<DrawChartEntity>? dataChart});
}

/// @nodoc
class __$$ChartMonthLoadedCopyWithImpl<$Res>
    extends _$ChartMonthStateCopyWithImpl<$Res>
    implements _$$ChartMonthLoadedCopyWith<$Res> {
  __$$ChartMonthLoadedCopyWithImpl(
      _$ChartMonthLoaded _value, $Res Function(_$ChartMonthLoaded) _then)
      : super(_value, (v) => _then(v as _$ChartMonthLoaded));

  @override
  _$ChartMonthLoaded get _value => super._value as _$ChartMonthLoaded;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? firstAllowedDate = freezed,
    Object? lastAllowedDate = freezed,
    Object? dataChart = freezed,
  }) {
    return _then(_$ChartMonthLoaded(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstAllowedDate: firstAllowedDate == freezed
          ? _value.firstAllowedDate
          : firstAllowedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAllowedDate: lastAllowedDate == freezed
          ? _value.lastAllowedDate
          : lastAllowedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataChart: dataChart == freezed
          ? _value._dataChart
          : dataChart // ignore: cast_nullable_to_non_nullable
              as List<DrawChartEntity>?,
    ));
  }
}

/// @nodoc

class _$ChartMonthLoaded
    with DiagnosticableTreeMixin
    implements ChartMonthLoaded {
  const _$ChartMonthLoaded(
      {required this.selectedDate,
      required this.firstAllowedDate,
      required this.lastAllowedDate,
      final List<DrawChartEntity>? dataChart})
      : _dataChart = dataChart;

  @override
  final DateTime selectedDate;
  @override
  final DateTime firstAllowedDate;
  @override
  final DateTime lastAllowedDate;
  final List<DrawChartEntity>? _dataChart;
  @override
  List<DrawChartEntity>? get dataChart {
    final value = _dataChart;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartMonthState.loaded(selectedDate: $selectedDate, firstAllowedDate: $firstAllowedDate, lastAllowedDate: $lastAllowedDate, dataChart: $dataChart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChartMonthState.loaded'))
      ..add(DiagnosticsProperty('selectedDate', selectedDate))
      ..add(DiagnosticsProperty('firstAllowedDate', firstAllowedDate))
      ..add(DiagnosticsProperty('lastAllowedDate', lastAllowedDate))
      ..add(DiagnosticsProperty('dataChart', dataChart));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartMonthLoaded &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.firstAllowedDate, firstAllowedDate) &&
            const DeepCollectionEquality()
                .equals(other.lastAllowedDate, lastAllowedDate) &&
            const DeepCollectionEquality()
                .equals(other._dataChart, _dataChart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(firstAllowedDate),
      const DeepCollectionEquality().hash(lastAllowedDate),
      const DeepCollectionEquality().hash(_dataChart));

  @JsonKey(ignore: true)
  @override
  _$$ChartMonthLoadedCopyWith<_$ChartMonthLoaded> get copyWith =>
      __$$ChartMonthLoadedCopyWithImpl<_$ChartMonthLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return loaded(selectedDate, firstAllowedDate, lastAllowedDate, dataChart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return loaded?.call(
        selectedDate, firstAllowedDate, lastAllowedDate, dataChart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(selectedDate, firstAllowedDate, lastAllowedDate, dataChart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartMonthInitial value) initial,
    required TResult Function(ChartMonthLoaded value) loaded,
    required TResult Function(ChartMonthError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChartMonthLoaded implements ChartMonthState {
  const factory ChartMonthLoaded(
      {required final DateTime selectedDate,
      required final DateTime firstAllowedDate,
      required final DateTime lastAllowedDate,
      final List<DrawChartEntity>? dataChart}) = _$ChartMonthLoaded;

  DateTime get selectedDate;
  DateTime get firstAllowedDate;
  DateTime get lastAllowedDate;
  List<DrawChartEntity>? get dataChart;
  @JsonKey(ignore: true)
  _$$ChartMonthLoadedCopyWith<_$ChartMonthLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChartMonthErrorCopyWith<$Res> {
  factory _$$ChartMonthErrorCopyWith(
          _$ChartMonthError value, $Res Function(_$ChartMonthError) then) =
      __$$ChartMonthErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$ChartMonthErrorCopyWithImpl<$Res>
    extends _$ChartMonthStateCopyWithImpl<$Res>
    implements _$$ChartMonthErrorCopyWith<$Res> {
  __$$ChartMonthErrorCopyWithImpl(
      _$ChartMonthError _value, $Res Function(_$ChartMonthError) _then)
      : super(_value, (v) => _then(v as _$ChartMonthError));

  @override
  _$ChartMonthError get _value => super._value as _$ChartMonthError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$ChartMonthError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChartMonthError
    with DiagnosticableTreeMixin
    implements ChartMonthError {
  const _$ChartMonthError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartMonthState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChartMonthState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartMonthError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$ChartMonthErrorCopyWith<_$ChartMonthError> get copyWith =>
      __$$ChartMonthErrorCopyWithImpl<_$ChartMonthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)
        loaded,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DateTime selectedDate, DateTime firstAllowedDate,
            DateTime lastAllowedDate, List<DrawChartEntity>? dataChart)?
        loaded,
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
    required TResult Function(ChartMonthInitial value) initial,
    required TResult Function(ChartMonthLoaded value) loaded,
    required TResult Function(ChartMonthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartMonthInitial value)? initial,
    TResult Function(ChartMonthLoaded value)? loaded,
    TResult Function(ChartMonthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChartMonthError implements ChartMonthState {
  const factory ChartMonthError(final String msg) = _$ChartMonthError;

  String get msg;
  @JsonKey(ignore: true)
  _$$ChartMonthErrorCopyWith<_$ChartMonthError> get copyWith =>
      throw _privateConstructorUsedError;
}
