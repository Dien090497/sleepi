// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTokenIsarModelCollection on Isar {
  IsarCollection<TokenIsarModel> get tokens => getCollection();
}

const TokenIsarModelSchema = CollectionSchema(
  name: 'TokenIsarModel',
  schema:
      '{"name":"TokenIsarModel","idName":"id","properties":[{"name":"address","type":"String"},{"name":"balance","type":"Double"},{"name":"displayName","type":"String"},{"name":"icon","type":"String"},{"name":"name","type":"String"},{"name":"networkChainId","type":"Long"},{"name":"symbol","type":"String"},{"name":"txns","type":"StringList"},{"name":"walletId","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'address': 0,
    'balance': 1,
    'displayName': 2,
    'icon': 3,
    'name': 4,
    'networkChainId': 5,
    'symbol': 6,
    'txns': 7,
    'walletId': 8
  },
  listProperties: {'txns'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _tokenIsarModelGetId,
  setId: _tokenIsarModelSetId,
  getLinks: _tokenIsarModelGetLinks,
  attachLinks: _tokenIsarModelAttachLinks,
  serializeNative: _tokenIsarModelSerializeNative,
  deserializeNative: _tokenIsarModelDeserializeNative,
  deserializePropNative: _tokenIsarModelDeserializePropNative,
  serializeWeb: _tokenIsarModelSerializeWeb,
  deserializeWeb: _tokenIsarModelDeserializeWeb,
  deserializePropWeb: _tokenIsarModelDeserializePropWeb,
  version: 3,
);

int? _tokenIsarModelGetId(TokenIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tokenIsarModelSetId(TokenIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _tokenIsarModelGetLinks(TokenIsarModel object) {
  return [];
}

void _tokenIsarModelSerializeNative(
    IsarCollection<TokenIsarModel> collection,
    IsarRawObject rawObj,
    TokenIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.address;
  final _address = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_address.length) as int;
  final value1 = object.balance;
  final _balance = value1;
  final value2 = object.displayName;
  final _displayName = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_displayName.length) as int;
  final value3 = object.icon;
  final _icon = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_icon.length) as int;
  final value4 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_name.length) as int;
  final value5 = object.networkChainId;
  final _networkChainId = value5;
  final value6 = object.symbol;
  final _symbol = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_symbol.length) as int;
  final value7 = object.txns;
  dynamicSize += (value7.length) * 8;
  final bytesList7 = <IsarUint8List>[];
  for (var str in value7) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList7.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _txns = bytesList7;
  final value8 = object.walletId;
  final _walletId = value8;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _address);
  writer.writeDouble(offsets[1], _balance);
  writer.writeBytes(offsets[2], _displayName);
  writer.writeBytes(offsets[3], _icon);
  writer.writeBytes(offsets[4], _name);
  writer.writeLong(offsets[5], _networkChainId);
  writer.writeBytes(offsets[6], _symbol);
  writer.writeStringList(offsets[7], _txns);
  writer.writeLong(offsets[8], _walletId);
}

TokenIsarModel _tokenIsarModelDeserializeNative(
    IsarCollection<TokenIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TokenIsarModel(
    address: reader.readString(offsets[0]),
    balance: reader.readDouble(offsets[1]),
    displayName: reader.readString(offsets[2]),
    icon: reader.readString(offsets[3]),
    id: id,
    name: reader.readString(offsets[4]),
    networkChainId: reader.readLong(offsets[5]),
    symbol: reader.readString(offsets[6]),
    txns: reader.readStringList(offsets[7]) ?? [],
    walletId: reader.readLong(offsets[8]),
  );
  return object;
}

P _tokenIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _tokenIsarModelSerializeWeb(
    IsarCollection<TokenIsarModel> collection, TokenIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'address', object.address);
  IsarNative.jsObjectSet(jsObj, 'balance', object.balance);
  IsarNative.jsObjectSet(jsObj, 'displayName', object.displayName);
  IsarNative.jsObjectSet(jsObj, 'icon', object.icon);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'networkChainId', object.networkChainId);
  IsarNative.jsObjectSet(jsObj, 'symbol', object.symbol);
  IsarNative.jsObjectSet(jsObj, 'txns', object.txns);
  IsarNative.jsObjectSet(jsObj, 'walletId', object.walletId);
  return jsObj;
}

TokenIsarModel _tokenIsarModelDeserializeWeb(
    IsarCollection<TokenIsarModel> collection, dynamic jsObj) {
  final object = TokenIsarModel(
    address: IsarNative.jsObjectGet(jsObj, 'address') ?? '',
    balance:
        IsarNative.jsObjectGet(jsObj, 'balance') ?? double.negativeInfinity,
    displayName: IsarNative.jsObjectGet(jsObj, 'displayName') ?? '',
    icon: IsarNative.jsObjectGet(jsObj, 'icon') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id'),
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    networkChainId: IsarNative.jsObjectGet(jsObj, 'networkChainId') ??
        double.negativeInfinity,
    symbol: IsarNative.jsObjectGet(jsObj, 'symbol') ?? '',
    txns: (IsarNative.jsObjectGet(jsObj, 'txns') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    walletId:
        IsarNative.jsObjectGet(jsObj, 'walletId') ?? double.negativeInfinity,
  );
  return object;
}

P _tokenIsarModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'address':
      return (IsarNative.jsObjectGet(jsObj, 'address') ?? '') as P;
    case 'balance':
      return (IsarNative.jsObjectGet(jsObj, 'balance') ??
          double.negativeInfinity) as P;
    case 'displayName':
      return (IsarNative.jsObjectGet(jsObj, 'displayName') ?? '') as P;
    case 'icon':
      return (IsarNative.jsObjectGet(jsObj, 'icon') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'networkChainId':
      return (IsarNative.jsObjectGet(jsObj, 'networkChainId') ??
          double.negativeInfinity) as P;
    case 'symbol':
      return (IsarNative.jsObjectGet(jsObj, 'symbol') ?? '') as P;
    case 'txns':
      return ((IsarNative.jsObjectGet(jsObj, 'txns') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'walletId':
      return (IsarNative.jsObjectGet(jsObj, 'walletId') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tokenIsarModelAttachLinks(
    IsarCollection col, int id, TokenIsarModel object) {}

extension TokenIsarModelQueryWhereSort
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QWhere> {
  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TokenIsarModelQueryWhere
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QWhereClause> {
  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TokenIsarModelQueryFilter
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QFilterCondition> {
  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'address',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'address',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      balanceGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      balanceLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      balanceBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'balance',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'displayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'displayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'displayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'displayName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'displayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'displayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'displayName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'displayName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      iconEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      iconGreaterThan(
    String value, {
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      iconLessThan(
    String value, {
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      iconBetween(
    String lower,
    String upper, {
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'icon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
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

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      networkChainIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'networkChainId',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      networkChainIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'networkChainId',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      networkChainIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'networkChainId',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      networkChainIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'networkChainId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'symbol',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'symbol',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'txns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'txns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'txns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'txns',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'txns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'txns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'txns',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      txnsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'txns',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      walletIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'walletId',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      walletIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'walletId',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      walletIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'walletId',
      value: value,
    ));
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterFilterCondition>
      walletIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'walletId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension TokenIsarModelQueryLinks
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QFilterCondition> {}

extension TokenIsarModelQueryWhereSortBy
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QSortBy> {
  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByAddress() {
    return addSortByInternal('address', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByAddressDesc() {
    return addSortByInternal('address', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByBalance() {
    return addSortByInternal('balance', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByBalanceDesc() {
    return addSortByInternal('balance', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByDisplayName() {
    return addSortByInternal('displayName', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByDisplayNameDesc() {
    return addSortByInternal('displayName', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByNetworkChainId() {
    return addSortByInternal('networkChainId', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByNetworkChainIdDesc() {
    return addSortByInternal('networkChainId', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> sortByWalletId() {
    return addSortByInternal('walletId', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      sortByWalletIdDesc() {
    return addSortByInternal('walletId', Sort.desc);
  }
}

extension TokenIsarModelQueryWhereSortThenBy
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QSortThenBy> {
  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByAddress() {
    return addSortByInternal('address', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByAddressDesc() {
    return addSortByInternal('address', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByBalance() {
    return addSortByInternal('balance', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByBalanceDesc() {
    return addSortByInternal('balance', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByDisplayName() {
    return addSortByInternal('displayName', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByDisplayNameDesc() {
    return addSortByInternal('displayName', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByNetworkChainId() {
    return addSortByInternal('networkChainId', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByNetworkChainIdDesc() {
    return addSortByInternal('networkChainId', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy> thenByWalletId() {
    return addSortByInternal('walletId', Sort.asc);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QAfterSortBy>
      thenByWalletIdDesc() {
    return addSortByInternal('walletId', Sort.desc);
  }
}

extension TokenIsarModelQueryWhereDistinct
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> {
  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('address', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctByBalance() {
    return addDistinctByInternal('balance');
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('displayName', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('icon', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct>
      distinctByNetworkChainId() {
    return addDistinctByInternal('networkChainId');
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('symbol', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenIsarModel, TokenIsarModel, QDistinct> distinctByWalletId() {
    return addDistinctByInternal('walletId');
  }
}

extension TokenIsarModelQueryProperty
    on QueryBuilder<TokenIsarModel, TokenIsarModel, QQueryProperty> {
  QueryBuilder<TokenIsarModel, String, QQueryOperations> addressProperty() {
    return addPropertyNameInternal('address');
  }

  QueryBuilder<TokenIsarModel, double, QQueryOperations> balanceProperty() {
    return addPropertyNameInternal('balance');
  }

  QueryBuilder<TokenIsarModel, String, QQueryOperations> displayNameProperty() {
    return addPropertyNameInternal('displayName');
  }

  QueryBuilder<TokenIsarModel, String, QQueryOperations> iconProperty() {
    return addPropertyNameInternal('icon');
  }

  QueryBuilder<TokenIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TokenIsarModel, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<TokenIsarModel, int, QQueryOperations> networkChainIdProperty() {
    return addPropertyNameInternal('networkChainId');
  }

  QueryBuilder<TokenIsarModel, String, QQueryOperations> symbolProperty() {
    return addPropertyNameInternal('symbol');
  }

  QueryBuilder<TokenIsarModel, List<String>, QQueryOperations> txnsProperty() {
    return addPropertyNameInternal('txns');
  }

  QueryBuilder<TokenIsarModel, int, QQueryOperations> walletIdProperty() {
    return addPropertyNameInternal('walletId');
  }
}
