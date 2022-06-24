// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_isar_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransactionIsarModelCWProxy {
  TransactionIsarModel gasPrice(double? gasPrice);

  TransactionIsarModel maxGas(int? maxGas);

  TransactionIsarModel toAddress(String toAddress);

  TransactionIsarModel transactionHash(String? transactionHash);

  TransactionIsarModel valueInEther(double valueInEther);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionIsarModel call({
    double? gasPrice,
    int? maxGas,
    String? toAddress,
    String? transactionHash,
    double? valueInEther,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransactionIsarModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransactionIsarModel.copyWith.fieldName(...)`
class _$TransactionIsarModelCWProxyImpl
    implements _$TransactionIsarModelCWProxy {
  final TransactionIsarModel _value;

  const _$TransactionIsarModelCWProxyImpl(this._value);

  @override
  TransactionIsarModel gasPrice(double? gasPrice) => this(gasPrice: gasPrice);

  @override
  TransactionIsarModel maxGas(int? maxGas) => this(maxGas: maxGas);

  @override
  TransactionIsarModel toAddress(String toAddress) =>
      this(toAddress: toAddress);

  @override
  TransactionIsarModel transactionHash(String? transactionHash) =>
      this(transactionHash: transactionHash);

  @override
  TransactionIsarModel valueInEther(double valueInEther) =>
      this(valueInEther: valueInEther);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionIsarModel call({
    Object? gasPrice = const $CopyWithPlaceholder(),
    Object? maxGas = const $CopyWithPlaceholder(),
    Object? toAddress = const $CopyWithPlaceholder(),
    Object? transactionHash = const $CopyWithPlaceholder(),
    Object? valueInEther = const $CopyWithPlaceholder(),
  }) {
    return TransactionIsarModel(
      gasPrice: gasPrice == const $CopyWithPlaceholder()
          ? _value.gasPrice
          // ignore: cast_nullable_to_non_nullable
          : gasPrice as double?,
      maxGas: maxGas == const $CopyWithPlaceholder()
          ? _value.maxGas
          // ignore: cast_nullable_to_non_nullable
          : maxGas as int?,
      toAddress: toAddress == const $CopyWithPlaceholder() || toAddress == null
          ? _value.toAddress
          // ignore: cast_nullable_to_non_nullable
          : toAddress as String,
      transactionHash: transactionHash == const $CopyWithPlaceholder()
          ? _value.transactionHash
          // ignore: cast_nullable_to_non_nullable
          : transactionHash as String?,
      valueInEther:
          valueInEther == const $CopyWithPlaceholder() || valueInEther == null
              ? _value.valueInEther
              // ignore: cast_nullable_to_non_nullable
              : valueInEther as double,
    );
  }
}

extension $TransactionIsarModelCopyWith on TransactionIsarModel {
  /// Returns a callable class that can be used as follows: `instanceOfTransactionIsarModel.copyWith(...)` or like so:`instanceOfTransactionIsarModel.copyWith.fieldName(...)`.
  _$TransactionIsarModelCWProxy get copyWith =>
      _$TransactionIsarModelCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTransactionIsarModelCollection on Isar {
  IsarCollection<TransactionIsarModel> get transaction => getCollection();
}

const TransactionIsarModelSchema = CollectionSchema(
  name: 'TransactionIsarModel',
  schema:
      '{"name":"TransactionIsarModel","idName":"id","properties":[{"name":"gasPrice","type":"Double"},{"name":"maxGas","type":"Long"},{"name":"toAddress","type":"String"},{"name":"transactionHash","type":"String"},{"name":"valueInEther","type":"Double"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'gasPrice': 0,
    'maxGas': 1,
    'toAddress': 2,
    'transactionHash': 3,
    'valueInEther': 4
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _transactionIsarModelGetId,
  setId: _transactionIsarModelSetId,
  getLinks: _transactionIsarModelGetLinks,
  attachLinks: _transactionIsarModelAttachLinks,
  serializeNative: _transactionIsarModelSerializeNative,
  deserializeNative: _transactionIsarModelDeserializeNative,
  deserializePropNative: _transactionIsarModelDeserializePropNative,
  serializeWeb: _transactionIsarModelSerializeWeb,
  deserializeWeb: _transactionIsarModelDeserializeWeb,
  deserializePropWeb: _transactionIsarModelDeserializePropWeb,
  version: 3,
);

int? _transactionIsarModelGetId(TransactionIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _transactionIsarModelSetId(TransactionIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _transactionIsarModelGetLinks(TransactionIsarModel object) {
  return [];
}

void _transactionIsarModelSerializeNative(
    IsarCollection<TransactionIsarModel> collection,
    IsarRawObject rawObj,
    TransactionIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.gasPrice;
  final _gasPrice = value0;
  final value1 = object.maxGas;
  final _maxGas = value1;
  final value2 = object.toAddress;
  final _toAddress = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_toAddress.length) as int;
  final value3 = object.transactionHash;
  IsarUint8List? _transactionHash;
  if (value3 != null) {
    _transactionHash = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_transactionHash?.length ?? 0) as int;
  final value4 = object.valueInEther;
  final _valueInEther = value4;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDouble(offsets[0], _gasPrice);
  writer.writeLong(offsets[1], _maxGas);
  writer.writeBytes(offsets[2], _toAddress);
  writer.writeBytes(offsets[3], _transactionHash);
  writer.writeDouble(offsets[4], _valueInEther);
}

TransactionIsarModel _transactionIsarModelDeserializeNative(
    IsarCollection<TransactionIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TransactionIsarModel(
    gasPrice: reader.readDoubleOrNull(offsets[0]),
    maxGas: reader.readLongOrNull(offsets[1]),
    toAddress: reader.readString(offsets[2]),
    transactionHash: reader.readStringOrNull(offsets[3]),
    valueInEther: reader.readDouble(offsets[4]),
  );
  object.id = id;
  return object;
}

P _transactionIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _transactionIsarModelSerializeWeb(
    IsarCollection<TransactionIsarModel> collection,
    TransactionIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'gasPrice', object.gasPrice);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'maxGas', object.maxGas);
  IsarNative.jsObjectSet(jsObj, 'toAddress', object.toAddress);
  IsarNative.jsObjectSet(jsObj, 'transactionHash', object.transactionHash);
  IsarNative.jsObjectSet(jsObj, 'valueInEther', object.valueInEther);
  return jsObj;
}

TransactionIsarModel _transactionIsarModelDeserializeWeb(
    IsarCollection<TransactionIsarModel> collection, dynamic jsObj) {
  final object = TransactionIsarModel(
    gasPrice: IsarNative.jsObjectGet(jsObj, 'gasPrice'),
    maxGas: IsarNative.jsObjectGet(jsObj, 'maxGas'),
    toAddress: IsarNative.jsObjectGet(jsObj, 'toAddress') ?? '',
    transactionHash: IsarNative.jsObjectGet(jsObj, 'transactionHash'),
    valueInEther: IsarNative.jsObjectGet(jsObj, 'valueInEther') ??
        double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _transactionIsarModelDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'gasPrice':
      return (IsarNative.jsObjectGet(jsObj, 'gasPrice')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'maxGas':
      return (IsarNative.jsObjectGet(jsObj, 'maxGas')) as P;
    case 'toAddress':
      return (IsarNative.jsObjectGet(jsObj, 'toAddress') ?? '') as P;
    case 'transactionHash':
      return (IsarNative.jsObjectGet(jsObj, 'transactionHash')) as P;
    case 'valueInEther':
      return (IsarNative.jsObjectGet(jsObj, 'valueInEther') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _transactionIsarModelAttachLinks(
    IsarCollection col, int id, TransactionIsarModel object) {}

extension TransactionIsarModelQueryWhereSort
    on QueryBuilder<TransactionIsarModel, TransactionIsarModel, QWhere> {
  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TransactionIsarModelQueryWhere
    on QueryBuilder<TransactionIsarModel, TransactionIsarModel, QWhereClause> {
  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterWhereClause>
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterWhereClause>
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

extension TransactionIsarModelQueryFilter on QueryBuilder<TransactionIsarModel,
    TransactionIsarModel, QFilterCondition> {
  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> gasPriceIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'gasPrice',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> gasPriceGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'gasPrice',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> gasPriceLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'gasPrice',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> gasPriceBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'gasPrice',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> maxGasIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'maxGas',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> maxGasEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'maxGas',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> maxGasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'maxGas',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> maxGasLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'maxGas',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> maxGasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'maxGas',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> toAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'toAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> toAddressGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'toAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> toAddressLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'toAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> toAddressBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'toAddress',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> toAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'toAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> toAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'toAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      toAddressContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'toAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      toAddressMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'toAddress',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'transactionHash',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashGreaterThan(
    String? value, {
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashLessThan(
    String? value, {
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashStartsWith(
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> transactionHashEndsWith(
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      transactionHashContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'transactionHash',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      transactionHashMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'transactionHash',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> valueInEtherGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'valueInEther',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> valueInEtherLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'valueInEther',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> valueInEtherBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'valueInEther',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }
}

extension TransactionIsarModelQueryLinks on QueryBuilder<TransactionIsarModel,
    TransactionIsarModel, QFilterCondition> {}

extension TransactionIsarModelQueryWhereSortBy
    on QueryBuilder<TransactionIsarModel, TransactionIsarModel, QSortBy> {
  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByGasPrice() {
    return addSortByInternal('gasPrice', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByGasPriceDesc() {
    return addSortByInternal('gasPrice', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByMaxGas() {
    return addSortByInternal('maxGas', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByMaxGasDesc() {
    return addSortByInternal('maxGas', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByToAddress() {
    return addSortByInternal('toAddress', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByToAddressDesc() {
    return addSortByInternal('toAddress', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByTransactionHash() {
    return addSortByInternal('transactionHash', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByTransactionHashDesc() {
    return addSortByInternal('transactionHash', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByValueInEther() {
    return addSortByInternal('valueInEther', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByValueInEtherDesc() {
    return addSortByInternal('valueInEther', Sort.desc);
  }
}

extension TransactionIsarModelQueryWhereSortThenBy
    on QueryBuilder<TransactionIsarModel, TransactionIsarModel, QSortThenBy> {
  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByGasPrice() {
    return addSortByInternal('gasPrice', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByGasPriceDesc() {
    return addSortByInternal('gasPrice', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByMaxGas() {
    return addSortByInternal('maxGas', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByMaxGasDesc() {
    return addSortByInternal('maxGas', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByToAddress() {
    return addSortByInternal('toAddress', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByToAddressDesc() {
    return addSortByInternal('toAddress', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByTransactionHash() {
    return addSortByInternal('transactionHash', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByTransactionHashDesc() {
    return addSortByInternal('transactionHash', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByValueInEther() {
    return addSortByInternal('valueInEther', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByValueInEtherDesc() {
    return addSortByInternal('valueInEther', Sort.desc);
  }
}

extension TransactionIsarModelQueryWhereDistinct
    on QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct> {
  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByGasPrice() {
    return addDistinctByInternal('gasPrice');
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByMaxGas() {
    return addDistinctByInternal('maxGas');
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByToAddress({bool caseSensitive = true}) {
    return addDistinctByInternal('toAddress', caseSensitive: caseSensitive);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByTransactionHash({bool caseSensitive = true}) {
    return addDistinctByInternal('transactionHash',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByValueInEther() {
    return addDistinctByInternal('valueInEther');
  }
}

extension TransactionIsarModelQueryProperty on QueryBuilder<
    TransactionIsarModel, TransactionIsarModel, QQueryProperty> {
  QueryBuilder<TransactionIsarModel, double?, QQueryOperations>
      gasPriceProperty() {
    return addPropertyNameInternal('gasPrice');
  }

  QueryBuilder<TransactionIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TransactionIsarModel, int?, QQueryOperations> maxGasProperty() {
    return addPropertyNameInternal('maxGas');
  }

  QueryBuilder<TransactionIsarModel, String, QQueryOperations>
      toAddressProperty() {
    return addPropertyNameInternal('toAddress');
  }

  QueryBuilder<TransactionIsarModel, String?, QQueryOperations>
      transactionHashProperty() {
    return addPropertyNameInternal('transactionHash');
  }

  QueryBuilder<TransactionIsarModel, double, QQueryOperations>
      valueInEtherProperty() {
    return addPropertyNameInternal('valueInEther');
  }
}
