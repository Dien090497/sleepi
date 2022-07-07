// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetNetworkIsarModelCollection on Isar {
  IsarCollection<NetworkIsarModel> get networks => getCollection();
}

const NetworkIsarModelSchema = CollectionSchema(
  name: 'NetworkIsarModel',
  schema:
      '{"name":"NetworkIsarModel","idName":"chainId","properties":[{"name":"chain","type":"String"},{"name":"faucets","type":"StringList"},{"name":"icon","type":"String"},{"name":"infoURL","type":"String"},{"name":"name","type":"String"},{"name":"network","type":"String"},{"name":"networkId","type":"Long"},{"name":"rpc","type":"StringList"},{"name":"shortName","type":"String"},{"name":"slip44","type":"Long"},{"name":"title","type":"String"}],"indexes":[],"links":[{"name":"ens","target":"EnsIsarModel"},{"name":"explorers","target":"ExplorersIsarModel"},{"name":"nativeCurrency","target":"NativeCurrencyIsarModel"},{"name":"tokenDefault","target":"TokenDefaultModel"}]}',
  idName: 'chainId',
  propertyIds: {
    'chain': 0,
    'faucets': 1,
    'icon': 2,
    'infoURL': 3,
    'name': 4,
    'network': 5,
    'networkId': 6,
    'rpc': 7,
    'shortName': 8,
    'slip44': 9,
    'title': 10
  },
  listProperties: {'faucets', 'rpc'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'ens': 0, 'explorers': 1, 'nativeCurrency': 2, 'tokenDefault': 3},
  backlinkLinkNames: {},
  getId: _networkIsarModelGetId,
  setId: _networkIsarModelSetId,
  getLinks: _networkIsarModelGetLinks,
  attachLinks: _networkIsarModelAttachLinks,
  serializeNative: _networkIsarModelSerializeNative,
  deserializeNative: _networkIsarModelDeserializeNative,
  deserializePropNative: _networkIsarModelDeserializePropNative,
  serializeWeb: _networkIsarModelSerializeWeb,
  deserializeWeb: _networkIsarModelDeserializeWeb,
  deserializePropWeb: _networkIsarModelDeserializePropWeb,
  version: 3,
);

int? _networkIsarModelGetId(NetworkIsarModel object) {
  if (object.chainId == Isar.autoIncrement) {
    return null;
  } else {
    return object.chainId;
  }
}

void _networkIsarModelSetId(NetworkIsarModel object, int id) {
  object.chainId = id;
}

List<IsarLinkBase> _networkIsarModelGetLinks(NetworkIsarModel object) {
  return [
    object.ens,
    object.explorers,
    object.nativeCurrency,
    object.tokenDefault
  ];
}

void _networkIsarModelSerializeNative(
    IsarCollection<NetworkIsarModel> collection,
    IsarRawObject rawObj,
    NetworkIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.chain;
  final _chain = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_chain.length) as int;
  final value1 = object.faucets;
  dynamicSize += (value1.length) * 8;
  final bytesList1 = <IsarUint8List>[];
  for (var str in value1) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList1.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _faucets = bytesList1;
  final value2 = object.icon;
  IsarUint8List? _icon;
  if (value2 != null) {
    _icon = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_icon?.length ?? 0) as int;
  final value3 = object.infoURL;
  final _infoURL = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_infoURL.length) as int;
  final value4 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_name.length) as int;
  final value5 = object.network;
  IsarUint8List? _network;
  if (value5 != null) {
    _network = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_network?.length ?? 0) as int;
  final value6 = object.networkId;
  final _networkId = value6;
  final value7 = object.rpc;
  dynamicSize += (value7.length) * 8;
  final bytesList7 = <IsarUint8List>[];
  for (var str in value7) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList7.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _rpc = bytesList7;
  final value8 = object.shortName;
  final _shortName = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_shortName.length) as int;
  final value9 = object.slip44;
  final _slip44 = value9;
  final value10 = object.title;
  IsarUint8List? _title;
  if (value10 != null) {
    _title = IsarBinaryWriter.utf8Encoder.convert(value10);
  }
  dynamicSize += (_title?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _chain);
  writer.writeStringList(offsets[1], _faucets);
  writer.writeBytes(offsets[2], _icon);
  writer.writeBytes(offsets[3], _infoURL);
  writer.writeBytes(offsets[4], _name);
  writer.writeBytes(offsets[5], _network);
  writer.writeLong(offsets[6], _networkId);
  writer.writeStringList(offsets[7], _rpc);
  writer.writeBytes(offsets[8], _shortName);
  writer.writeLong(offsets[9], _slip44);
  writer.writeBytes(offsets[10], _title);
}

NetworkIsarModel _networkIsarModelDeserializeNative(
    IsarCollection<NetworkIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = NetworkIsarModel(
    chain: reader.readString(offsets[0]),
    chainId: id,
    faucets: reader.readStringList(offsets[1]) ?? [],
    icon: reader.readStringOrNull(offsets[2]),
    infoURL: reader.readString(offsets[3]),
    name: reader.readString(offsets[4]),
    network: reader.readStringOrNull(offsets[5]),
    networkId: reader.readLong(offsets[6]),
    rpc: reader.readStringList(offsets[7]) ?? [],
    shortName: reader.readString(offsets[8]),
    slip44: reader.readLongOrNull(offsets[9]),
    title: reader.readStringOrNull(offsets[10]),
  );
  _networkIsarModelAttachLinks(collection, id, object);
  return object;
}

P _networkIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _networkIsarModelSerializeWeb(
    IsarCollection<NetworkIsarModel> collection, NetworkIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'chain', object.chain);
  IsarNative.jsObjectSet(jsObj, 'chainId', object.chainId);
  IsarNative.jsObjectSet(jsObj, 'faucets', object.faucets);
  IsarNative.jsObjectSet(jsObj, 'icon', object.icon);
  IsarNative.jsObjectSet(jsObj, 'infoURL', object.infoURL);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'network', object.network);
  IsarNative.jsObjectSet(jsObj, 'networkId', object.networkId);
  IsarNative.jsObjectSet(jsObj, 'rpc', object.rpc);
  IsarNative.jsObjectSet(jsObj, 'shortName', object.shortName);
  IsarNative.jsObjectSet(jsObj, 'slip44', object.slip44);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

NetworkIsarModel _networkIsarModelDeserializeWeb(
    IsarCollection<NetworkIsarModel> collection, dynamic jsObj) {
  final object = NetworkIsarModel(
    chain: IsarNative.jsObjectGet(jsObj, 'chain') ?? '',
    chainId:
        IsarNative.jsObjectGet(jsObj, 'chainId') ?? double.negativeInfinity,
    faucets: (IsarNative.jsObjectGet(jsObj, 'faucets') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    icon: IsarNative.jsObjectGet(jsObj, 'icon'),
    infoURL: IsarNative.jsObjectGet(jsObj, 'infoURL') ?? '',
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    network: IsarNative.jsObjectGet(jsObj, 'network'),
    networkId:
        IsarNative.jsObjectGet(jsObj, 'networkId') ?? double.negativeInfinity,
    rpc: (IsarNative.jsObjectGet(jsObj, 'rpc') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    shortName: IsarNative.jsObjectGet(jsObj, 'shortName') ?? '',
    slip44: IsarNative.jsObjectGet(jsObj, 'slip44'),
    title: IsarNative.jsObjectGet(jsObj, 'title'),
  );
  _networkIsarModelAttachLinks(
      collection,
      IsarNative.jsObjectGet(jsObj, 'chainId') ?? double.negativeInfinity,
      object);
  return object;
}

P _networkIsarModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'chain':
      return (IsarNative.jsObjectGet(jsObj, 'chain') ?? '') as P;
    case 'chainId':
      return (IsarNative.jsObjectGet(jsObj, 'chainId') ??
          double.negativeInfinity) as P;
    case 'faucets':
      return ((IsarNative.jsObjectGet(jsObj, 'faucets') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'icon':
      return (IsarNative.jsObjectGet(jsObj, 'icon')) as P;
    case 'infoURL':
      return (IsarNative.jsObjectGet(jsObj, 'infoURL') ?? '') as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'network':
      return (IsarNative.jsObjectGet(jsObj, 'network')) as P;
    case 'networkId':
      return (IsarNative.jsObjectGet(jsObj, 'networkId') ??
          double.negativeInfinity) as P;
    case 'rpc':
      return ((IsarNative.jsObjectGet(jsObj, 'rpc') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'shortName':
      return (IsarNative.jsObjectGet(jsObj, 'shortName') ?? '') as P;
    case 'slip44':
      return (IsarNative.jsObjectGet(jsObj, 'slip44')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _networkIsarModelAttachLinks(
    IsarCollection col, int id, NetworkIsarModel object) {
  object.ens.attach(col, col.isar.ensIsarModels, 'ens', id);
  object.explorers.attach(col, col.isar.explorers, 'explorers', id);
  object.nativeCurrency
      .attach(col, col.isar.nativeCurrencies, 'nativeCurrency', id);
  object.tokenDefault.attach(col, col.isar.tokenDefault, 'tokenDefault', id);
}

extension NetworkIsarModelQueryWhereSort
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QWhere> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterWhere> anyChainId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension NetworkIsarModelQueryWhere
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QWhereClause> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterWhereClause>
      chainIdEqualTo(int chainId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: chainId,
      includeLower: true,
      upper: chainId,
      includeUpper: true,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterWhereClause>
      chainIdNotEqualTo(int chainId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: chainId, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: chainId, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: chainId, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: chainId, includeUpper: false),
      );
    }
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterWhereClause>
      chainIdGreaterThan(int chainId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: chainId, includeLower: include),
    );
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterWhereClause>
      chainIdLessThan(int chainId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: chainId, includeUpper: include),
    );
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterWhereClause>
      chainIdBetween(
    int lowerChainId,
    int upperChainId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerChainId,
      includeLower: includeLower,
      upper: upperChainId,
      includeUpper: includeUpper,
    ));
  }
}

extension NetworkIsarModelQueryFilter
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QFilterCondition> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chain',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chain',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chain',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chain',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chain',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chain',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chain',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chain',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chainId',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chainId',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chainId',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      chainIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chainId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'faucets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'faucets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'faucets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'faucets',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'faucets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'faucets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'faucets',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      faucetsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'faucets',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'icon',
      value: null,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'icon',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'icon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'infoURL',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'infoURL',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'infoURL',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'infoURL',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'infoURL',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'infoURL',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'infoURL',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      infoURLMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'infoURL',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'network',
      value: null,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'network',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'network',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'network',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'network',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'network',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'network',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'network',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'network',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'networkId',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'networkId',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'networkId',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      networkIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'networkId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'rpc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'rpc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'rpc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'rpc',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'rpc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'rpc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'rpc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      rpcAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'rpc',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'shortName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'shortName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'shortName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'shortName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'shortName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'shortName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'shortName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      shortNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'shortName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      slip44IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'slip44',
      value: null,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      slip44EqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'slip44',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      slip44GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'slip44',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      slip44LessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'slip44',
      value: value,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      slip44Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'slip44',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'title',
      value: null,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension NetworkIsarModelQueryLinks
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QFilterCondition> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition> ens(
      FilterQuery<EnsIsarModel> q) {
    return linkInternal(
      isar.ensIsarModels,
      q,
      'ens',
    );
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      explorers(FilterQuery<ExplorersIsarModel> q) {
    return linkInternal(
      isar.explorers,
      q,
      'explorers',
    );
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      nativeCurrency(FilterQuery<NativeCurrencyIsarModel> q) {
    return linkInternal(
      isar.nativeCurrencies,
      q,
      'nativeCurrency',
    );
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterFilterCondition>
      tokenDefault(FilterQuery<TokenDefaultModel> q) {
    return linkInternal(
      isar.tokenDefault,
      q,
      'tokenDefault',
    );
  }
}

extension NetworkIsarModelQueryWhereSortBy
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QSortBy> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> sortByChain() {
    return addSortByInternal('chain', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByChainDesc() {
    return addSortByInternal('chain', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByChainId() {
    return addSortByInternal('chainId', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByChainIdDesc() {
    return addSortByInternal('chainId', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> sortByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByInfoURL() {
    return addSortByInternal('infoURL', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByInfoURLDesc() {
    return addSortByInternal('infoURL', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByNetwork() {
    return addSortByInternal('network', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByNetworkDesc() {
    return addSortByInternal('network', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByNetworkId() {
    return addSortByInternal('networkId', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByNetworkIdDesc() {
    return addSortByInternal('networkId', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByShortName() {
    return addSortByInternal('shortName', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByShortNameDesc() {
    return addSortByInternal('shortName', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortBySlip44() {
    return addSortByInternal('slip44', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortBySlip44Desc() {
    return addSortByInternal('slip44', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension NetworkIsarModelQueryWhereSortThenBy
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QSortThenBy> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> thenByChain() {
    return addSortByInternal('chain', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByChainDesc() {
    return addSortByInternal('chain', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByChainId() {
    return addSortByInternal('chainId', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByChainIdDesc() {
    return addSortByInternal('chainId', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> thenByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByInfoURL() {
    return addSortByInternal('infoURL', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByInfoURLDesc() {
    return addSortByInternal('infoURL', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByNetwork() {
    return addSortByInternal('network', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByNetworkDesc() {
    return addSortByInternal('network', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByNetworkId() {
    return addSortByInternal('networkId', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByNetworkIdDesc() {
    return addSortByInternal('networkId', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByShortName() {
    return addSortByInternal('shortName', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByShortNameDesc() {
    return addSortByInternal('shortName', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenBySlip44() {
    return addSortByInternal('slip44', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenBySlip44Desc() {
    return addSortByInternal('slip44', Sort.desc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QAfterSortBy>
      thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension NetworkIsarModelQueryWhereDistinct
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> {
  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chain', caseSensitive: caseSensitive);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct>
      distinctByChainId() {
    return addDistinctByInternal('chainId');
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('icon', caseSensitive: caseSensitive);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> distinctByInfoURL(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('infoURL', caseSensitive: caseSensitive);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> distinctByNetwork(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('network', caseSensitive: caseSensitive);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct>
      distinctByNetworkId() {
    return addDistinctByInternal('networkId');
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct>
      distinctByShortName({bool caseSensitive = true}) {
    return addDistinctByInternal('shortName', caseSensitive: caseSensitive);
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct>
      distinctBySlip44() {
    return addDistinctByInternal('slip44');
  }

  QueryBuilder<NetworkIsarModel, NetworkIsarModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension NetworkIsarModelQueryProperty
    on QueryBuilder<NetworkIsarModel, NetworkIsarModel, QQueryProperty> {
  QueryBuilder<NetworkIsarModel, String, QQueryOperations> chainProperty() {
    return addPropertyNameInternal('chain');
  }

  QueryBuilder<NetworkIsarModel, int, QQueryOperations> chainIdProperty() {
    return addPropertyNameInternal('chainId');
  }

  QueryBuilder<NetworkIsarModel, List<String>, QQueryOperations>
      faucetsProperty() {
    return addPropertyNameInternal('faucets');
  }

  QueryBuilder<NetworkIsarModel, String?, QQueryOperations> iconProperty() {
    return addPropertyNameInternal('icon');
  }

  QueryBuilder<NetworkIsarModel, String, QQueryOperations> infoURLProperty() {
    return addPropertyNameInternal('infoURL');
  }

  QueryBuilder<NetworkIsarModel, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<NetworkIsarModel, String?, QQueryOperations> networkProperty() {
    return addPropertyNameInternal('network');
  }

  QueryBuilder<NetworkIsarModel, int, QQueryOperations> networkIdProperty() {
    return addPropertyNameInternal('networkId');
  }

  QueryBuilder<NetworkIsarModel, List<String>, QQueryOperations> rpcProperty() {
    return addPropertyNameInternal('rpc');
  }

  QueryBuilder<NetworkIsarModel, String, QQueryOperations> shortNameProperty() {
    return addPropertyNameInternal('shortName');
  }

  QueryBuilder<NetworkIsarModel, int?, QQueryOperations> slip44Property() {
    return addPropertyNameInternal('slip44');
  }

  QueryBuilder<NetworkIsarModel, String?, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
