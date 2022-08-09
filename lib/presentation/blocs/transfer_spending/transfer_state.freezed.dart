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
    required TResult Function(String address, bool isToSpending) initial,
    required TResult Function(String? txHash) success,
    required TResult Function(String msg) failed,
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
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
abstract class _$$TransferInitialCopyWith<$Res> {
  factory _$$TransferInitialCopyWith(
          _$TransferInitial value, $Res Function(_$TransferInitial) then) =
      __$$TransferInitialCopyWithImpl<$Res>;
  $Res call({String address, bool isToSpending});
}

/// @nodoc
class __$$TransferInitialCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res>
    implements _$$TransferInitialCopyWith<$Res> {
  __$$TransferInitialCopyWithImpl(
      _$TransferInitial _value, $Res Function(_$TransferInitial) _then)
      : super(_value, (v) => _then(v as _$TransferInitial));

  @override
  _$TransferInitial get _value => super._value as _$TransferInitial;

  @override
  $Res call({
    Object? address = freezed,
    Object? isToSpending = freezed,
  }) {
    return _then(_$TransferInitial(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isToSpending: isToSpending == freezed
          ? _value.isToSpending
          : isToSpending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransferInitial implements TransferInitial {
  const _$TransferInitial({required this.address, required this.isToSpending});

  @override
  final String address;
  @override
  final bool isToSpending;

  @override
  String toString() {
    return 'TransferState.initial(address: $address, isToSpending: $isToSpending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferInitial &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.isToSpending, isToSpending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(isToSpending));

  @JsonKey(ignore: true)
  @override
  _$$TransferInitialCopyWith<_$TransferInitial> get copyWith =>
      __$$TransferInitialCopyWithImpl<_$TransferInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address, bool isToSpending) initial,
    required TResult Function(String? txHash) success,
    required TResult Function(String msg) failed,
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)
        loaded,
  }) {
    return initial(address, isToSpending);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
  }) {
    return initial?.call(address, isToSpending);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(address, isToSpending);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransferInitial implements TransferState {
  const factory TransferInitial(
      {required final String address,
      required final bool isToSpending}) = _$TransferInitial;

  String get address;
  bool get isToSpending;
  @JsonKey(ignore: true)
  _$$TransferInitialCopyWith<_$TransferInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferSuccessCopyWith<$Res> {
  factory _$$TransferSuccessCopyWith(
          _$TransferSuccess value, $Res Function(_$TransferSuccess) then) =
      __$$TransferSuccessCopyWithImpl<$Res>;
  $Res call({String? txHash});
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

  @override
  $Res call({
    Object? txHash = freezed,
  }) {
    return _then(_$TransferSuccess(
      txHash == freezed
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransferSuccess implements TransferSuccess {
  const _$TransferSuccess(this.txHash);

  @override
  final String? txHash;

  @override
  String toString() {
    return 'TransferState.success(txHash: $txHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferSuccess &&
            const DeepCollectionEquality().equals(other.txHash, txHash));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(txHash));

  @JsonKey(ignore: true)
  @override
  _$$TransferSuccessCopyWith<_$TransferSuccess> get copyWith =>
      __$$TransferSuccessCopyWithImpl<_$TransferSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address, bool isToSpending) initial,
    required TResult Function(String? txHash) success,
    required TResult Function(String msg) failed,
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)
        loaded,
  }) {
    return success(txHash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
  }) {
    return success?.call(txHash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(txHash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
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
  const factory TransferSuccess(final String? txHash) = _$TransferSuccess;

  String? get txHash;
  @JsonKey(ignore: true)
  _$$TransferSuccessCopyWith<_$TransferSuccess> get copyWith =>
      throw _privateConstructorUsedError;
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

class _$TransferFailed implements TransferFailed {
  const _$TransferFailed(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'TransferState.failed(msg: $msg)';
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
    required TResult Function(String address, bool isToSpending) initial,
    required TResult Function(String? txHash) success,
    required TResult Function(String msg) failed,
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)
        loaded,
  }) {
    return failed(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
  }) {
    return failed?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
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
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
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
abstract class _$$TransferLoadedCopyWith<$Res> {
  factory _$$TransferLoadedCopyWith(
          _$TransferLoaded value, $Res Function(_$TransferLoaded) then) =
      __$$TransferLoadedCopyWithImpl<$Res>;
  $Res call(
      {TokenEntity currentToken,
      TokenEntity nativeCurrency,
      TokenEntity backupToken,
      bool isToSpending,
      List<TokenEntity> spendingTokens,
      List<TokenEntity> walletTokens,
      int userId,
      String ownerAddress,
      bool isLoading,
      double? amount,
      String? fee,
      bool? isAllowance,
      String? errorMsg});

  $TokenEntityCopyWith<$Res> get currentToken;
  $TokenEntityCopyWith<$Res> get nativeCurrency;
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
    Object? nativeCurrency = freezed,
    Object? backupToken = freezed,
    Object? isToSpending = freezed,
    Object? spendingTokens = freezed,
    Object? walletTokens = freezed,
    Object? userId = freezed,
    Object? ownerAddress = freezed,
    Object? isLoading = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? isAllowance = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_$TransferLoaded(
      currentToken: currentToken == freezed
          ? _value.currentToken
          : currentToken // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
      nativeCurrency: nativeCurrency == freezed
          ? _value.nativeCurrency
          : nativeCurrency // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
      backupToken: backupToken == freezed
          ? _value.backupToken
          : backupToken // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
      isToSpending: isToSpending == freezed
          ? _value.isToSpending
          : isToSpending // ignore: cast_nullable_to_non_nullable
              as bool,
      spendingTokens: spendingTokens == freezed
          ? _value._spendingTokens
          : spendingTokens // ignore: cast_nullable_to_non_nullable
              as List<TokenEntity>,
      walletTokens: walletTokens == freezed
          ? _value._walletTokens
          : walletTokens // ignore: cast_nullable_to_non_nullable
              as List<TokenEntity>,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerAddress: ownerAddress == freezed
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
      isAllowance: isAllowance == freezed
          ? _value.isAllowance
          : isAllowance // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
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
  $TokenEntityCopyWith<$Res> get nativeCurrency {
    return $TokenEntityCopyWith<$Res>(_value.nativeCurrency, (value) {
      return _then(_value.copyWith(nativeCurrency: value));
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
      required this.nativeCurrency,
      required this.backupToken,
      required this.isToSpending,
      required final List<TokenEntity> spendingTokens,
      required final List<TokenEntity> walletTokens,
      required this.userId,
      required this.ownerAddress,
      this.isLoading = false,
      this.amount,
      this.fee,
      this.isAllowance,
      this.errorMsg})
      : _spendingTokens = spendingTokens,
        _walletTokens = walletTokens;

  @override
  final TokenEntity currentToken;
  @override
  final TokenEntity nativeCurrency;
  @override
  final TokenEntity backupToken;
  @override
  final bool isToSpending;
  final List<TokenEntity> _spendingTokens;
  @override
  List<TokenEntity> get spendingTokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendingTokens);
  }

  final List<TokenEntity> _walletTokens;
  @override
  List<TokenEntity> get walletTokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletTokens);
  }

  @override
  final int userId;
  @override
  final String ownerAddress;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final double? amount;
  @override
  final String? fee;
  @override
  final bool? isAllowance;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'TransferState.loaded(currentToken: $currentToken, nativeCurrency: $nativeCurrency, backupToken: $backupToken, isToSpending: $isToSpending, spendingTokens: $spendingTokens, walletTokens: $walletTokens, userId: $userId, ownerAddress: $ownerAddress, isLoading: $isLoading, amount: $amount, fee: $fee, isAllowance: $isAllowance, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferLoaded &&
            const DeepCollectionEquality()
                .equals(other.currentToken, currentToken) &&
            const DeepCollectionEquality()
                .equals(other.nativeCurrency, nativeCurrency) &&
            const DeepCollectionEquality()
                .equals(other.backupToken, backupToken) &&
            const DeepCollectionEquality()
                .equals(other.isToSpending, isToSpending) &&
            const DeepCollectionEquality()
                .equals(other._spendingTokens, _spendingTokens) &&
            const DeepCollectionEquality()
                .equals(other._walletTokens, _walletTokens) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.ownerAddress, ownerAddress) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality()
                .equals(other.isAllowance, isAllowance) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentToken),
      const DeepCollectionEquality().hash(nativeCurrency),
      const DeepCollectionEquality().hash(backupToken),
      const DeepCollectionEquality().hash(isToSpending),
      const DeepCollectionEquality().hash(_spendingTokens),
      const DeepCollectionEquality().hash(_walletTokens),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(ownerAddress),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(isAllowance),
      const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      __$$TransferLoadedCopyWithImpl<_$TransferLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address, bool isToSpending) initial,
    required TResult Function(String? txHash) success,
    required TResult Function(String msg) failed,
    required TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)
        loaded,
  }) {
    return loaded(
        currentToken,
        nativeCurrency,
        backupToken,
        isToSpending,
        spendingTokens,
        walletTokens,
        userId,
        ownerAddress,
        isLoading,
        amount,
        fee,
        isAllowance,
        errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
  }) {
    return loaded?.call(
        currentToken,
        nativeCurrency,
        backupToken,
        isToSpending,
        spendingTokens,
        walletTokens,
        userId,
        ownerAddress,
        isLoading,
        amount,
        fee,
        isAllowance,
        errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address, bool isToSpending)? initial,
    TResult Function(String? txHash)? success,
    TResult Function(String msg)? failed,
    TResult Function(
            TokenEntity currentToken,
            TokenEntity nativeCurrency,
            TokenEntity backupToken,
            bool isToSpending,
            List<TokenEntity> spendingTokens,
            List<TokenEntity> walletTokens,
            int userId,
            String ownerAddress,
            bool isLoading,
            double? amount,
            String? fee,
            bool? isAllowance,
            String? errorMsg)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          currentToken,
          nativeCurrency,
          backupToken,
          isToSpending,
          spendingTokens,
          walletTokens,
          userId,
          ownerAddress,
          isLoading,
          amount,
          fee,
          isAllowance,
          errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFailed value) failed,
    required TResult Function(TransferLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
    TResult Function(TransferLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFailed value)? failed,
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
      required final TokenEntity nativeCurrency,
      required final TokenEntity backupToken,
      required final bool isToSpending,
      required final List<TokenEntity> spendingTokens,
      required final List<TokenEntity> walletTokens,
      required final int userId,
      required final String ownerAddress,
      final bool isLoading,
      final double? amount,
      final String? fee,
      final bool? isAllowance,
      final String? errorMsg}) = _$TransferLoaded;

  TokenEntity get currentToken;
  TokenEntity get nativeCurrency;
  TokenEntity get backupToken;
  bool get isToSpending;
  List<TokenEntity> get spendingTokens;
  List<TokenEntity> get walletTokens;
  int get userId;
  String get ownerAddress;
  bool get isLoading;
  double? get amount;
  String? get fee;
  bool? get isAllowance;
  String? get errorMsg;
  @JsonKey(ignore: true)
  _$$TransferLoadedCopyWith<_$TransferLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
