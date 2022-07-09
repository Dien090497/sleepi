// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_currency_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetNativeCurrencyIsarModelCollection on Isar {
  IsarCollection<NativeCurrencyIsarModel> get nativeCurrencies =>
      getCollection();
}

const NativeCurrencyIsarModelSchema = CollectionSchema(
  name: 'NativeCurrencyIsarModel',
  schema:
      '{"name":"NativeCurrencyIsarModel","idName":"id","properties":[{"name":"balance","type":"Double"},{"name":"decimals","type":"Long"},{"name":"icon","type":"String"},{"name":"name","type":"String"},{"name":"symbol","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'balance': 0, 'decimals': 1, 'icon': 2, 'name': 3, 'symbol': 4},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'network': 0},
  backlinkLinkNames: {'network': 'nativeCurrency'},
  getId: _nativeCurrencyIsarModelGetId,
  setId: _nativeCurrencyIsarModelSetId,
  getLinks: _nativeCurrencyIsarModelGetLinks,
  attachLinks: _nativeCurrencyIsarModelAttachLinks,
  serializeNative: _nativeCurrencyIsarModelSerializeNative,
  deserializeNative: _nativeCurrencyIsarModelDeserializeNative,
  deserializePropNative: _nativeCurrencyIsarModelDeserializePropNative,
  serializeWeb: _nativeCurrencyIsarModelSerializeWeb,
  deserializeWeb: _nativeCurrencyIsarModelDeserializeWeb,
  deserializePropWeb: _nativeCurrencyIsarModelDeserializePropWeb,
  version: 3,
);

int? _nativeCurrencyIsarModelGetId(NativeCurrencyIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _nativeCurrencyIsarModelSetId(NativeCurrencyIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _nativeCurrencyIsarModelGetLinks(
    NativeCurrencyIsarModel object) {
  return [object.network];
}

void _nativeCurrencyIsarModelSerializeNative(
    IsarCollection<NativeCurrencyIsarModel> collection,
    IsarRawObject rawObj,
    NativeCurrencyIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.balance;
  final _balance = value0;
  final value1 = object.decimals;
  final _decimals = value1;
  final value2 = object.icon;
  final _icon = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_icon.length) as int;
  final value3 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_name.length) as int;
  final value4 = object.symbol;
  final _symbol = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_symbol.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDouble(offsets[0], _balance);
  writer.writeLong(offsets[1], _decimals);
  writer.writeBytes(offsets[2], _icon);
  writer.writeBytes(offsets[3], _name);
  writer.writeBytes(offsets[4], _symbol);
}

NativeCurrencyIsarModel _nativeCurrencyIsarModelDeserializeNative(
    IsarCollection<NativeCurrencyIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = NativeCurrencyIsarModel(
    balance: reader.readDouble(offsets[0]),
    decimals: reader.readLong(offsets[1]),
    icon: reader.readString(offsets[2]),
    id: id,
    name: reader.readString(offsets[3]),
    symbol: reader.readString(offsets[4]),
  );
  _nativeCurrencyIsarModelAttachLinks(collection, id, object);
  return object;
}

P _nativeCurrencyIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _nativeCurrencyIsarModelSerializeWeb(
    IsarCollection<NativeCurrencyIsarModel> collection,
    NativeCurrencyIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'balance', object.balance);
  IsarNative.jsObjectSet(jsObj, 'decimals', object.decimals);
  IsarNative.jsObjectSet(jsObj, 'icon', object.icon);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'symbol', object.symbol);
  return jsObj;
}

NativeCurrencyIsarModel _nativeCurrencyIsarModelDeserializeWeb(
    IsarCollection<NativeCurrencyIsarModel> collection, dynamic jsObj) {
  final object = NativeCurrencyIsarModel(
    balance:
        IsarNative.jsObjectGet(jsObj, 'balance') ?? double.negativeInfinity,
    decimals:
        IsarNative.jsObjectGet(jsObj, 'decimals') ?? double.negativeInfinity,
    icon: IsarNative.jsObjectGet(jsObj, 'icon') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id'),
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    symbol: IsarNative.jsObjectGet(jsObj, 'symbol') ?? '',
  );
  _nativeCurrencyIsarModelAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _nativeCurrencyIsarModelDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'balance':
      return (IsarNative.jsObjectGet(jsObj, 'balance') ??
          double.negativeInfinity) as P;
    case 'decimals':
      return (IsarNative.jsObjectGet(jsObj, 'decimals') ??
          double.negativeInfinity) as P;
    case 'icon':
      return (IsarNative.jsObjectGet(jsObj, 'icon') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'symbol':
      return (IsarNative.jsObjectGet(jsObj, 'symbol') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _nativeCurrencyIsarModelAttachLinks(
    IsarCollection col, int id, NativeCurrencyIsarModel object) {
  object.network.attach(col, col.isar.networks, 'network', id);
}

extension NativeCurrencyIsarModelQueryWhereSort
    on QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QWhere> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension NativeCurrencyIsarModelQueryWhere on QueryBuilder<
    NativeCurrencyIsarModel, NativeCurrencyIsarModel, QWhereClause> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterWhereClause> idBetween(
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

extension NativeCurrencyIsarModelQueryFilter on QueryBuilder<
    NativeCurrencyIsarModel, NativeCurrencyIsarModel, QFilterCondition> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> balanceGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> balanceLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> balanceBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'balance',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> decimalsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'decimals',
      value: value,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> decimalsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'decimals',
      value: value,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> decimalsLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'decimals',
      value: value,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> decimalsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'decimals',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> iconEqualTo(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> iconGreaterThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> iconLessThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> iconBetween(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> iconStartsWith(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> iconEndsWith(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
          QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
          QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'icon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> symbolEqualTo(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> symbolGreaterThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> symbolLessThan(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> symbolBetween(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> symbolStartsWith(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> symbolEndsWith(
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

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
          QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
          QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'symbol',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension NativeCurrencyIsarModelQueryLinks on QueryBuilder<
    NativeCurrencyIsarModel, NativeCurrencyIsarModel, QFilterCondition> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel,
      QAfterFilterCondition> network(FilterQuery<NetworkIsarModel> q) {
    return linkInternal(
      isar.networks,
      q,
      'network',
    );
  }
}

extension NativeCurrencyIsarModelQueryWhereSortBy
    on QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QSortBy> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByBalance() {
    return addSortByInternal('balance', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByBalanceDesc() {
    return addSortByInternal('balance', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByDecimals() {
    return addSortByInternal('decimals', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByDecimalsDesc() {
    return addSortByInternal('decimals', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      sortBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }
}

extension NativeCurrencyIsarModelQueryWhereSortThenBy on QueryBuilder<
    NativeCurrencyIsarModel, NativeCurrencyIsarModel, QSortThenBy> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByBalance() {
    return addSortByInternal('balance', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByBalanceDesc() {
    return addSortByInternal('balance', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByDecimals() {
    return addSortByInternal('decimals', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByDecimalsDesc() {
    return addSortByInternal('decimals', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QAfterSortBy>
      thenBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }
}

extension NativeCurrencyIsarModelQueryWhereDistinct on QueryBuilder<
    NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct> {
  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct>
      distinctByBalance() {
    return addDistinctByInternal('balance');
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct>
      distinctByDecimals() {
    return addDistinctByInternal('decimals');
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct>
      distinctByIcon({bool caseSensitive = true}) {
    return addDistinctByInternal('icon', caseSensitive: caseSensitive);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<NativeCurrencyIsarModel, NativeCurrencyIsarModel, QDistinct>
      distinctBySymbol({bool caseSensitive = true}) {
    return addDistinctByInternal('symbol', caseSensitive: caseSensitive);
  }
}

extension NativeCurrencyIsarModelQueryProperty on QueryBuilder<
    NativeCurrencyIsarModel, NativeCurrencyIsarModel, QQueryProperty> {
  QueryBuilder<NativeCurrencyIsarModel, double, QQueryOperations>
      balanceProperty() {
    return addPropertyNameInternal('balance');
  }

  QueryBuilder<NativeCurrencyIsarModel, int, QQueryOperations>
      decimalsProperty() {
    return addPropertyNameInternal('decimals');
  }

  QueryBuilder<NativeCurrencyIsarModel, String, QQueryOperations>
      iconProperty() {
    return addPropertyNameInternal('icon');
  }

  QueryBuilder<NativeCurrencyIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<NativeCurrencyIsarModel, String, QQueryOperations>
      nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<NativeCurrencyIsarModel, String, QQueryOperations>
      symbolProperty() {
    return addPropertyNameInternal('symbol');
  }
}
