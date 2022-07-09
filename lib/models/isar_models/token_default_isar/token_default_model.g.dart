// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_default_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTokenDefaultModelCollection on Isar {
  IsarCollection<TokenDefaultModel> get tokenDefault => getCollection();
}

const TokenDefaultModelSchema = CollectionSchema(
  name: 'TokenDefaultModel',
  schema:
      '{"name":"TokenDefaultModel","idName":"id","properties":[{"name":"bed","type":"String"},{"name":"bedBoxes","type":"String"},{"name":"items","type":"String"},{"name":"jewels","type":"String"},{"name":"slft","type":"String"},{"name":"slgt","type":"String"},{"name":"wavax","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'bed': 0,
    'bedBoxes': 1,
    'items': 2,
    'jewels': 3,
    'slft': 4,
    'slgt': 5,
    'wavax': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'tokenDefault': 0},
  backlinkLinkNames: {'tokenDefault': 'tokenDefault'},
  getId: _tokenDefaultModelGetId,
  setId: _tokenDefaultModelSetId,
  getLinks: _tokenDefaultModelGetLinks,
  attachLinks: _tokenDefaultModelAttachLinks,
  serializeNative: _tokenDefaultModelSerializeNative,
  deserializeNative: _tokenDefaultModelDeserializeNative,
  deserializePropNative: _tokenDefaultModelDeserializePropNative,
  serializeWeb: _tokenDefaultModelSerializeWeb,
  deserializeWeb: _tokenDefaultModelDeserializeWeb,
  deserializePropWeb: _tokenDefaultModelDeserializePropWeb,
  version: 3,
);

int? _tokenDefaultModelGetId(TokenDefaultModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tokenDefaultModelSetId(TokenDefaultModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _tokenDefaultModelGetLinks(TokenDefaultModel object) {
  return [object.tokenDefault];
}

void _tokenDefaultModelSerializeNative(
    IsarCollection<TokenDefaultModel> collection,
    IsarRawObject rawObj,
    TokenDefaultModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.bed;
  final _bed = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_bed.length) as int;
  final value1 = object.bedBoxes;
  final _bedBoxes = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_bedBoxes.length) as int;
  final value2 = object.items;
  final _items = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_items.length) as int;
  final value3 = object.jewels;
  final _jewels = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_jewels.length) as int;
  final value4 = object.slft;
  final _slft = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_slft.length) as int;
  final value5 = object.slgt;
  final _slgt = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_slgt.length) as int;
  final value6 = object.wavax;
  final _wavax = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_wavax.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _bed);
  writer.writeBytes(offsets[1], _bedBoxes);
  writer.writeBytes(offsets[2], _items);
  writer.writeBytes(offsets[3], _jewels);
  writer.writeBytes(offsets[4], _slft);
  writer.writeBytes(offsets[5], _slgt);
  writer.writeBytes(offsets[6], _wavax);
}

TokenDefaultModel _tokenDefaultModelDeserializeNative(
    IsarCollection<TokenDefaultModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TokenDefaultModel(
    bed: reader.readString(offsets[0]),
    bedBoxes: reader.readString(offsets[1]),
    id: id,
    items: reader.readString(offsets[2]),
    jewels: reader.readString(offsets[3]),
    slft: reader.readString(offsets[4]),
    slgt: reader.readString(offsets[5]),
    wavax: reader.readString(offsets[6]),
  );
  _tokenDefaultModelAttachLinks(collection, id, object);
  return object;
}

P _tokenDefaultModelDeserializePropNative<P>(
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
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _tokenDefaultModelSerializeWeb(
    IsarCollection<TokenDefaultModel> collection, TokenDefaultModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'bed', object.bed);
  IsarNative.jsObjectSet(jsObj, 'bedBoxes', object.bedBoxes);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'items', object.items);
  IsarNative.jsObjectSet(jsObj, 'jewels', object.jewels);
  IsarNative.jsObjectSet(jsObj, 'slft', object.slft);
  IsarNative.jsObjectSet(jsObj, 'slgt', object.slgt);
  IsarNative.jsObjectSet(jsObj, 'wavax', object.wavax);
  return jsObj;
}

TokenDefaultModel _tokenDefaultModelDeserializeWeb(
    IsarCollection<TokenDefaultModel> collection, dynamic jsObj) {
  final object = TokenDefaultModel(
    bed: IsarNative.jsObjectGet(jsObj, 'bed') ?? '',
    bedBoxes: IsarNative.jsObjectGet(jsObj, 'bedBoxes') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id'),
    items: IsarNative.jsObjectGet(jsObj, 'items') ?? '',
    jewels: IsarNative.jsObjectGet(jsObj, 'jewels') ?? '',
    slft: IsarNative.jsObjectGet(jsObj, 'slft') ?? '',
    slgt: IsarNative.jsObjectGet(jsObj, 'slgt') ?? '',
    wavax: IsarNative.jsObjectGet(jsObj, 'wavax') ?? '',
  );
  _tokenDefaultModelAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _tokenDefaultModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'bed':
      return (IsarNative.jsObjectGet(jsObj, 'bed') ?? '') as P;
    case 'bedBoxes':
      return (IsarNative.jsObjectGet(jsObj, 'bedBoxes') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'items':
      return (IsarNative.jsObjectGet(jsObj, 'items') ?? '') as P;
    case 'jewels':
      return (IsarNative.jsObjectGet(jsObj, 'jewels') ?? '') as P;
    case 'slft':
      return (IsarNative.jsObjectGet(jsObj, 'slft') ?? '') as P;
    case 'slgt':
      return (IsarNative.jsObjectGet(jsObj, 'slgt') ?? '') as P;
    case 'wavax':
      return (IsarNative.jsObjectGet(jsObj, 'wavax') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tokenDefaultModelAttachLinks(
    IsarCollection col, int id, TokenDefaultModel object) {
  object.tokenDefault.attach(col, col.isar.networks, 'tokenDefault', id);
}

extension TokenDefaultModelQueryWhereSort
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QWhere> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TokenDefaultModelQueryWhere
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QWhereClause> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterWhereClause>
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

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterWhereClause>
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

extension TokenDefaultModelQueryFilter
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QFilterCondition> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bed',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bed',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bed',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bed',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bed',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bed',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'bed',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'bed',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bedBoxes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bedBoxes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bedBoxes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bedBoxes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bedBoxes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bedBoxes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'bedBoxes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      bedBoxesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'bedBoxes',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
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

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
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

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
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

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'items',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'items',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'items',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'items',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'items',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'items',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'items',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      itemsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'items',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'jewels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'jewels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'jewels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'jewels',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'jewels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'jewels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'jewels',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      jewelsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'jewels',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'slft',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'slft',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'slft',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'slft',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'slft',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'slft',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'slft',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slftMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'slft',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'slgt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'slgt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'slgt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'slgt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'slgt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'slgt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'slgt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      slgtMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'slgt',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'wavax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'wavax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'wavax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'wavax',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'wavax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'wavax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'wavax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      wavaxMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'wavax',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TokenDefaultModelQueryLinks
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QFilterCondition> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterFilterCondition>
      tokenDefault(FilterQuery<NetworkIsarModel> q) {
    return linkInternal(
      isar.networks,
      q,
      'tokenDefault',
    );
  }
}

extension TokenDefaultModelQueryWhereSortBy
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QSortBy> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy> sortByBed() {
    return addSortByInternal('bed', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByBedDesc() {
    return addSortByInternal('bed', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByBedBoxes() {
    return addSortByInternal('bedBoxes', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByBedBoxesDesc() {
    return addSortByInternal('bedBoxes', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByItems() {
    return addSortByInternal('items', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByItemsDesc() {
    return addSortByInternal('items', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByJewels() {
    return addSortByInternal('jewels', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByJewelsDesc() {
    return addSortByInternal('jewels', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortBySlft() {
    return addSortByInternal('slft', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortBySlftDesc() {
    return addSortByInternal('slft', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortBySlgt() {
    return addSortByInternal('slgt', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortBySlgtDesc() {
    return addSortByInternal('slgt', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByWavax() {
    return addSortByInternal('wavax', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      sortByWavaxDesc() {
    return addSortByInternal('wavax', Sort.desc);
  }
}

extension TokenDefaultModelQueryWhereSortThenBy
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QSortThenBy> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy> thenByBed() {
    return addSortByInternal('bed', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByBedDesc() {
    return addSortByInternal('bed', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByBedBoxes() {
    return addSortByInternal('bedBoxes', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByBedBoxesDesc() {
    return addSortByInternal('bedBoxes', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByItems() {
    return addSortByInternal('items', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByItemsDesc() {
    return addSortByInternal('items', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByJewels() {
    return addSortByInternal('jewels', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByJewelsDesc() {
    return addSortByInternal('jewels', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenBySlft() {
    return addSortByInternal('slft', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenBySlftDesc() {
    return addSortByInternal('slft', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenBySlgt() {
    return addSortByInternal('slgt', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenBySlgtDesc() {
    return addSortByInternal('slgt', Sort.desc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByWavax() {
    return addSortByInternal('wavax', Sort.asc);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QAfterSortBy>
      thenByWavaxDesc() {
    return addSortByInternal('wavax', Sort.desc);
  }
}

extension TokenDefaultModelQueryWhereDistinct
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> {
  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> distinctByBed(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bed', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct>
      distinctByBedBoxes({bool caseSensitive = true}) {
    return addDistinctByInternal('bedBoxes', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> distinctByItems(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('items', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct>
      distinctByJewels({bool caseSensitive = true}) {
    return addDistinctByInternal('jewels', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> distinctBySlft(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('slft', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> distinctBySlgt(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('slgt', caseSensitive: caseSensitive);
  }

  QueryBuilder<TokenDefaultModel, TokenDefaultModel, QDistinct> distinctByWavax(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('wavax', caseSensitive: caseSensitive);
  }
}

extension TokenDefaultModelQueryProperty
    on QueryBuilder<TokenDefaultModel, TokenDefaultModel, QQueryProperty> {
  QueryBuilder<TokenDefaultModel, String, QQueryOperations> bedProperty() {
    return addPropertyNameInternal('bed');
  }

  QueryBuilder<TokenDefaultModel, String, QQueryOperations> bedBoxesProperty() {
    return addPropertyNameInternal('bedBoxes');
  }

  QueryBuilder<TokenDefaultModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TokenDefaultModel, String, QQueryOperations> itemsProperty() {
    return addPropertyNameInternal('items');
  }

  QueryBuilder<TokenDefaultModel, String, QQueryOperations> jewelsProperty() {
    return addPropertyNameInternal('jewels');
  }

  QueryBuilder<TokenDefaultModel, String, QQueryOperations> slftProperty() {
    return addPropertyNameInternal('slft');
  }

  QueryBuilder<TokenDefaultModel, String, QQueryOperations> slgtProperty() {
    return addPropertyNameInternal('slgt');
  }

  QueryBuilder<TokenDefaultModel, String, QQueryOperations> wavaxProperty() {
    return addPropertyNameInternal('wavax');
  }
}
