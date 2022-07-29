// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transfer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransferState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) failed,
    required TResult Function(double depositTokenGas) getEstimateGasFee,
    required TResult Function() success,
    required TResult Function(bool isToSpending, bool isLoading,
            String? errorMsg, String? typeError, bool? needApprove)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferEstimateGasFeeSuccess value)
        getEstimateGasFee,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferStateCopyWith<$Res> {
  factory $TransferStateCopyWith(
          TransferState value, $Res Function(TransferState) then) =
      _$TransferStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransferStateCopyWithImpl<$Res>
    implements $TransferStateCopyWith<$Res> {
  _$TransferStateCopyWithImpl(this._value, this._then);

  final TransferState _value;
  // ignore: unused_field
  final $Res Function(TransferState) _then;
}

/// @nodoc
abstract class _$$TransferFailedCopyWith<$Res> {
  factory _$$TransferFailedCopyWith(
          _$TransferFailed value, $Res Function(_$TransferFailed) then) =
      __$$TransferFailedCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$TransferFailedCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$$TransferFailedCopyWith<$Res> {
  __$$TransferFailedCopyWithImpl(
      _$TransferFailed _value, $Res Function(_$TransferFailed) _then)
      : super(_value, (v) => _then(v as _$TransferFailed));

  @override
  _$TransferFailed get _value => super._value as _$TransferFailed;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$TransferFailed(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransferFailed with DiagnosticableTreeMixin implements TransferFailed {
  const _$TransferFailed(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransferState.failed(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransferState.failed'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferFailed &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$TransferFailedCopyWith<_$TransferFailed> get copyWith =>
      __$$TransferFailedCopyWithImpl<_$TransferFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) failed,
    required TResult Function(double depositTokenGas) getEstimateGasFee,
    required TResult Function() success,
    required TResult Function(bool isToSpending, bool isLoading,
            String? errorMsg, String? typeError, bool? needApprove)
        loaded,
  }) {
    return failed(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
  }) {
    return failed?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferEstimateGasFeeSuccess value)
        getEstimateGasFee,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class TransferFailed implements TransferState {
  const factory TransferFailed(final String msg) = _$TransferFailed;

  String get msg;
  @JsonKey(ignore: true)
  _$$TransferFailedCopyWith<_$TransferFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferEstimateGasFeeSuccessCopyWith<$Res> {
  factory _$$TransferEstimateGasFeeSuccessCopyWith(
          _$TransferEstimateGasFeeSuccess value,
          $Res Function(_$TransferEstimateGasFeeSuccess) then) =
      __$$TransferEstimateGasFeeSuccessCopyWithImpl<$Res>;
  $Res call({double depositTokenGas});
}

/// @nodoc
class __$$TransferEstimateGasFeeSuccessCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$$TransferEstimateGasFeeSuccessCopyWith<$Res> {
  __$$TransferEstimateGasFeeSuccessCopyWithImpl(
      _$TransferEstimateGasFeeSuccess _value,
      $Res Function(_$TransferEstimateGasFeeSuccess) _then)
      : super(_value, (v) => _then(v as _$TransferEstimateGasFeeSuccess));

  @override
  _$TransferEstimateGasFeeSuccess get _value =>
      super._value as _$TransferEstimateGasFeeSuccess;

  @override
  $Res call({
    Object? depositTokenGas = freezed,
  }) {
    return _then(_$TransferEstimateGasFeeSuccess(
      depositTokenGas == freezed
          ? _value.depositTokenGas
          : depositTokenGas // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TransferEstimateGasFeeSuccess
    with DiagnosticableTreeMixin
    implements TransferEstimateGasFeeSuccess {
  const _$TransferEstimateGasFeeSuccess(this.depositTokenGas);

  @override
  final double depositTokenGas;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransferState.getEstimateGasFee(depositTokenGas: $depositTokenGas)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransferState.getEstimateGasFee'))
      ..add(DiagnosticsProperty('depositTokenGas', depositTokenGas));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferEstimateGasFeeSuccess &&
            const DeepCollectionEquality()
                .equals(other.depositTokenGas, depositTokenGas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(depositTokenGas));

  @JsonKey(ignore: true)
  @override
  _$$TransferEstimateGasFeeSuccessCopyWith<_$TransferEstimateGasFeeSuccess>
      get copyWith => __$$TransferEstimateGasFeeSuccessCopyWithImpl<
          _$TransferEstimateGasFeeSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) failed,
    required TResult Function(double depositTokenGas) getEstimateGasFee,
    required TResult Function() success,
    required TResult Function(bool isToSpending, bool isLoading,
            String? errorMsg, String? typeError, bool? needApprove)
        loaded,
  }) {
    return getEstimateGasFee(depositTokenGas);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
  }) {
    return getEstimateGasFee?.call(depositTokenGas);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
    required TResult orElse(),
  }) {
    if (getEstimateGasFee != null) {
      return getEstimateGasFee(depositTokenGas);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferEstimateGasFeeSuccess value)
        getEstimateGasFee,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return getEstimateGasFee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return getEstimateGasFee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (getEstimateGasFee != null) {
      return getEstimateGasFee(this);
    }
    return orElse();
  }
}

abstract class TransferEstimateGasFeeSuccess implements TransferState {
  const factory TransferEstimateGasFeeSuccess(final double depositTokenGas) =
      _$TransferEstimateGasFeeSuccess;

  double get depositTokenGas;
  @JsonKey(ignore: true)
  _$$TransferEstimateGasFeeSuccessCopyWith<_$TransferEstimateGasFeeSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferSuccessCopyWith<$Res> {
  factory _$$TransferSuccessCopyWith(
          _$TransferSuccess value, $Res Function(_$TransferSuccess) then) =
      __$$TransferSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferSuccessCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$$TransferSuccessCopyWith<$Res> {
  __$$TransferSuccessCopyWithImpl(
      _$TransferSuccess _value, $Res Function(_$TransferSuccess) _then)
      : super(_value, (v) => _then(v as _$TransferSuccess));

  @override
  _$TransferSuccess get _value => super._value as _$TransferSuccess;
}

/// @nodoc

class _$TransferSuccess
    with DiagnosticableTreeMixin
    implements TransferSuccess {
  const _$TransferSuccess();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransferState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TransferState.success'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransferSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) failed,
    required TResult Function(double depositTokenGas) getEstimateGasFee,
    required TResult Function() success,
    required TResult Function(bool isToSpending, bool isLoading,
            String? errorMsg, String? typeError, bool? needApprove)
        loaded,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferEstimateGasFeeSuccess value)
        getEstimateGasFee,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TransferSuccess implements TransferState {
  const factory TransferSuccess() = _$TransferSuccess;
}

/// @nodoc
abstract class _$$TransferLoadedCopyWith<$Res> {
  factory _$$TransferLoadedCopyWith(
          _$TransferLoaded value, $Res Function(_$TransferLoaded) then) =
      __$$TransferLoadedCopyWithImpl<$Res>;
  $Res call(
      {bool isToSpending,
      bool isLoading,
      String? errorMsg,
      String? typeError,
      bool? needApprove});
}

/// @nodoc
class __$$TransferLoadedCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$$TransferLoadedCopyWith<$Res> {
  __$$TransferLoadedCopyWithImpl(
      _$TransferLoaded _value, $Res Function(_$TransferLoaded) _then)
      : super(_value, (v) => _then(v as _$TransferLoaded));

  @override
  _$TransferLoaded get _value => super._value as _$TransferLoaded;

  @override
  $Res call({
    Object? isToSpending = freezed,
    Object? isLoading = freezed,
    Object? errorMsg = freezed,
    Object? typeError = freezed,
    Object? needApprove = freezed,
  }) {
    return _then(_$TransferLoaded(
      isToSpending: isToSpending == freezed
          ? _value.isToSpending
          : isToSpending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      typeError: typeError == freezed
          ? _value.typeError
          : typeError // ignore: cast_nullable_to_non_nullable
              as String?,
      needApprove: needApprove == freezed
          ? _value.needApprove
          : needApprove // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$TransferLoaded with DiagnosticableTreeMixin implements TransferLoaded {
  const _$TransferLoaded(
      {required this.isToSpending,
      this.isLoading = false,
      this.errorMsg,
      this.typeError,
      this.needApprove});

  @override
  final bool isToSpending;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMsg;
  @override
  final String? typeError;
  @override
  final bool? needApprove;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransferState.loaded(isToSpending: $isToSpending, isLoading: $isLoading, errorMsg: $errorMsg, typeError: $typeError, needApprove: $needApprove)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransferState.loaded'))
      ..add(DiagnosticsProperty('isToSpending', isToSpending))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorMsg', errorMsg))
      ..add(DiagnosticsProperty('typeError', typeError))
      ..add(DiagnosticsProperty('needApprove', needApprove));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferLoaded &&
            const DeepCollectionEquality()
                .equals(other.isToSpending, isToSpending) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality().equals(other.typeError, typeError) &&
            const DeepCollectionEquality()
                .equals(other.needApprove, needApprove));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isToSpending),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(typeError),
      const DeepCollectionEquality().hash(needApprove));

  @JsonKey(ignore: true)
  @override
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      __$$TransferLoadedCopyWithImpl<_$TransferLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String msg) failed,
    required TResult Function(double depositTokenGas) getEstimateGasFee,
    required TResult Function() success,
    required TResult Function(bool isToSpending, bool isLoading,
            String? errorMsg, String? typeError, bool? needApprove)
        loaded,
  }) {
    return loaded(isToSpending, isLoading, errorMsg, typeError, needApprove);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
  }) {
    return loaded?.call(
        isToSpending, isLoading, errorMsg, typeError, needApprove);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String msg)? failed,
    TResult Function(double depositTokenGas)? getEstimateGasFee,
    TResult Function()? success,
    TResult Function(bool isToSpending, bool isLoading, String? errorMsg,
            String? typeError, bool? needApprove)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isToSpending, isLoading, errorMsg, typeError, needApprove);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferEstimateGasFeeSuccess value)
        getEstimateGasFee,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferEstimateGasFeeSuccess value)? getEstimateGasFee,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TransferLoaded implements TransferState {
  const factory TransferLoaded(
      {required final bool isToSpending,
      final bool isLoading,
      final String? errorMsg,
      final String? typeError,
      final bool? needApprove}) = _$TransferLoaded;

  bool get isToSpending;
  bool get isLoading;
  String? get errorMsg;
  String? get typeError;
  bool? get needApprove;
  @JsonKey(ignore: true)
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
