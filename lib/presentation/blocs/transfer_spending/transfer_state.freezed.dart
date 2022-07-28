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
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)
        loaded,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)?
        loaded,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)?
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
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
      {TokenEntity currentToken,
      TokenEntity backupToken,
      bool isToSpending,
      bool isLoading,
      double? amount,
      double? fee,
      bool? isAllowance,
      String? errorMsg,
      String? typeError});

  $TokenEntityCopyWith<$Res> get currentToken;
  $TokenEntityCopyWith<$Res> get backupToken;
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
    Object? currentToken = freezed,
    Object? backupToken = freezed,
    Object? isToSpending = freezed,
    Object? isLoading = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? isAllowance = freezed,
    Object? errorMsg = freezed,
    Object? typeError = freezed,
  }) {
    return _then(_$TransferLoaded(
      currentToken: currentToken == freezed
          ? _value.currentToken
          : currentToken // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
      backupToken: backupToken == freezed
          ? _value.backupToken
          : backupToken // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
      isToSpending: isToSpending == freezed
          ? _value.isToSpending
          : isToSpending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      isAllowance: isAllowance == freezed
          ? _value.isAllowance
          : isAllowance // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      typeError: typeError == freezed
          ? _value.typeError
          : typeError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $TokenEntityCopyWith<$Res> get currentToken {
    return $TokenEntityCopyWith<$Res>(_value.currentToken, (value) {
      return _then(_value.copyWith(currentToken: value));
    });
  }

  @override
  $TokenEntityCopyWith<$Res> get backupToken {
    return $TokenEntityCopyWith<$Res>(_value.backupToken, (value) {
      return _then(_value.copyWith(backupToken: value));
    });
  }
}

/// @nodoc

class _$TransferLoaded implements TransferLoaded {
  const _$TransferLoaded(
      {required this.currentToken,
      required this.backupToken,
      required this.isToSpending,
      this.isLoading = false,
      this.amount,
      this.fee,
      this.isAllowance,
      this.errorMsg,
      this.typeError});

  @override
  final TokenEntity currentToken;
  @override
  final TokenEntity backupToken;
  @override
  final bool isToSpending;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final double? amount;
  @override
  final double? fee;
  @override
  final bool? isAllowance;
  @override
  final String? errorMsg;
  @override
  final String? typeError;

  @override
  String toString() {
    return 'TransferState.loaded(currentToken: $currentToken, backupToken: $backupToken, isToSpending: $isToSpending, isLoading: $isLoading, amount: $amount, fee: $fee, isAllowance: $isAllowance, errorMsg: $errorMsg, typeError: $typeError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferLoaded &&
            const DeepCollectionEquality()
                .equals(other.currentToken, currentToken) &&
            const DeepCollectionEquality()
                .equals(other.backupToken, backupToken) &&
            const DeepCollectionEquality()
                .equals(other.isToSpending, isToSpending) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality()
                .equals(other.isAllowance, isAllowance) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality().equals(other.typeError, typeError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentToken),
      const DeepCollectionEquality().hash(backupToken),
      const DeepCollectionEquality().hash(isToSpending),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(isAllowance),
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(typeError));

  @JsonKey(ignore: true)
  @override
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      __$$TransferLoadedCopyWithImpl<_$TransferLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)
        loaded,
  }) {
    return loaded(currentToken, backupToken, isToSpending, isLoading, amount,
        fee, isAllowance, errorMsg, typeError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)?
        loaded,
  }) {
    return loaded?.call(currentToken, backupToken, isToSpending, isLoading,
        amount, fee, isAllowance, errorMsg, typeError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity backupToken,
            bool isToSpending,
            bool isLoading,
            double? amount,
            double? fee,
            bool? isAllowance,
            String? errorMsg,
            String? typeError)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(currentToken, backupToken, isToSpending, isLoading, amount,
          fee, isAllowance, errorMsg, typeError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
      {required final TokenEntity currentToken,
      required final TokenEntity backupToken,
      required final bool isToSpending,
      final bool isLoading,
      final double? amount,
      final double? fee,
      final bool? isAllowance,
      final String? errorMsg,
      final String? typeError}) = _$TransferLoaded;

  TokenEntity get currentToken;
  TokenEntity get backupToken;
  bool get isToSpending;
  bool get isLoading;
  double? get amount;
  double? get fee;
  bool? get isAllowance;
  String? get errorMsg;
  String? get typeError;
  @JsonKey(ignore: true)
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
