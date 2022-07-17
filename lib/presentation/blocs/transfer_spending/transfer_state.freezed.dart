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
    required TResult Function() success,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(bool isToSpending, bool? needApprove,
            bool isLoading, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferError value) error,
    required TResult Function(TransferLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
    TResult Function(TransferLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
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

class _$TransferSuccess implements TransferSuccess {
  const _$TransferSuccess();

  @override
  String toString() {
    return 'TransferState.success()';
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
    required TResult Function() success,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(bool isToSpending, bool? needApprove,
            bool isLoading, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
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
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferError value) error,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
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
abstract class _$$TransferErrorCopyWith<$Res> {
  factory _$$TransferErrorCopyWith(
          _$TransferError value, $Res Function(_$TransferError) then) =
      __$$TransferErrorCopyWithImpl<$Res>;
  $Res call({String message, String? typeError});
}

/// @nodoc
class __$$TransferErrorCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$$TransferErrorCopyWith<$Res> {
  __$$TransferErrorCopyWithImpl(
      _$TransferError _value, $Res Function(_$TransferError) _then)
      : super(_value, (v) => _then(v as _$TransferError));

  @override
  _$TransferError get _value => super._value as _$TransferError;

  @override
  $Res call({
    Object? message = freezed,
    Object? typeError = freezed,
  }) {
    return _then(_$TransferError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      typeError: typeError == freezed
          ? _value.typeError
          : typeError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransferError implements TransferError {
  const _$TransferError(this.message, {this.typeError});

  @override
  final String message;
  @override
  final String? typeError;

  @override
  String toString() {
    return 'TransferState.error(message: $message, typeError: $typeError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferError &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.typeError, typeError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(typeError));

  @JsonKey(ignore: true)
  @override
  _$$TransferErrorCopyWith<_$TransferError> get copyWith =>
      __$$TransferErrorCopyWithImpl<_$TransferError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(bool isToSpending, bool? needApprove,
            bool isLoading, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return error(message, typeError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return error?.call(message, typeError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, typeError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferError value) error,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TransferError implements TransferState {
  const factory TransferError(final String message, {final String? typeError}) =
      _$TransferError;

  String get message;
  String? get typeError;
  @JsonKey(ignore: true)
  _$$TransferErrorCopyWith<_$TransferError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferLoadedCopyWith<$Res> {
  factory _$$TransferLoadedCopyWith(
          _$TransferLoaded value, $Res Function(_$TransferLoaded) then) =
      __$$TransferLoadedCopyWithImpl<$Res>;
  $Res call(
      {bool isToSpending,
      bool? needApprove,
      bool isLoading,
      TransferSpendingEntity? transferSpendingEntity});
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
    Object? needApprove = freezed,
    Object? isLoading = freezed,
    Object? transferSpendingEntity = freezed,
  }) {
    return _then(_$TransferLoaded(
      isToSpending: isToSpending == freezed
          ? _value.isToSpending
          : isToSpending // ignore: cast_nullable_to_non_nullable
              as bool,
      needApprove: needApprove == freezed
          ? _value.needApprove
          : needApprove // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transferSpendingEntity: transferSpendingEntity == freezed
          ? _value.transferSpendingEntity
          : transferSpendingEntity // ignore: cast_nullable_to_non_nullable
              as TransferSpendingEntity?,
    ));
  }
}

/// @nodoc

class _$TransferLoaded implements TransferLoaded {
  const _$TransferLoaded(
      {required this.isToSpending,
      this.needApprove,
      this.isLoading = false,
      this.transferSpendingEntity});

  @override
  final bool isToSpending;
  @override
  final bool? needApprove;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TransferSpendingEntity? transferSpendingEntity;

  @override
  String toString() {
    return 'TransferState.loaded(isToSpending: $isToSpending, needApprove: $needApprove, isLoading: $isLoading, transferSpendingEntity: $transferSpendingEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferLoaded &&
            const DeepCollectionEquality()
                .equals(other.isToSpending, isToSpending) &&
            const DeepCollectionEquality()
                .equals(other.needApprove, needApprove) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.transferSpendingEntity, transferSpendingEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isToSpending),
      const DeepCollectionEquality().hash(needApprove),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(transferSpendingEntity));

  @JsonKey(ignore: true)
  @override
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      __$$TransferLoadedCopyWithImpl<_$TransferLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String message, String? typeError) error,
    required TResult Function(bool isToSpending, bool? needApprove,
            bool isLoading, TransferSpendingEntity? transferSpendingEntity)
        loaded,
  }) {
    return loaded(isToSpending, needApprove, isLoading, transferSpendingEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
  }) {
    return loaded?.call(
        isToSpending, needApprove, isLoading, transferSpendingEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String message, String? typeError)? error,
    TResult Function(bool isToSpending, bool? needApprove, bool isLoading,
            TransferSpendingEntity? transferSpendingEntity)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          isToSpending, needApprove, isLoading, transferSpendingEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferError value) error,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferError value)? error,
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
      final bool? needApprove,
      final bool isLoading,
      final TransferSpendingEntity? transferSpendingEntity}) = _$TransferLoaded;

  bool get isToSpending;
  bool? get needApprove;
  bool get isLoading;
  TransferSpendingEntity? get transferSpendingEntity;
  @JsonKey(ignore: true)
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
