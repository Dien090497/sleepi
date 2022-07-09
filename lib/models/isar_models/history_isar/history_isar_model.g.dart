// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_finaliable

extension GetHistoryIsarModelCollection on Isar {
  IsarCollection<HistoryIsarModel> get history => getCollection();
}

const HistoryIsarModelSchema = CollectionSchema(
  name: 'HistoryIsarModel',
  schema:
      '{"name":"HistoryIsarModel","idName":"id","properties":[{"name":"addressTo","type":"String"},{"name":"chainId","type":"Long"},{"name":"transactionHash","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'addressTo': 0, 'chainId': 1, 'transactionHash': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _historyIsarModelGetId,
  setId: _historyIsarModelSetId,
  getLinks: _historyIsarModelGetLinks,
  attachLinks: _historyIsarModelAttachLinks,
  serializeNative: _historyIsarModelSerializeNative,
  deserializeNative: _historyIsarModelDeserializeNative,
  deserializePropNative: _historyIsarModelDeserializePropNative,
  serializeWeb: _historyIsarModelSerializeWeb,
  deserializeWeb: _historyIsarModelDeserializeWeb,
  deserializePropWeb: _historyIsarModelDeserializePropWeb,
  version: 3,
);

int? _historyIsarModelGetId(HistoryIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _historyIsarModelSetId(HistoryIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _historyIsarModelGetLinks(HistoryIsarModel object) {
  return [];
}

void _historyIsarModelSerializeNative(
    IsarCollection<HistoryIsarModel> collection,
    IsarRawObject rawObj,
    HistoryIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final dynamicSize = 0;
  final value0 = object.addressTo;
  final _addressTo = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_addressTo.length) as int;
  final value1 = object.chainId;
  final _chainId = value1;
  final value2 = object.transactionHash;
  final _transactionHash = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_transactionHash.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _addressTo);
  writer.writeLong(offsets[1], _chainId);
  writer.writeBytes(offsets[2], _transactionHash);
}

HistoryIsarModel _historyIsarModelDeserializeNative(
    IsarCollection<HistoryIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = HistoryIsarModel(
    addressTo: reader.readString(offsets[0]),
    chainId: reader.readLong(offsets[1]),
    transactionHash: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _historyIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _historyIsarModelSerializeWeb(
    IsarCollection<HistoryIsarModel> collection, HistoryIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'addressTo', object.addressTo);
  IsarNative.jsObjectSet(jsObj, 'chainId', object.chainId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'transactionHash', object.transactionHash);
  return jsObj;
}

HistoryIsarModel _historyIsarModelDeserializeWeb(
    IsarCollection<HistoryIsarModel> collection, dynamic jsObj) {
  final object = HistoryIsarModel(
    addressTo: IsarNative.jsObjectGet(jsObj, 'addressTo') ?? '',
    chainId:
        IsarNative.jsObjectGet(jsObj, 'chainId') ?? double.negativeInfinity,
    transactionHash: IsarNative.jsObjectGet(jsObj, 'transactionHash') ?? '',
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _historyIsarModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'addressTo':
      return (IsarNative.jsObjectGet(jsObj, 'addressTo') ?? '') as P;
    case 'chainId':
      return (IsarNative.jsObjectGet(jsObj, 'chainId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'transactionHash':
      return (IsarNative.jsObjectGet(jsObj, 'transactionHash') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _historyIsarModelAttachLinks(
    IsarCollection col, int id, HistoryIsarModel object) {}

extension HistoryIsarModelQueryWhereSort
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QWhere> {
  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension HistoryIsarModelQueryWhere
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QWhereClause> {
  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterWhereClause> idBetween(
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

extension HistoryIsarModelQueryFilter
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QFilterCondition> {
  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'addressTo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      addressToMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'addressTo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      chainIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chainId',
      value: value,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'transactionHash',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterFilterCondition>
      transactionHashMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'transactionHash',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension HistoryIsarModelQueryLinks
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QFilterCondition> {}

extension HistoryIsarModelQueryWhereSortBy
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QSortBy> {
  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByAddressTo() {
    return addSortByInternal('addressTo', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByAddressToDesc() {
    return addSortByInternal('addressTo', Sort.desc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByChainId() {
    return addSortByInternal('chainId', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByChainIdDesc() {
    return addSortByInternal('chainId', Sort.desc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByTransactionHash() {
    return addSortByInternal('transactionHash', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      sortByTransactionHashDesc() {
    return addSortByInternal('transactionHash', Sort.desc);
  }
}

extension HistoryIsarModelQueryWhereSortThenBy
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QSortThenBy> {
  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByAddressTo() {
    return addSortByInternal('addressTo', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByAddressToDesc() {
    return addSortByInternal('addressTo', Sort.desc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByChainId() {
    return addSortByInternal('chainId', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByChainIdDesc() {
    return addSortByInternal('chainId', Sort.desc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByTransactionHash() {
    return addSortByInternal('transactionHash', Sort.asc);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QAfterSortBy>
      thenByTransactionHashDesc() {
    return addSortByInternal('transactionHash', Sort.desc);
  }
}

extension HistoryIsarModelQueryWhereDistinct
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QDistinct> {
  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QDistinct>
      distinctByAddressTo({bool caseSensitive = true}) {
    return addDistinctByInternal('addressTo', caseSensitive: caseSensitive);
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QDistinct>
      distinctByChainId() {
    return addDistinctByInternal('chainId');
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<HistoryIsarModel, HistoryIsarModel, QDistinct>
      distinctByTransactionHash({bool caseSensitive = true}) {
    return addDistinctByInternal('transactionHash',
        caseSensitive: caseSensitive);
  }
}

extension HistoryIsarModelQueryProperty
    on QueryBuilder<HistoryIsarModel, HistoryIsarModel, QQueryProperty> {
  QueryBuilder<HistoryIsarModel, String, QQueryOperations> addressToProperty() {
    return addPropertyNameInternal('addressTo');
  }

  QueryBuilder<HistoryIsarModel, int, QQueryOperations> chainIdProperty() {
    return addPropertyNameInternal('chainId');
  }

  QueryBuilder<HistoryIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<HistoryIsarModel, String, QQueryOperations>
      transactionHashProperty() {
    return addPropertyNameInternal('transactionHash');
  }
}
