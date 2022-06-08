// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletInfoEntity {
  int get id => throw _privateConstructorUsedError;
  NativeCurrencyEntity get nativeCurrency => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Credentials get credentials => throw _privateConstructorUsedError;
  int? get derivedIndex => throw _privateConstructorUsedError;
  bool get isImported =>
      throw _privateConstructorUsedError; // @Default([]) List<TokenEntity> tokens,
  List<String> get nfts => throw _privateConstructorUsedError;
  List<TransactionEntity> get transactions =>
      throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletInfoEntityCopyWith<WalletInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletInfoEntityCopyWith<$Res> {
  factory $WalletInfoEntityCopyWith(
          WalletInfoEntity value, $Res Function(WalletInfoEntity) then) =
      _$WalletInfoEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      NativeCurrencyEntity nativeCurrency,
      String address,
      String name,
      Credentials credentials,
      int? derivedIndex,
      bool isImported,
      List<String> nfts,
      List<TransactionEntity> transactions,
      String image});

  $NativeCurrencyEntityCopyWith<$Res> get nativeCurrency;
}

/// @nodoc
class _$WalletInfoEntityCopyWithImpl<$Res>
    implements $WalletInfoEntityCopyWith<$Res> {
  _$WalletInfoEntityCopyWithImpl(this._value, this._then);

  final WalletInfoEntity _value;
  // ignore: unused_field
  final $Res Function(WalletInfoEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nativeCurrency = freezed,
    Object? address = freezed,
    Object? name = freezed,
    Object? credentials = freezed,
    Object? derivedIndex = freezed,
    Object? isImported = freezed,
    Object? nfts = freezed,
    Object? transactions = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nativeCurrency: nativeCurrency == freezed
          ? _value.nativeCurrency
          : nativeCurrency // ignore: cast_nullable_to_non_nullable
              as NativeCurrencyEntity,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
      derivedIndex: derivedIndex == freezed
          ? _value.derivedIndex
          : derivedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isImported: isImported == freezed
          ? _value.isImported
          : isImported // ignore: cast_nullable_to_non_nullable
              as bool,
      nfts: nfts == freezed
          ? _value.nfts
          : nfts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $NativeCurrencyEntityCopyWith<$Res> get nativeCurrency {
    return $NativeCurrencyEntityCopyWith<$Res>(_value.nativeCurrency, (value) {
      return _then(_value.copyWith(nativeCurrency: value));
    });
  }
}

/// @nodoc
abstract class _$WalletInfoEntityCopyWith<$Res>
    implements $WalletInfoEntityCopyWith<$Res> {
  factory _$WalletInfoEntityCopyWith(
          _WalletInfoEntity value, $Res Function(_WalletInfoEntity) then) =
      __$WalletInfoEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      NativeCurrencyEntity nativeCurrency,
      String address,
      String name,
      Credentials credentials,
      int? derivedIndex,
      bool isImported,
      List<String> nfts,
      List<TransactionEntity> transactions,
      String image});

  @override
  $NativeCurrencyEntityCopyWith<$Res> get nativeCurrency;
}

/// @nodoc
class __$WalletInfoEntityCopyWithImpl<$Res>
    extends _$WalletInfoEntityCopyWithImpl<$Res>
    implements _$WalletInfoEntityCopyWith<$Res> {
  __$WalletInfoEntityCopyWithImpl(
      _WalletInfoEntity _value, $Res Function(_WalletInfoEntity) _then)
      : super(_value, (v) => _then(v as _WalletInfoEntity));

  @override
  _WalletInfoEntity get _value => super._value as _WalletInfoEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? nativeCurrency = freezed,
    Object? address = freezed,
    Object? name = freezed,
    Object? credentials = freezed,
    Object? derivedIndex = freezed,
    Object? isImported = freezed,
    Object? nfts = freezed,
    Object? transactions = freezed,
    Object? image = freezed,
  }) {
    return _then(_WalletInfoEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nativeCurrency: nativeCurrency == freezed
          ? _value.nativeCurrency
          : nativeCurrency // ignore: cast_nullable_to_non_nullable
              as NativeCurrencyEntity,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
      derivedIndex: derivedIndex == freezed
          ? _value.derivedIndex
          : derivedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isImported: isImported == freezed
          ? _value.isImported
          : isImported // ignore: cast_nullable_to_non_nullable
              as bool,
      nfts: nfts == freezed
          ? _value.nfts
          : nfts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WalletInfoEntity
    with DiagnosticableTreeMixin
    implements _WalletInfoEntity {
  const _$_WalletInfoEntity(
      {required this.id,
      required this.nativeCurrency,
      required this.address,
      required this.name,
      required this.credentials,
      this.derivedIndex,
      this.isImported = false,
      final List<String> nfts = const [],
      final List<TransactionEntity> transactions = const [],
      this.image = ''})
      : _nfts = nfts,
        _transactions = transactions;

  @override
  final int id;
  @override
  final NativeCurrencyEntity nativeCurrency;
  @override
  final String address;
  @override
  final String name;
  @override
  final Credentials credentials;
  @override
  final int? derivedIndex;
  @override
  @JsonKey()
  final bool isImported;
// @Default([]) List<TokenEntity> tokens,
  final List<String> _nfts;
// @Default([]) List<TokenEntity> tokens,
  @override
  @JsonKey()
  List<String> get nfts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nfts);
  }

  final List<TransactionEntity> _transactions;
  @override
  @JsonKey()
  List<TransactionEntity> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  @JsonKey()
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletInfoEntity(id: $id, nativeCurrency: $nativeCurrency, address: $address, name: $name, credentials: $credentials, derivedIndex: $derivedIndex, isImported: $isImported, nfts: $nfts, transactions: $transactions, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletInfoEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nativeCurrency', nativeCurrency))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('credentials', credentials))
      ..add(DiagnosticsProperty('derivedIndex', derivedIndex))
      ..add(DiagnosticsProperty('isImported', isImported))
      ..add(DiagnosticsProperty('nfts', nfts))
      ..add(DiagnosticsProperty('transactions', transactions))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletInfoEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.nativeCurrency, nativeCurrency) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.credentials, credentials) &&
            const DeepCollectionEquality()
                .equals(other.derivedIndex, derivedIndex) &&
            const DeepCollectionEquality()
                .equals(other.isImported, isImported) &&
            const DeepCollectionEquality().equals(other.nfts, nfts) &&
            const DeepCollectionEquality()
                .equals(other.transactions, transactions) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nativeCurrency),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(credentials),
      const DeepCollectionEquality().hash(derivedIndex),
      const DeepCollectionEquality().hash(isImported),
      const DeepCollectionEquality().hash(nfts),
      const DeepCollectionEquality().hash(transactions),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$WalletInfoEntityCopyWith<_WalletInfoEntity> get copyWith =>
      __$WalletInfoEntityCopyWithImpl<_WalletInfoEntity>(this, _$identity);
}

abstract class _WalletInfoEntity implements WalletInfoEntity {
  const factory _WalletInfoEntity(
      {required final int id,
      required final NativeCurrencyEntity nativeCurrency,
      required final String address,
      required final String name,
      required final Credentials credentials,
      final int? derivedIndex,
      final bool isImported,
      final List<String> nfts,
      final List<TransactionEntity> transactions,
      final String image}) = _$_WalletInfoEntity;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  NativeCurrencyEntity get nativeCurrency => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Credentials get credentials => throw _privateConstructorUsedError;
  @override
  int? get derivedIndex => throw _privateConstructorUsedError;
  @override
  bool get isImported => throw _privateConstructorUsedError;
  @override // @Default([]) List<TokenEntity> tokens,
  List<String> get nfts => throw _privateConstructorUsedError;
  @override
  List<TransactionEntity> get transactions =>
      throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalletInfoEntityCopyWith<_WalletInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
