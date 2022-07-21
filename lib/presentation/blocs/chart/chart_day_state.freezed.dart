// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chart_day_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChartDayState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)
        loaded,
    required TResult Function(String msg) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartDayInitial value) initial,
    required TResult Function(ChartDayLoaded value) loaded,
    required TResult Function(ChartDayError value) error,
    required TResult Function(ChartDayLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDayStateCopyWith<$Res> {
  factory $ChartDayStateCopyWith(
          ChartDayState value, $Res Function(ChartDayState) then) =
      _$ChartDayStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChartDayStateCopyWithImpl<$Res>
    implements $ChartDayStateCopyWith<$Res> {
  _$ChartDayStateCopyWithImpl(this._value, this._then);

  final ChartDayState _value;
  // ignore: unused_field
  final $Res Function(ChartDayState) _then;
}

/// @nodoc
abstract class _$$ChartDayInitialCopyWith<$Res> {
  factory _$$ChartDayInitialCopyWith(
          _$ChartDayInitial value, $Res Function(_$ChartDayInitial) then) =
      __$$ChartDayInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChartDayInitialCopyWithImpl<$Res>
    extends _$ChartDayStateCopyWithImpl<$Res>
    implements _$$ChartDayInitialCopyWith<$Res> {
  __$$ChartDayInitialCopyWithImpl(
      _$ChartDayInitial _value, $Res Function(_$ChartDayInitial) _then)
      : super(_value, (v) => _then(v as _$ChartDayInitial));

  @override
  _$ChartDayInitial get _value => super._value as _$ChartDayInitial;
}

/// @nodoc

class _$ChartDayInitial
    with DiagnosticableTreeMixin
    implements ChartDayInitial {
  const _$ChartDayInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartDayState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChartDayState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChartDayInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)
        loaded,
    required TResult Function(String msg) error,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
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
    required TResult Function(ChartDayInitial value) initial,
    required TResult Function(ChartDayLoaded value) loaded,
    required TResult Function(ChartDayError value) error,
    required TResult Function(ChartDayLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChartDayInitial implements ChartDayState {
  const factory ChartDayInitial() = _$ChartDayInitial;
}

/// @nodoc
abstract class _$$ChartDayLoadedCopyWith<$Res> {
  factory _$$ChartDayLoadedCopyWith(
          _$ChartDayLoaded value, $Res Function(_$ChartDayLoaded) then) =
      __$$ChartDayLoadedCopyWithImpl<$Res>;
  $Res call(
      {DateTime selectedDate,
      DateTime firstAllowedDate,
      DateTime lastAllowedDate,
      List<DrawChartEntity>? dataChart,
      String? slftPrice});
}

/// @nodoc
class __$$ChartDayLoadedCopyWithImpl<$Res>
    extends _$ChartDayStateCopyWithImpl<$Res>
    implements _$$ChartDayLoadedCopyWith<$Res> {
  __$$ChartDayLoadedCopyWithImpl(
      _$ChartDayLoaded _value, $Res Function(_$ChartDayLoaded) _then)
      : super(_value, (v) => _then(v as _$ChartDayLoaded));

  @override
  _$ChartDayLoaded get _value => super._value as _$ChartDayLoaded;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? firstAllowedDate = freezed,
    Object? lastAllowedDate = freezed,
    Object? dataChart = freezed,
    Object? slftPrice = freezed,
  }) {
    return _then(_$ChartDayLoaded(
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
      slftPrice: slftPrice == freezed
          ? _value.slftPrice
          : slftPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChartDayLoaded with DiagnosticableTreeMixin implements ChartDayLoaded {
  const _$ChartDayLoaded(
      {required this.selectedDate,
      required this.firstAllowedDate,
      required this.lastAllowedDate,
      final List<DrawChartEntity>? dataChart,
      this.slftPrice})
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
  final String? slftPrice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartDayState.loaded(selectedDate: $selectedDate, firstAllowedDate: $firstAllowedDate, lastAllowedDate: $lastAllowedDate, dataChart: $dataChart, slftPrice: $slftPrice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChartDayState.loaded'))
      ..add(DiagnosticsProperty('selectedDate', selectedDate))
      ..add(DiagnosticsProperty('firstAllowedDate', firstAllowedDate))
      ..add(DiagnosticsProperty('lastAllowedDate', lastAllowedDate))
      ..add(DiagnosticsProperty('dataChart', dataChart))
      ..add(DiagnosticsProperty('slftPrice', slftPrice));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDayLoaded &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.firstAllowedDate, firstAllowedDate) &&
            const DeepCollectionEquality()
                .equals(other.lastAllowedDate, lastAllowedDate) &&
            const DeepCollectionEquality()
                .equals(other._dataChart, _dataChart) &&
            const DeepCollectionEquality().equals(other.slftPrice, slftPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(firstAllowedDate),
      const DeepCollectionEquality().hash(lastAllowedDate),
      const DeepCollectionEquality().hash(_dataChart),
      const DeepCollectionEquality().hash(slftPrice));

  @JsonKey(ignore: true)
  @override
  _$$ChartDayLoadedCopyWith<_$ChartDayLoaded> get copyWith =>
      __$$ChartDayLoadedCopyWithImpl<_$ChartDayLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)
        loaded,
    required TResult Function(String msg) error,
    required TResult Function() loading,
  }) {
    return loaded(
        selectedDate, firstAllowedDate, lastAllowedDate, dataChart, slftPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
  }) {
    return loaded?.call(
        selectedDate, firstAllowedDate, lastAllowedDate, dataChart, slftPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(selectedDate, firstAllowedDate, lastAllowedDate, dataChart,
          slftPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartDayInitial value) initial,
    required TResult Function(ChartDayLoaded value) loaded,
    required TResult Function(ChartDayError value) error,
    required TResult Function(ChartDayLoading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChartDayLoaded implements ChartDayState {
  const factory ChartDayLoaded(
      {required final DateTime selectedDate,
      required final DateTime firstAllowedDate,
      required final DateTime lastAllowedDate,
      final List<DrawChartEntity>? dataChart,
      final String? slftPrice}) = _$ChartDayLoaded;

  DateTime get selectedDate;
  DateTime get firstAllowedDate;
  DateTime get lastAllowedDate;
  List<DrawChartEntity>? get dataChart;
  String? get slftPrice;
  @JsonKey(ignore: true)
  _$$ChartDayLoadedCopyWith<_$ChartDayLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChartDayErrorCopyWith<$Res> {
  factory _$$ChartDayErrorCopyWith(
          _$ChartDayError value, $Res Function(_$ChartDayError) then) =
      __$$ChartDayErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$ChartDayErrorCopyWithImpl<$Res>
    extends _$ChartDayStateCopyWithImpl<$Res>
    implements _$$ChartDayErrorCopyWith<$Res> {
  __$$ChartDayErrorCopyWithImpl(
      _$ChartDayError _value, $Res Function(_$ChartDayError) _then)
      : super(_value, (v) => _then(v as _$ChartDayError));

  @override
  _$ChartDayError get _value => super._value as _$ChartDayError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$ChartDayError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChartDayError with DiagnosticableTreeMixin implements ChartDayError {
  const _$ChartDayError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartDayState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChartDayState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDayError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$ChartDayErrorCopyWith<_$ChartDayError> get copyWith =>
      __$$ChartDayErrorCopyWithImpl<_$ChartDayError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)
        loaded,
    required TResult Function(String msg) error,
    required TResult Function() loading,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
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
    required TResult Function(ChartDayInitial value) initial,
    required TResult Function(ChartDayLoaded value) loaded,
    required TResult Function(ChartDayError value) error,
    required TResult Function(ChartDayLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChartDayError implements ChartDayState {
  const factory ChartDayError(final String msg) = _$ChartDayError;

  String get msg;
  @JsonKey(ignore: true)
  _$$ChartDayErrorCopyWith<_$ChartDayError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChartDayLoadingCopyWith<$Res> {
  factory _$$ChartDayLoadingCopyWith(
          _$ChartDayLoading value, $Res Function(_$ChartDayLoading) then) =
      __$$ChartDayLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChartDayLoadingCopyWithImpl<$Res>
    extends _$ChartDayStateCopyWithImpl<$Res>
    implements _$$ChartDayLoadingCopyWith<$Res> {
  __$$ChartDayLoadingCopyWithImpl(
      _$ChartDayLoading _value, $Res Function(_$ChartDayLoading) _then)
      : super(_value, (v) => _then(v as _$ChartDayLoading));

  @override
  _$ChartDayLoading get _value => super._value as _$ChartDayLoading;
}

/// @nodoc

class _$ChartDayLoading
    with DiagnosticableTreeMixin
    implements ChartDayLoading {
  const _$ChartDayLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChartDayState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChartDayState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChartDayLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)
        loaded,
    required TResult Function(String msg) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            DateTime selectedDate,
            DateTime firstAllowedDate,
            DateTime lastAllowedDate,
            List<DrawChartEntity>? dataChart,
            String? slftPrice)?
        loaded,
    TResult Function(String msg)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartDayInitial value) initial,
    required TResult Function(ChartDayLoaded value) loaded,
    required TResult Function(ChartDayError value) error,
    required TResult Function(ChartDayLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartDayInitial value)? initial,
    TResult Function(ChartDayLoaded value)? loaded,
    TResult Function(ChartDayError value)? error,
    TResult Function(ChartDayLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChartDayLoading implements ChartDayState {
  const factory ChartDayLoading() = _$ChartDayLoading;
}
