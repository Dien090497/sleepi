// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gacha_spin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GachaSpinState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GachaSpinStateCopyWith<$Res> {
  factory $GachaSpinStateCopyWith(
          GachaSpinState value, $Res Function(GachaSpinState) then) =
      _$GachaSpinStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GachaSpinStateCopyWithImpl<$Res>
    implements $GachaSpinStateCopyWith<$Res> {
  _$GachaSpinStateCopyWithImpl(this._value, this._then);

  final GachaSpinState _value;
  // ignore: unused_field
  final $Res Function(GachaSpinState) _then;
}

/// @nodoc
abstract class _$$GachaSpinStateInitialCopyWith<$Res> {
  factory _$$GachaSpinStateInitialCopyWith(_$GachaSpinStateInitial value,
          $Res Function(_$GachaSpinStateInitial) then) =
      __$$GachaSpinStateInitialCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$$GachaSpinStateInitialCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaSpinStateInitialCopyWith<$Res> {
  __$$GachaSpinStateInitialCopyWithImpl(_$GachaSpinStateInitial _value,
      $Res Function(_$GachaSpinStateInitial) _then)
      : super(_value, (v) => _then(v as _$GachaSpinStateInitial));

  @override
  _$GachaSpinStateInitial get _value => super._value as _$GachaSpinStateInitial;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$GachaSpinStateInitial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GachaSpinStateInitial implements GachaSpinStateInitial {
  const _$GachaSpinStateInitial({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'GachaSpinState.initial(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GachaSpinStateInitial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$GachaSpinStateInitialCopyWith<_$GachaSpinStateInitial> get copyWith =>
      __$$GachaSpinStateInitialCopyWithImpl<_$GachaSpinStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GachaSpinStateInitial implements GachaSpinState {
  const factory GachaSpinStateInitial({final bool isLoading}) =
      _$GachaSpinStateInitial;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$GachaSpinStateInitialCopyWith<_$GachaSpinStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$gachaSpinDoneCopyWith<$Res> {
  factory _$$gachaSpinDoneCopyWith(
          _$gachaSpinDone value, $Res Function(_$gachaSpinDone) then) =
      __$$gachaSpinDoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$gachaSpinDoneCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$gachaSpinDoneCopyWith<$Res> {
  __$$gachaSpinDoneCopyWithImpl(
      _$gachaSpinDone _value, $Res Function(_$gachaSpinDone) _then)
      : super(_value, (v) => _then(v as _$gachaSpinDone));

  @override
  _$gachaSpinDone get _value => super._value as _$gachaSpinDone;
}

/// @nodoc

class _$gachaSpinDone implements gachaSpinDone {
  const _$gachaSpinDone();

  @override
  String toString() {
    return 'GachaSpinState.done()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$gachaSpinDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
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
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class gachaSpinDone implements GachaSpinState {
  const factory gachaSpinDone() = _$gachaSpinDone;
}

/// @nodoc
abstract class _$$GachaSpinLoadingCopyWith<$Res> {
  factory _$$GachaSpinLoadingCopyWith(
          _$GachaSpinLoading value, $Res Function(_$GachaSpinLoading) then) =
      __$$GachaSpinLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GachaSpinLoadingCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaSpinLoadingCopyWith<$Res> {
  __$$GachaSpinLoadingCopyWithImpl(
      _$GachaSpinLoading _value, $Res Function(_$GachaSpinLoading) _then)
      : super(_value, (v) => _then(v as _$GachaSpinLoading));

  @override
  _$GachaSpinLoading get _value => super._value as _$GachaSpinLoading;
}

/// @nodoc

class _$GachaSpinLoading implements GachaSpinLoading {
  const _$GachaSpinLoading();

  @override
  String toString() {
    return 'GachaSpinState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GachaSpinLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
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
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GachaSpinLoading implements GachaSpinState {
  const factory GachaSpinLoading() = _$GachaSpinLoading;
}

/// @nodoc
abstract class _$$GachaSpinSuccessCopyWith<$Res> {
  factory _$$GachaSpinSuccessCopyWith(
          _$GachaSpinSuccess value, $Res Function(_$GachaSpinSuccess) then) =
      __$$GachaSpinSuccessCopyWithImpl<$Res>;
  $Res call({GachaSpinResponse gachaSpinResponse});
}

/// @nodoc
class __$$GachaSpinSuccessCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaSpinSuccessCopyWith<$Res> {
  __$$GachaSpinSuccessCopyWithImpl(
      _$GachaSpinSuccess _value, $Res Function(_$GachaSpinSuccess) _then)
      : super(_value, (v) => _then(v as _$GachaSpinSuccess));

  @override
  _$GachaSpinSuccess get _value => super._value as _$GachaSpinSuccess;

  @override
  $Res call({
    Object? gachaSpinResponse = freezed,
  }) {
    return _then(_$GachaSpinSuccess(
      gachaSpinResponse == freezed
          ? _value.gachaSpinResponse
          : gachaSpinResponse // ignore: cast_nullable_to_non_nullable
              as GachaSpinResponse,
    ));
  }
}

/// @nodoc

class _$GachaSpinSuccess implements GachaSpinSuccess {
  const _$GachaSpinSuccess(this.gachaSpinResponse);

  @override
  final GachaSpinResponse gachaSpinResponse;

  @override
  String toString() {
    return 'GachaSpinState.success(gachaSpinResponse: $gachaSpinResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GachaSpinSuccess &&
            const DeepCollectionEquality()
                .equals(other.gachaSpinResponse, gachaSpinResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(gachaSpinResponse));

  @JsonKey(ignore: true)
  @override
  _$$GachaSpinSuccessCopyWith<_$GachaSpinSuccess> get copyWith =>
      __$$GachaSpinSuccessCopyWithImpl<_$GachaSpinSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return success(gachaSpinResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return success?.call(gachaSpinResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(gachaSpinResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GachaSpinSuccess implements GachaSpinState {
  const factory GachaSpinSuccess(final GachaSpinResponse gachaSpinResponse) =
      _$GachaSpinSuccess;

  GachaSpinResponse get gachaSpinResponse;
  @JsonKey(ignore: true)
  _$$GachaSpinSuccessCopyWith<_$GachaSpinSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GachaProbabilityConfigSuccessCopyWith<$Res> {
  factory _$$GachaProbabilityConfigSuccessCopyWith(
          _$GachaProbabilityConfigSuccess value,
          $Res Function(_$GachaProbabilityConfigSuccess) then) =
      __$$GachaProbabilityConfigSuccessCopyWithImpl<$Res>;
  $Res call({GachaProbabilityConfigResponse gachaProbabilityConfigResponse});
}

/// @nodoc
class __$$GachaProbabilityConfigSuccessCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaProbabilityConfigSuccessCopyWith<$Res> {
  __$$GachaProbabilityConfigSuccessCopyWithImpl(
      _$GachaProbabilityConfigSuccess _value,
      $Res Function(_$GachaProbabilityConfigSuccess) _then)
      : super(_value, (v) => _then(v as _$GachaProbabilityConfigSuccess));

  @override
  _$GachaProbabilityConfigSuccess get _value =>
      super._value as _$GachaProbabilityConfigSuccess;

  @override
  $Res call({
    Object? gachaProbabilityConfigResponse = freezed,
  }) {
    return _then(_$GachaProbabilityConfigSuccess(
      gachaProbabilityConfigResponse == freezed
          ? _value.gachaProbabilityConfigResponse
          : gachaProbabilityConfigResponse // ignore: cast_nullable_to_non_nullable
              as GachaProbabilityConfigResponse,
    ));
  }
}

/// @nodoc

class _$GachaProbabilityConfigSuccess implements GachaProbabilityConfigSuccess {
  const _$GachaProbabilityConfigSuccess(this.gachaProbabilityConfigResponse);

  @override
  final GachaProbabilityConfigResponse gachaProbabilityConfigResponse;

  @override
  String toString() {
    return 'GachaSpinState.probabilityConfigSuccess(gachaProbabilityConfigResponse: $gachaProbabilityConfigResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GachaProbabilityConfigSuccess &&
            const DeepCollectionEquality().equals(
                other.gachaProbabilityConfigResponse,
                gachaProbabilityConfigResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(gachaProbabilityConfigResponse));

  @JsonKey(ignore: true)
  @override
  _$$GachaProbabilityConfigSuccessCopyWith<_$GachaProbabilityConfigSuccess>
      get copyWith => __$$GachaProbabilityConfigSuccessCopyWithImpl<
          _$GachaProbabilityConfigSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return probabilityConfigSuccess(gachaProbabilityConfigResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return probabilityConfigSuccess?.call(gachaProbabilityConfigResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (probabilityConfigSuccess != null) {
      return probabilityConfigSuccess(gachaProbabilityConfigResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return probabilityConfigSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return probabilityConfigSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (probabilityConfigSuccess != null) {
      return probabilityConfigSuccess(this);
    }
    return orElse();
  }
}

abstract class GachaProbabilityConfigSuccess implements GachaSpinState {
  const factory GachaProbabilityConfigSuccess(
          final GachaProbabilityConfigResponse gachaProbabilityConfigResponse) =
      _$GachaProbabilityConfigSuccess;

  GachaProbabilityConfigResponse get gachaProbabilityConfigResponse;
  @JsonKey(ignore: true)
  _$$GachaProbabilityConfigSuccessCopyWith<_$GachaProbabilityConfigSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GachaHistorySuccessCopyWith<$Res> {
  factory _$$GachaHistorySuccessCopyWith(_$GachaHistorySuccess value,
          $Res Function(_$GachaHistorySuccess) then) =
      __$$GachaHistorySuccessCopyWithImpl<$Res>;
  $Res call({GachaHistoryResponse response});
}

/// @nodoc
class __$$GachaHistorySuccessCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaHistorySuccessCopyWith<$Res> {
  __$$GachaHistorySuccessCopyWithImpl(
      _$GachaHistorySuccess _value, $Res Function(_$GachaHistorySuccess) _then)
      : super(_value, (v) => _then(v as _$GachaHistorySuccess));

  @override
  _$GachaHistorySuccess get _value => super._value as _$GachaHistorySuccess;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$GachaHistorySuccess(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GachaHistoryResponse,
    ));
  }
}

/// @nodoc

class _$GachaHistorySuccess implements GachaHistorySuccess {
  const _$GachaHistorySuccess(this.response);

  @override
  final GachaHistoryResponse response;

  @override
  String toString() {
    return 'GachaSpinState.gachaHistorySuccess(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GachaHistorySuccess &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$GachaHistorySuccessCopyWith<_$GachaHistorySuccess> get copyWith =>
      __$$GachaHistorySuccessCopyWithImpl<_$GachaHistorySuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return gachaHistorySuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return gachaHistorySuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (gachaHistorySuccess != null) {
      return gachaHistorySuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return gachaHistorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return gachaHistorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (gachaHistorySuccess != null) {
      return gachaHistorySuccess(this);
    }
    return orElse();
  }
}

abstract class GachaHistorySuccess implements GachaSpinState {
  const factory GachaHistorySuccess(final GachaHistoryResponse response) =
      _$GachaHistorySuccess;

  GachaHistoryResponse get response;
  @JsonKey(ignore: true)
  _$$GachaHistorySuccessCopyWith<_$GachaHistorySuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GachaGetSuccessCopyWith<$Res> {
  factory _$$GachaGetSuccessCopyWith(
          _$GachaGetSuccess value, $Res Function(_$GachaGetSuccess) then) =
      __$$GachaGetSuccessCopyWithImpl<$Res>;
  $Res call({dynamic response});
}

/// @nodoc
class __$$GachaGetSuccessCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaGetSuccessCopyWith<$Res> {
  __$$GachaGetSuccessCopyWithImpl(
      _$GachaGetSuccess _value, $Res Function(_$GachaGetSuccess) _then)
      : super(_value, (v) => _then(v as _$GachaGetSuccess));

  @override
  _$GachaGetSuccess get _value => super._value as _$GachaGetSuccess;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$GachaGetSuccess(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$GachaGetSuccess implements GachaGetSuccess {
  const _$GachaGetSuccess(this.response);

  @override
  final dynamic response;

  @override
  String toString() {
    return 'GachaSpinState.gachaGetSuccess(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GachaGetSuccess &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$GachaGetSuccessCopyWith<_$GachaGetSuccess> get copyWith =>
      __$$GachaGetSuccessCopyWithImpl<_$GachaGetSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return gachaGetSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return gachaGetSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (gachaGetSuccess != null) {
      return gachaGetSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return gachaGetSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return gachaGetSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (gachaGetSuccess != null) {
      return gachaGetSuccess(this);
    }
    return orElse();
  }
}

abstract class GachaGetSuccess implements GachaSpinState {
  const factory GachaGetSuccess(final dynamic response) = _$GachaGetSuccess;

  dynamic get response;
  @JsonKey(ignore: true)
  _$$GachaGetSuccessCopyWith<_$GachaGetSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GachaSpinFailedCopyWith<$Res> {
  factory _$$GachaSpinFailedCopyWith(
          _$GachaSpinFailed value, $Res Function(_$GachaSpinFailed) then) =
      __$$GachaSpinFailedCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$GachaSpinFailedCopyWithImpl<$Res>
    extends _$GachaSpinStateCopyWithImpl<$Res>
    implements _$$GachaSpinFailedCopyWith<$Res> {
  __$$GachaSpinFailedCopyWithImpl(
      _$GachaSpinFailed _value, $Res Function(_$GachaSpinFailed) _then)
      : super(_value, (v) => _then(v as _$GachaSpinFailed));

  @override
  _$GachaSpinFailed get _value => super._value as _$GachaSpinFailed;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$GachaSpinFailed(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GachaSpinFailed implements GachaSpinFailed {
  const _$GachaSpinFailed(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'GachaSpinState.fail(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GachaSpinFailed &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$GachaSpinFailedCopyWith<_$GachaSpinFailed> get copyWith =>
      __$$GachaSpinFailedCopyWithImpl<_$GachaSpinFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function() done,
    required TResult Function() loading,
    required TResult Function(GachaSpinResponse gachaSpinResponse) success,
    required TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)
        probabilityConfigSuccess,
    required TResult Function(GachaHistoryResponse response)
        gachaHistorySuccess,
    required TResult Function(dynamic response) gachaGetSuccess,
    required TResult Function(String msg) fail,
  }) {
    return fail(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
  }) {
    return fail?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function()? done,
    TResult Function()? loading,
    TResult Function(GachaSpinResponse gachaSpinResponse)? success,
    TResult Function(
            GachaProbabilityConfigResponse gachaProbabilityConfigResponse)?
        probabilityConfigSuccess,
    TResult Function(GachaHistoryResponse response)? gachaHistorySuccess,
    TResult Function(dynamic response)? gachaGetSuccess,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GachaSpinStateInitial value) initial,
    required TResult Function(gachaSpinDone value) done,
    required TResult Function(GachaSpinLoading value) loading,
    required TResult Function(GachaSpinSuccess value) success,
    required TResult Function(GachaProbabilityConfigSuccess value)
        probabilityConfigSuccess,
    required TResult Function(GachaHistorySuccess value) gachaHistorySuccess,
    required TResult Function(GachaGetSuccess value) gachaGetSuccess,
    required TResult Function(GachaSpinFailed value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GachaSpinStateInitial value)? initial,
    TResult Function(gachaSpinDone value)? done,
    TResult Function(GachaSpinLoading value)? loading,
    TResult Function(GachaSpinSuccess value)? success,
    TResult Function(GachaProbabilityConfigSuccess value)?
        probabilityConfigSuccess,
    TResult Function(GachaHistorySuccess value)? gachaHistorySuccess,
    TResult Function(GachaGetSuccess value)? gachaGetSuccess,
    TResult Function(GachaSpinFailed value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class GachaSpinFailed implements GachaSpinState {
  const factory GachaSpinFailed(final String msg) = _$GachaSpinFailed;

  String get msg;
  @JsonKey(ignore: true)
  _$$GachaSpinFailedCopyWith<_$GachaSpinFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
