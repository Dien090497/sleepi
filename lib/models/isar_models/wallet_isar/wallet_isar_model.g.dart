// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_isar_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WalletIsarModelCWProxy {
  WalletIsarModel address(String address);

  WalletIsarModel derivedIndex(int? derivedIndex);

  WalletIsarModel image(String image);

  WalletIsarModel isImported(bool isImported);

  WalletIsarModel mnemonic(String mnemonic);

  WalletIsarModel name(String name);

  WalletIsarModel nftIds(List<int> nftIds);

  WalletIsarModel privateKey(String privateKey);

  WalletIsarModel txnsIds(List<int> txnsIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WalletIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WalletIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  WalletIsarModel call({
    String? address,
    int? derivedIndex,
    String? image,
    bool? isImported,
    String? mnemonic,
    String? name,
    List<int>? nftIds,
    String? privateKey,
    List<int>? txnsIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWalletIsarModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWalletIsarModel.copyWith.fieldName(...)`
class _$WalletIsarModelCWProxyImpl implements _$WalletIsarModelCWProxy {
  final WalletIsarModel _value;

  const _$WalletIsarModelCWProxyImpl(this._value);

  @override
  WalletIsarModel address(String address) => this(address: address);

  @override
  WalletIsarModel derivedIndex(int? derivedIndex) =>
      this(derivedIndex: derivedIndex);

  @override
  WalletIsarModel image(String image) => this(image: image);

  @override
  WalletIsarModel isImported(bool isImported) => this(isImported: isImported);

  @override
  WalletIsarModel mnemonic(String mnemonic) => this(mnemonic: mnemonic);

  @override
  WalletIsarModel name(String name) => this(name: name);

  @override
  WalletIsarModel nftIds(List<int> nftIds) => this(nftIds: nftIds);

  @override
  WalletIsarModel privateKey(String privateKey) => this(privateKey: privateKey);

  @override
  WalletIsarModel txnsIds(List<int> txnsIds) => this(txnsIds: txnsIds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WalletIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WalletIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  WalletIsarModel call({
    Object? address = const $CopyWithPlaceholder(),
    Object? derivedIndex = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? isImported = const $CopyWithPlaceholder(),
    Object? mnemonic = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? nftIds = const $CopyWithPlaceholder(),
    Object? privateKey = const $CopyWithPlaceholder(),
    Object? txnsIds = const $CopyWithPlaceholder(),
  }) {
    return WalletIsarModel(
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      derivedIndex: derivedIndex == const $CopyWithPlaceholder()
          ? _value.derivedIndex
          // ignore: cast_nullable_to_non_nullable
          : derivedIndex as int?,
      image: image == const $CopyWithPlaceholder() || image == null
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String,
      isImported:
          isImported == const $CopyWithPlaceholder() || isImported == null
              ? _value.isImported
              // ignore: cast_nullable_to_non_nullable
              : isImported as bool,
      mnemonic: mnemonic == const $CopyWithPlaceholder() || mnemonic == null
          ? _value.mnemonic
          // ignore: cast_nullable_to_non_nullable
          : mnemonic as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      nftIds: nftIds == const $CopyWithPlaceholder() || nftIds == null
          ? _value.nftIds
          // ignore: cast_nullable_to_non_nullable
          : nftIds as List<int>,
      privateKey:
          privateKey == const $CopyWithPlaceholder() || privateKey == null
              ? _value.privateKey
              // ignore: cast_nullable_to_non_nullable
              : privateKey as String,
      txnsIds: txnsIds == const $CopyWithPlaceholder() || txnsIds == null
          ? _value.txnsIds
          // ignore: cast_nullable_to_non_nullable
          : txnsIds as List<int>,
    );
  }
}

extension $WalletIsarModelCopyWith on WalletIsarModel {
  /// Returns a callable class that can be used as follows: `instanceOfWalletIsarModel.copyWith(...)` or like so:`instanceOfWalletIsarModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WalletIsarModelCWProxy get copyWith => _$WalletIsarModelCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetWalletIsarModelCollection on Isar {
  IsarCollection<WalletIsarModel> get wallets => getCollection();
}

const WalletIsarModelSchema = CollectionSchema(
  name: 'WalletIsarModel',
  schema:
      '{"name":"WalletIsarModel","idName":"id","properties":[{"name":"address","type":"String"},{"name":"derivedIndex","type":"Long"},{"name":"image","type":"String"},{"name":"isImported","type":"Bool"},{"name":"mnemonic","type":"String"},{"name":"name","type":"String"},{"name":"nftIds","type":"LongList"},{"name":"privateKey","type":"String"},{"name":"txnsIds","type":"LongList"}],"indexes":[{"name":"isImported","unique":false,"properties":[{"name":"isImported","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'address': 0,
    'derivedIndex': 1,
    'image': 2,
    'isImported': 3,
    'mnemonic': 4,
    'name': 5,
    'nftIds': 6,
    'privateKey': 7,
    'txnsIds': 8
  },
  listProperties: {'nftIds', 'txnsIds'},
  indexIds: {'isImported': 0},
  indexValueTypes: {
    'isImported': [
      IndexValueType.bool,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _walletIsarModelGetId,
  setId: _walletIsarModelSetId,
  getLinks: _walletIsarModelGetLinks,
  attachLinks: _walletIsarModelAttachLinks,
  serializeNative: _walletIsarModelSerializeNative,
  deserializeNative: _walletIsarModelDeserializeNative,
  deserializePropNative: _walletIsarModelDeserializePropNative,
  serializeWeb: _walletIsarModelSerializeWeb,
  deserializeWeb: _walletIsarModelDeserializeWeb,
  deserializePropWeb: _walletIsarModelDeserializePropWeb,
  version: 3,
);

int? _walletIsarModelGetId(WalletIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _walletIsarModelSetId(WalletIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _walletIsarModelGetLinks(WalletIsarModel object) {
  return [];
}

void _walletIsarModelSerializeNative(
    IsarCollection<WalletIsarModel> collection,
    IsarRawObject rawObj,
    WalletIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.address;
  final _address = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_address.length) as int;
  final value1 = object.derivedIndex;
  final _derivedIndex = value1;
  final value2 = object.image;
  final _image = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_image.length) as int;
  final value3 = object.isImported;
  final _isImported = value3;
  final value4 = object.mnemonic;
  final _mnemonic = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_mnemonic.length) as int;
  final value5 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_name.length) as int;
  final value6 = object.nftIds;
  dynamicSize += (value6.length) * 8;
  final _nftIds = value6;
  final value7 = object.privateKey;
  final _privateKey = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_privateKey.length) as int;
  final value8 = object.txnsIds;
  dynamicSize += (value8.length) * 8;
  final _txnsIds = value8;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _address);
  writer.writeLong(offsets[1], _derivedIndex);
  writer.writeBytes(offsets[2], _image);
  writer.writeBool(offsets[3], _isImported);
  writer.writeBytes(offsets[4], _mnemonic);
  writer.writeBytes(offsets[5], _name);
  writer.writeLongList(offsets[6], _nftIds);
  writer.writeBytes(offsets[7], _privateKey);
  writer.writeLongList(offsets[8], _txnsIds);
}

WalletIsarModel _walletIsarModelDeserializeNative(
    IsarCollection<WalletIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = WalletIsarModel(
    address: reader.readString(offsets[0]),
    derivedIndex: reader.readLongOrNull(offsets[1]),
    image: reader.readString(offsets[2]),
    isImported: reader.readBool(offsets[3]),
    mnemonic: reader.readString(offsets[4]),
    name: reader.readString(offsets[5]),
    nftIds: reader.readLongList(offsets[6]) ?? [],
    privateKey: reader.readString(offsets[7]),
    txnsIds: reader.readLongList(offsets[8]) ?? [],
  );
  object.id = id;
  return object;
}

P _walletIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongList(offset) ?? []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _walletIsarModelSerializeWeb(
    IsarCollection<WalletIsarModel> collection, WalletIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'address', object.address);
  IsarNative.jsObjectSet(jsObj, 'derivedIndex', object.derivedIndex);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'image', object.image);
  IsarNative.jsObjectSet(jsObj, 'isImported', object.isImported);
  IsarNative.jsObjectSet(jsObj, 'mnemonic', object.mnemonic);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'nftIds', object.nftIds);
  IsarNative.jsObjectSet(jsObj, 'privateKey', object.privateKey);
  IsarNative.jsObjectSet(jsObj, 'txnsIds', object.txnsIds);
  return jsObj;
}

WalletIsarModel _walletIsarModelDeserializeWeb(
    IsarCollection<WalletIsarModel> collection, dynamic jsObj) {
  final object = WalletIsarModel(
    address: IsarNative.jsObjectGet(jsObj, 'address') ?? '',
    derivedIndex: IsarNative.jsObjectGet(jsObj, 'derivedIndex'),
    image: IsarNative.jsObjectGet(jsObj, 'image') ?? '',
    isImported: IsarNative.jsObjectGet(jsObj, 'isImported') ?? false,
    mnemonic: IsarNative.jsObjectGet(jsObj, 'mnemonic') ?? '',
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    nftIds: (IsarNative.jsObjectGet(jsObj, 'nftIds') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>() ??
        [],
    privateKey: IsarNative.jsObjectGet(jsObj, 'privateKey') ?? '',
    txnsIds: (IsarNative.jsObjectGet(jsObj, 'txnsIds') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>() ??
        [],
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _walletIsarModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'address':
      return (IsarNative.jsObjectGet(jsObj, 'address') ?? '') as P;
    case 'derivedIndex':
      return (IsarNative.jsObjectGet(jsObj, 'derivedIndex')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'image':
      return (IsarNative.jsObjectGet(jsObj, 'image') ?? '') as P;
    case 'isImported':
      return (IsarNative.jsObjectGet(jsObj, 'isImported') ?? false) as P;
    case 'mnemonic':
      return (IsarNative.jsObjectGet(jsObj, 'mnemonic') ?? '') as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'nftIds':
      return ((IsarNative.jsObjectGet(jsObj, 'nftIds') as List?)
              ?.map((e) => e ?? double.negativeInfinity)
              .toList()
              .cast<int>() ??
          []) as P;
    case 'privateKey':
      return (IsarNative.jsObjectGet(jsObj, 'privateKey') ?? '') as P;
    case 'txnsIds':
      return ((IsarNative.jsObjectGet(jsObj, 'txnsIds') as List?)
              ?.map((e) => e ?? double.negativeInfinity)
              .toList()
              .cast<int>() ??
          []) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _walletIsarModelAttachLinks(
    IsarCollection col, int id, WalletIsarModel object) {}

extension WalletIsarModelQueryWhereSort
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QWhere> {
  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhere> anyIsImported() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'isImported'));
  }
}

extension WalletIsarModelQueryWhere
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QWhereClause> {
  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause>
      isImportedEqualTo(bool isImported) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'isImported',
      value: [isImported],
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterWhereClause>
      isImportedNotEqualTo(bool isImported) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'isImported',
        upper: [isImported],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'isImported',
        lower: [isImported],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'isImported',
        lower: [isImported],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'isImported',
        upper: [isImported],
        includeUpper: false,
      ));
    }
  }
}

extension WalletIsarModelQueryFilter
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QFilterCondition> {
  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'address',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'address',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      derivedIndexIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'derivedIndex',
      value: null,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      derivedIndexEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'derivedIndex',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      derivedIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'derivedIndex',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      derivedIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'derivedIndex',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      derivedIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'derivedIndex',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'image',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      imageMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'image',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      isImportedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isImported',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mnemonic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mnemonic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mnemonic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mnemonic',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'mnemonic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'mnemonic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mnemonic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      mnemonicMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mnemonic',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
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

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      nftIdsAnyEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nftIds',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      nftIdsAnyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nftIds',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      nftIdsAnyLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nftIds',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      nftIdsAnyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nftIds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'privateKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'privateKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'privateKey',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'privateKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'privateKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'privateKey',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      privateKeyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'privateKey',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      txnsIdsAnyEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'txnsIds',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      txnsIdsAnyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'txnsIds',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      txnsIdsAnyLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'txnsIds',
      value: value,
    ));
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterFilterCondition>
      txnsIdsAnyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'txnsIds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension WalletIsarModelQueryLinks
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QFilterCondition> {}

extension WalletIsarModelQueryWhereSortBy
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QSortBy> {
  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> sortByAddress() {
    return addSortByInternal('address', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByAddressDesc() {
    return addSortByInternal('address', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByDerivedIndex() {
    return addSortByInternal('derivedIndex', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByDerivedIndexDesc() {
    return addSortByInternal('derivedIndex', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> sortByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByIsImported() {
    return addSortByInternal('isImported', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByIsImportedDesc() {
    return addSortByInternal('isImported', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByMnemonic() {
    return addSortByInternal('mnemonic', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByMnemonicDesc() {
    return addSortByInternal('mnemonic', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByPrivateKey() {
    return addSortByInternal('privateKey', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      sortByPrivateKeyDesc() {
    return addSortByInternal('privateKey', Sort.desc);
  }
}

extension WalletIsarModelQueryWhereSortThenBy
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QSortThenBy> {
  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> thenByAddress() {
    return addSortByInternal('address', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByAddressDesc() {
    return addSortByInternal('address', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByDerivedIndex() {
    return addSortByInternal('derivedIndex', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByDerivedIndexDesc() {
    return addSortByInternal('derivedIndex', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> thenByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByIsImported() {
    return addSortByInternal('isImported', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByIsImportedDesc() {
    return addSortByInternal('isImported', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByMnemonic() {
    return addSortByInternal('mnemonic', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByMnemonicDesc() {
    return addSortByInternal('mnemonic', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByPrivateKey() {
    return addSortByInternal('privateKey', Sort.asc);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QAfterSortBy>
      thenByPrivateKeyDesc() {
    return addSortByInternal('privateKey', Sort.desc);
  }
}

extension WalletIsarModelQueryWhereDistinct
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct> {
  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('address', caseSensitive: caseSensitive);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct>
      distinctByDerivedIndex() {
    return addDistinctByInternal('derivedIndex');
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('image', caseSensitive: caseSensitive);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct>
      distinctByIsImported() {
    return addDistinctByInternal('isImported');
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct> distinctByMnemonic(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mnemonic', caseSensitive: caseSensitive);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<WalletIsarModel, WalletIsarModel, QDistinct>
      distinctByPrivateKey({bool caseSensitive = true}) {
    return addDistinctByInternal('privateKey', caseSensitive: caseSensitive);
  }
}

extension WalletIsarModelQueryProperty
    on QueryBuilder<WalletIsarModel, WalletIsarModel, QQueryProperty> {
  QueryBuilder<WalletIsarModel, String, QQueryOperations> addressProperty() {
    return addPropertyNameInternal('address');
  }

  QueryBuilder<WalletIsarModel, int?, QQueryOperations> derivedIndexProperty() {
    return addPropertyNameInternal('derivedIndex');
  }

  QueryBuilder<WalletIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<WalletIsarModel, String, QQueryOperations> imageProperty() {
    return addPropertyNameInternal('image');
  }

  QueryBuilder<WalletIsarModel, bool, QQueryOperations> isImportedProperty() {
    return addPropertyNameInternal('isImported');
  }

  QueryBuilder<WalletIsarModel, String, QQueryOperations> mnemonicProperty() {
    return addPropertyNameInternal('mnemonic');
  }

  QueryBuilder<WalletIsarModel, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<WalletIsarModel, List<int>, QQueryOperations> nftIdsProperty() {
    return addPropertyNameInternal('nftIds');
  }

  QueryBuilder<WalletIsarModel, String, QQueryOperations> privateKeyProperty() {
    return addPropertyNameInternal('privateKey');
  }

  QueryBuilder<WalletIsarModel, List<int>, QQueryOperations> txnsIdsProperty() {
    return addPropertyNameInternal('txnsIds');
  }
}
