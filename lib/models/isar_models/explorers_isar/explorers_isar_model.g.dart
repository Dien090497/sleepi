// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explorers_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_finaliable

extension GetExplorersIsarModelCollection on Isar {
  IsarCollection<ExplorersIsarModel> get explorers => getCollection();
}

const ExplorersIsarModelSchema = CollectionSchema(
  name: 'ExplorersIsarModel',
  schema:
      '{"name":"ExplorersIsarModel","idName":"id","properties":[{"name":"name","type":"String"},{"name":"standard","type":"String"},{"name":"url","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'name': 0, 'standard': 1, 'url': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'network': 0},
  backlinkLinkNames: {'network': 'explorers'},
  getId: _explorersIsarModelGetId,
  setId: _explorersIsarModelSetId,
  getLinks: _explorersIsarModelGetLinks,
  attachLinks: _explorersIsarModelAttachLinks,
  serializeNative: _explorersIsarModelSerializeNative,
  deserializeNative: _explorersIsarModelDeserializeNative,
  deserializePropNative: _explorersIsarModelDeserializePropNative,
  serializeWeb: _explorersIsarModelSerializeWeb,
  deserializeWeb: _explorersIsarModelDeserializeWeb,
  deserializePropWeb: _explorersIsarModelDeserializePropWeb,
  version: 3,
);

int? _explorersIsarModelGetId(ExplorersIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _explorersIsarModelSetId(ExplorersIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _explorersIsarModelGetLinks(ExplorersIsarModel object) {
  return [object.network];
}

void _explorersIsarModelSerializeNative(
    IsarCollection<ExplorersIsarModel> collection,
    IsarRawObject rawObj,
    ExplorersIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final dynamicSize = 0;
  final value0 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_name.length) as int;
  final value1 = object.standard;
  final _standard = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_standard.length) as int;
  final value2 = object.url;
  final _url = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_url.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _name);
  writer.writeBytes(offsets[1], _standard);
  writer.writeBytes(offsets[2], _url);
}

ExplorersIsarModel _explorersIsarModelDeserializeNative(
    IsarCollection<ExplorersIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ExplorersIsarModel(
    reader.readString(offsets[0]),
    reader.readString(offsets[2]),
    reader.readString(offsets[1]),
    id: id,
  );
  _explorersIsarModelAttachLinks(collection, id, object);
  return object;
}

P _explorersIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _explorersIsarModelSerializeWeb(
    IsarCollection<ExplorersIsarModel> collection, ExplorersIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'standard', object.standard);
  IsarNative.jsObjectSet(jsObj, 'url', object.url);
  return jsObj;
}

ExplorersIsarModel _explorersIsarModelDeserializeWeb(
    IsarCollection<ExplorersIsarModel> collection, dynamic jsObj) {
  final object = ExplorersIsarModel(
    IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    IsarNative.jsObjectGet(jsObj, 'url') ?? '',
    IsarNative.jsObjectGet(jsObj, 'standard') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id'),
  );
  _explorersIsarModelAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _explorersIsarModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'standard':
      return (IsarNative.jsObjectGet(jsObj, 'standard') ?? '') as P;
    case 'url':
      return (IsarNative.jsObjectGet(jsObj, 'url') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _explorersIsarModelAttachLinks(
    IsarCollection col, int id, ExplorersIsarModel object) {
  object.network.attach(col, col.isar.networks, 'network', id);
}

extension ExplorersIsarModelQueryWhereSort
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QWhere> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension ExplorersIsarModelQueryWhere
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QWhereClause> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterWhereClause>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterWhereClause>
      idBetween(
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

extension ExplorersIsarModelQueryFilter
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QFilterCondition> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
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

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'standard',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'standard',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'standard',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'standard',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'standard',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'standard',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'standard',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      standardMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'standard',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'url',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'url',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ExplorersIsarModelQueryLinks
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QFilterCondition> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterFilterCondition>
      network(FilterQuery<NetworkIsarModel> q) {
    return linkInternal(
      isar.networks,
      q,
      'network',
    );
  }
}

extension ExplorersIsarModelQueryWhereSortBy
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QSortBy> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByStandard() {
    return addSortByInternal('standard', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByStandardDesc() {
    return addSortByInternal('standard', Sort.desc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      sortByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension ExplorersIsarModelQueryWhereSortThenBy
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QSortThenBy> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByStandard() {
    return addSortByInternal('standard', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByStandardDesc() {
    return addSortByInternal('standard', Sort.desc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QAfterSortBy>
      thenByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension ExplorersIsarModelQueryWhereDistinct
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QDistinct> {
  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QDistinct>
      distinctByStandard({bool caseSensitive = true}) {
    return addDistinctByInternal('standard', caseSensitive: caseSensitive);
  }

  QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('url', caseSensitive: caseSensitive);
  }
}

extension ExplorersIsarModelQueryProperty
    on QueryBuilder<ExplorersIsarModel, ExplorersIsarModel, QQueryProperty> {
  QueryBuilder<ExplorersIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ExplorersIsarModel, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<ExplorersIsarModel, String, QQueryOperations>
      standardProperty() {
    return addPropertyNameInternal('standard');
  }

  QueryBuilder<ExplorersIsarModel, String, QQueryOperations> urlProperty() {
    return addPropertyNameInternal('url');
  }
}
