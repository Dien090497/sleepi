// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkEntity {
  int get chainId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get chain => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;
  List<String> get rpc => throw _privateConstructorUsedError;
  List<String> get faucets => throw _privateConstructorUsedError;
  NativeCurrencyEntity get nativeCurrency => throw _privateConstructorUsedError;
  String get infoURL => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  int get networkId => throw _privateConstructorUsedError;
  int? get slip44 => throw _privateConstructorUsedError;
  EnsEntity? get ens => throw _privateConstructorUsedError;
  List<ExplorersEntity>? get explorers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkEntityCopyWith<NetworkEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkEntityCopyWith<$Res> {
  factory $NetworkEntityCopyWith(
          NetworkEntity value, $Res Function(NetworkEntity) then) =
      _$NetworkEntityCopyWithImpl<$Res>;
  $Res call(
      {int chainId,
      String name,
      String? title,
      String chain,
      String? icon,
      String? network,
      List<String> rpc,
      List<String> faucets,
      NativeCurrencyEntity nativeCurrency,
      String infoURL,
      String shortName,
      int networkId,
      int? slip44,
      EnsEntity? ens,
      List<ExplorersEntity>? explorers});

  $NativeCurrencyEntityCopyWith<$Res> get nativeCurrency;
  $EnsEntityCopyWith<$Res>? get ens;
}

/// @nodoc
class _$NetworkEntityCopyWithImpl<$Res>
    implements $NetworkEntityCopyWith<$Res> {
  _$NetworkEntityCopyWithImpl(this._value, this._then);

  final NetworkEntity _value;
  // ignore: unused_field
  final $Res Function(NetworkEntity) _then;

  @override
  $Res call({
    Object? chainId = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? chain = freezed,
    Object? icon = freezed,
    Object? network = freezed,
    Object? rpc = freezed,
    Object? faucets = freezed,
    Object? nativeCurrency = freezed,
    Object? infoURL = freezed,
    Object? shortName = freezed,
    Object? networkId = freezed,
    Object? slip44 = freezed,
    Object? ens = freezed,
    Object? explorers = freezed,
  }) {
    return _then(_value.copyWith(
      chainId: chainId == freezed
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      chain: chain == freezed
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      rpc: rpc == freezed
          ? _value.rpc
          : rpc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      faucets: faucets == freezed
          ? _value.faucets
          : faucets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nativeCurrency: nativeCurrency == freezed
          ? _value.nativeCurrency
          : nativeCurrency // ignore: cast_nullable_to_non_nullable
              as NativeCurrencyEntity,
      infoURL: infoURL == freezed
          ? _value.infoURL
          : infoURL // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      networkId: networkId == freezed
          ? _value.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as int,
      slip44: slip44 == freezed
          ? _value.slip44
          : slip44 // ignore: cast_nullable_to_non_nullable
              as int?,
      ens: ens == freezed
          ? _value.ens
          : ens // ignore: cast_nullable_to_non_nullable
              as EnsEntity?,
      explorers: explorers == freezed
          ? _value.explorers
          : explorers // ignore: cast_nullable_to_non_nullable
              as List<ExplorersEntity>?,
    ));
  }

  @override
  $NativeCurrencyEntityCopyWith<$Res> get nativeCurrency {
    return $NativeCurrencyEntityCopyWith<$Res>(_value.nativeCurrency, (value) {
      return _then(_value.copyWith(nativeCurrency: value));
    });
  }

  @override
  $EnsEntityCopyWith<$Res>? get ens {
    if (_value.ens == null) {
      return null;
    }

    return $EnsEntityCopyWith<$Res>(_value.ens!, (value) {
      return _then(_value.copyWith(ens: value));
    });
  }
}

/// @nodoc
abstract class _$NetworkEntityCopyWith<$Res>
    implements $NetworkEntityCopyWith<$Res> {
  factory _$NetworkEntityCopyWith(
          _NetworkEntity value, $Res Function(_NetworkEntity) then) =
      __$NetworkEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int chainId,
      String name,
      String? title,
      String chain,
      String? icon,
      String? network,
      List<String> rpc,
      List<String> faucets,
      NativeCurrencyEntity nativeCurrency,
      String infoURL,
      String shortName,
      int networkId,
      int? slip44,
      EnsEntity? ens,
      List<ExplorersEntity>? explorers});

  @override
  $NativeCurrencyEntityCopyWith<$Res> get nativeCurrency;
  @override
  $EnsEntityCopyWith<$Res>? get ens;
}

/// @nodoc
class __$NetworkEntityCopyWithImpl<$Res>
    extends _$NetworkEntityCopyWithImpl<$Res>
    implements _$NetworkEntityCopyWith<$Res> {
  __$NetworkEntityCopyWithImpl(
      _NetworkEntity _value, $Res Function(_NetworkEntity) _then)
      : super(_value, (v) => _then(v as _NetworkEntity));

  @override
  _NetworkEntity get _value => super._value as _NetworkEntity;

  @override
  $Res call({
    Object? chainId = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? chain = freezed,
    Object? icon = freezed,
    Object? network = freezed,
    Object? rpc = freezed,
    Object? faucets = freezed,
    Object? nativeCurrency = freezed,
    Object? infoURL = freezed,
    Object? shortName = freezed,
    Object? networkId = freezed,
    Object? slip44 = freezed,
    Object? ens = freezed,
    Object? explorers = freezed,
  }) {
    return _then(_NetworkEntity(
      chainId: chainId == freezed
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      chain: chain == freezed
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      rpc: rpc == freezed
          ? _value.rpc
          : rpc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      faucets: faucets == freezed
          ? _value.faucets
          : faucets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nativeCurrency: nativeCurrency == freezed
          ? _value.nativeCurrency
          : nativeCurrency // ignore: cast_nullable_to_non_nullable
              as NativeCurrencyEntity,
      infoURL: infoURL == freezed
          ? _value.infoURL
          : infoURL // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      networkId: networkId == freezed
          ? _value.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as int,
      slip44: slip44 == freezed
          ? _value.slip44
          : slip44 // ignore: cast_nullable_to_non_nullable
              as int?,
      ens: ens == freezed
          ? _value.ens
          : ens // ignore: cast_nullable_to_non_nullable
              as EnsEntity?,
      explorers: explorers == freezed
          ? _value.explorers
          : explorers // ignore: cast_nullable_to_non_nullable
              as List<ExplorersEntity>?,
    ));
  }
}

/// @nodoc

class _$_NetworkEntity with DiagnosticableTreeMixin implements _NetworkEntity {
  const _$_NetworkEntity(
      {required this.chainId,
      required this.name,
      required this.title,
      required this.chain,
      required this.icon,
      required this.network,
      required final List<String> rpc,
      required final List<String> faucets,
      required this.nativeCurrency,
      required this.infoURL,
      required this.shortName,
      required this.networkId,
      required this.slip44,
      required this.ens,
      required final List<ExplorersEntity>? explorers})
      : _rpc = rpc,
        _faucets = faucets,
        _explorers = explorers;

  @override
  final int chainId;
  @override
  final String name;
  @override
  final String? title;
  @override
  final String chain;
  @override
  final String? icon;
  @override
  final String? network;
  final List<String> _rpc;
  @override
  List<String> get rpc {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rpc);
  }

  final List<String> _faucets;
  @override
  List<String> get faucets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faucets);
  }

  @override
  final NativeCurrencyEntity nativeCurrency;
  @override
  final String infoURL;
  @override
  final String shortName;
  @override
  final int networkId;
  @override
  final int? slip44;
  @override
  final EnsEntity? ens;
  final List<ExplorersEntity>? _explorers;
  @override
  List<ExplorersEntity>? get explorers {
    final value = _explorers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkEntity(chainId: $chainId, name: $name, title: $title, chain: $chain, icon: $icon, network: $network, rpc: $rpc, faucets: $faucets, nativeCurrency: $nativeCurrency, infoURL: $infoURL, shortName: $shortName, networkId: $networkId, slip44: $slip44, ens: $ens, explorers: $explorers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NetworkEntity'))
      ..add(DiagnosticsProperty('chainId', chainId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('chain', chain))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('rpc', rpc))
      ..add(DiagnosticsProperty('faucets', faucets))
      ..add(DiagnosticsProperty('nativeCurrency', nativeCurrency))
      ..add(DiagnosticsProperty('infoURL', infoURL))
      ..add(DiagnosticsProperty('shortName', shortName))
      ..add(DiagnosticsProperty('networkId', networkId))
      ..add(DiagnosticsProperty('slip44', slip44))
      ..add(DiagnosticsProperty('ens', ens))
      ..add(DiagnosticsProperty('explorers', explorers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkEntity &&
            const DeepCollectionEquality().equals(other.chainId, chainId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.chain, chain) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality().equals(other.rpc, rpc) &&
            const DeepCollectionEquality().equals(other.faucets, faucets) &&
            const DeepCollectionEquality()
                .equals(other.nativeCurrency, nativeCurrency) &&
            const DeepCollectionEquality().equals(other.infoURL, infoURL) &&
            const DeepCollectionEquality().equals(other.shortName, shortName) &&
            const DeepCollectionEquality().equals(other.networkId, networkId) &&
            const DeepCollectionEquality().equals(other.slip44, slip44) &&
            const DeepCollectionEquality().equals(other.ens, ens) &&
            const DeepCollectionEquality().equals(other.explorers, explorers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chainId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(chain),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(rpc),
      const DeepCollectionEquality().hash(faucets),
      const DeepCollectionEquality().hash(nativeCurrency),
      const DeepCollectionEquality().hash(infoURL),
      const DeepCollectionEquality().hash(shortName),
      const DeepCollectionEquality().hash(networkId),
      const DeepCollectionEquality().hash(slip44),
      const DeepCollectionEquality().hash(ens),
      const DeepCollectionEquality().hash(explorers));

  @JsonKey(ignore: true)
  @override
  _$NetworkEntityCopyWith<_NetworkEntity> get copyWith =>
      __$NetworkEntityCopyWithImpl<_NetworkEntity>(this, _$identity);
}

abstract class _NetworkEntity implements NetworkEntity {
  const factory _NetworkEntity(
      {required final int chainId,
      required final String name,
      required final String? title,
      required final String chain,
      required final String? icon,
      required final String? network,
      required final List<String> rpc,
      required final List<String> faucets,
      required final NativeCurrencyEntity nativeCurrency,
      required final String infoURL,
      required final String shortName,
      required final int networkId,
      required final int? slip44,
      required final EnsEntity? ens,
      required final List<ExplorersEntity>? explorers}) = _$_NetworkEntity;

  @override
  int get chainId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String get chain => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  String? get network => throw _privateConstructorUsedError;
  @override
  List<String> get rpc => throw _privateConstructorUsedError;
  @override
  List<String> get faucets => throw _privateConstructorUsedError;
  @override
  NativeCurrencyEntity get nativeCurrency => throw _privateConstructorUsedError;
  @override
  String get infoURL => throw _privateConstructorUsedError;
  @override
  String get shortName => throw _privateConstructorUsedError;
  @override
  int get networkId => throw _privateConstructorUsedError;
  @override
  int? get slip44 => throw _privateConstructorUsedError;
  @override
  EnsEntity? get ens => throw _privateConstructorUsedError;
  @override
  List<ExplorersEntity>? get explorers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NetworkEntityCopyWith<_NetworkEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
