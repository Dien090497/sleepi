// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateWalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity entity) done,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(createWalletStateInitial value) initial,
    required TResult Function(createWalletDone value) done,
    required TResult Function(createWalletError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWalletStateCopyWith<$Res> {
  factory $CreateWalletStateCopyWith(
          CreateWalletState value, $Res Function(CreateWalletState) then) =
      _$CreateWalletStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateWalletStateCopyWithImpl<$Res>
    implements $CreateWalletStateCopyWith<$Res> {
  _$CreateWalletStateCopyWithImpl(this._value, this._then);

  final CreateWalletState _value;
  // ignore: unused_field
  final $Res Function(CreateWalletState) _then;
}

/// @nodoc
abstract class _$$createWalletStateInitialCopyWith<$Res> {
  factory _$$createWalletStateInitialCopyWith(_$createWalletStateInitial value,
          $Res Function(_$createWalletStateInitial) then) =
      __$$createWalletStateInitialCopyWithImpl<$Res>;
  $Res call({String passCode, String mnemonic, bool isLoading});
}

/// @nodoc
class __$$createWalletStateInitialCopyWithImpl<$Res>
    extends _$CreateWalletStateCopyWithImpl<$Res>
    implements _$$createWalletStateInitialCopyWith<$Res> {
  __$$createWalletStateInitialCopyWithImpl(_$createWalletStateInitial _value,
      $Res Function(_$createWalletStateInitial) _then)
      : super(_value, (v) => _then(v as _$createWalletStateInitial));

  @override
  _$createWalletStateInitial get _value =>
      super._value as _$createWalletStateInitial;

  @override
  $Res call({
    Object? passCode = freezed,
    Object? mnemonic = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$createWalletStateInitial(
      passCode == freezed
          ? _value.passCode
          : passCode // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonic: mnemonic == freezed
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$createWalletStateInitial
    with DiagnosticableTreeMixin
    implements createWalletStateInitial {
  const _$createWalletStateInitial(this.passCode,
      {required this.mnemonic, this.isLoading = false});

  @override
  final String passCode;
  @override
  final String mnemonic;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateWalletState.initial(passCode: $passCode, mnemonic: $mnemonic, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateWalletState.initial'))
      ..add(DiagnosticsProperty('passCode', passCode))
      ..add(DiagnosticsProperty('mnemonic', mnemonic))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$createWalletStateInitial &&
            const DeepCollectionEquality().equals(other.passCode, passCode) &&
            const DeepCollectionEquality().equals(other.mnemonic, mnemonic) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(passCode),
      const DeepCollectionEquality().hash(mnemonic),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$createWalletStateInitialCopyWith<_$createWalletStateInitial>
      get copyWith =>
          __$$createWalletStateInitialCopyWithImpl<_$createWalletStateInitial>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity entity) done,
    required TResult Function(String msg) error,
  }) {
    return initial(passCode, mnemonic, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
  }) {
    return initial?.call(passCode, mnemonic, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(passCode, mnemonic, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(createWalletStateInitial value) initial,
    required TResult Function(createWalletDone value) done,
    required TResult Function(createWalletError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class createWalletStateInitial implements CreateWalletState {
  const factory createWalletStateInitial(final String passCode,
      {required final String mnemonic,
      final bool isLoading}) = _$createWalletStateInitial;

  String get passCode => throw _privateConstructorUsedError;
  String get mnemonic => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$createWalletStateInitialCopyWith<_$createWalletStateInitial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$createWalletDoneCopyWith<$Res> {
  factory _$$createWalletDoneCopyWith(
          _$createWalletDone value, $Res Function(_$createWalletDone) then) =
      __$$createWalletDoneCopyWithImpl<$Res>;
  $Res call({WalletInfoEntity entity});

  $WalletInfoEntityCopyWith<$Res> get entity;
}

/// @nodoc
class __$$createWalletDoneCopyWithImpl<$Res>
    extends _$CreateWalletStateCopyWithImpl<$Res>
    implements _$$createWalletDoneCopyWith<$Res> {
  __$$createWalletDoneCopyWithImpl(
      _$createWalletDone _value, $Res Function(_$createWalletDone) _then)
      : super(_value, (v) => _then(v as _$createWalletDone));

  @override
  _$createWalletDone get _value => super._value as _$createWalletDone;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_$createWalletDone(
      entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as WalletInfoEntity,
    ));
  }

  @override
  $WalletInfoEntityCopyWith<$Res> get entity {
    return $WalletInfoEntityCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value));
    });
  }
}

/// @nodoc

class _$createWalletDone
    with DiagnosticableTreeMixin
    implements createWalletDone {
  const _$createWalletDone(this.entity);

  @override
  final WalletInfoEntity entity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateWalletState.done(entity: $entity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateWalletState.done'))
      ..add(DiagnosticsProperty('entity', entity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$createWalletDone &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$$createWalletDoneCopyWith<_$createWalletDone> get copyWith =>
      __$$createWalletDoneCopyWithImpl<_$createWalletDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity entity) done,
    required TResult Function(String msg) error,
  }) {
    return done(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
  }) {
    return done?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(createWalletStateInitial value) initial,
    required TResult Function(createWalletDone value) done,
    required TResult Function(createWalletError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class createWalletDone implements CreateWalletState {
  const factory createWalletDone(final WalletInfoEntity entity) =
      _$createWalletDone;

  WalletInfoEntity get entity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$createWalletDoneCopyWith<_$createWalletDone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$createWalletErrorCopyWith<$Res> {
  factory _$$createWalletErrorCopyWith(
          _$createWalletError value, $Res Function(_$createWalletError) then) =
      __$$createWalletErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$$createWalletErrorCopyWithImpl<$Res>
    extends _$CreateWalletStateCopyWithImpl<$Res>
    implements _$$createWalletErrorCopyWith<$Res> {
  __$$createWalletErrorCopyWithImpl(
      _$createWalletError _value, $Res Function(_$createWalletError) _then)
      : super(_value, (v) => _then(v as _$createWalletError));

  @override
  _$createWalletError get _value => super._value as _$createWalletError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$createWalletError(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$createWalletError
    with DiagnosticableTreeMixin
    implements createWalletError {
  const _$createWalletError(this.msg);

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateWalletState.error(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateWalletState.error'))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$createWalletError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$$createWalletErrorCopyWith<_$createWalletError> get copyWith =>
      __$$createWalletErrorCopyWithImpl<_$createWalletError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passCode, String mnemonic, bool isLoading)
        initial,
    required TResult Function(WalletInfoEntity entity) done,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passCode, String mnemonic, bool isLoading)? initial,
    TResult Function(WalletInfoEntity entity)? done,
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
    required TResult Function(createWalletStateInitial value) initial,
    required TResult Function(createWalletDone value) done,
    required TResult Function(createWalletError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(createWalletStateInitial value)? initial,
    TResult Function(createWalletDone value)? done,
    TResult Function(createWalletError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class createWalletError implements CreateWalletState {
  const factory createWalletError(final String msg) = _$createWalletError;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$createWalletErrorCopyWith<_$createWalletError> get copyWith =>
      throw _privateConstructorUsedError;
}
