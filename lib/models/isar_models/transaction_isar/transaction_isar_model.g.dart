// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_isar_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransactionIsarModelCWProxy {
  TransactionIsarModel addressFrom(String? addressFrom);

  TransactionIsarModel addressTo(String? addressTo);

  TransactionIsarModel gasPrice(double? gasPrice);

  TransactionIsarModel maxGas(int? maxGas);

  TransactionIsarModel status(int? status);

  TransactionIsarModel timeStamp(DateTime timeStamp);

  TransactionIsarModel transactionHash(String? transactionHash);

  TransactionIsarModel valueInEther(double? valueInEther);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionIsarModel call({
    String? addressFrom,
    String? addressTo,
    double? gasPrice,
    int? maxGas,
    int? status,
    DateTime? timeStamp,
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
  TransactionIsarModel addressFrom(String? addressFrom) =>
      this(addressFrom: addressFrom);

  @override
  TransactionIsarModel addressTo(String? addressTo) =>
      this(addressTo: addressTo);

  @override
  TransactionIsarModel gasPrice(double? gasPrice) => this(gasPrice: gasPrice);

  @override
  TransactionIsarModel maxGas(int? maxGas) => this(maxGas: maxGas);

  @override
  TransactionIsarModel status(int? status) => this(status: status);

  @override
  TransactionIsarModel timeStamp(DateTime timeStamp) =>
      this(timeStamp: timeStamp);

  @override
  TransactionIsarModel transactionHash(String? transactionHash) =>
      this(transactionHash: transactionHash);

  @override
  TransactionIsarModel valueInEther(double? valueInEther) =>
      this(valueInEther: valueInEther);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionIsarModel call({
    Object? addressFrom = const $CopyWithPlaceholder(),
    Object? addressTo = const $CopyWithPlaceholder(),
    Object? gasPrice = const $CopyWithPlaceholder(),
    Object? maxGas = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? timeStamp = const $CopyWithPlaceholder(),
    Object? transactionHash = const $CopyWithPlaceholder(),
    Object? valueInEther = const $CopyWithPlaceholder(),
  }) {
    return TransactionIsarModel(
      addressFrom: addressFrom == const $CopyWithPlaceholder()
          ? _value.addressFrom
          // ignore: cast_nullable_to_non_nullable
          : addressFrom as String?,
      addressTo: addressTo == const $CopyWithPlaceholder()
          ? _value.addressTo
          // ignore: cast_nullable_to_non_nullable
          : addressTo as String?,
      gasPrice: gasPrice == const $CopyWithPlaceholder()
          ? _value.gasPrice
          // ignore: cast_nullable_to_non_nullable
          : gasPrice as double?,
      maxGas: maxGas == const $CopyWithPlaceholder()
          ? _value.maxGas
          // ignore: cast_nullable_to_non_nullable
          : maxGas as int?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
      timeStamp: timeStamp == const $CopyWithPlaceholder() || timeStamp == null
          ? _value.timeStamp
          // ignore: cast_nullable_to_non_nullable
          : timeStamp as DateTime,
      transactionHash: transactionHash == const $CopyWithPlaceholder()
          ? _value.transactionHash
          // ignore: cast_nullable_to_non_nullable
          : transactionHash as String?,
      valueInEther: valueInEther == const $CopyWithPlaceholder()
          ? _value.valueInEther
          // ignore: cast_nullable_to_non_nullable
          : valueInEther as double?,
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
      '{"name":"TransactionIsarModel","idName":"id","properties":[{"name":"addressFrom","type":"String"},{"name":"addressTo","type":"String"},{"name":"gasPrice","type":"Double"},{"name":"maxGas","type":"Long"},{"name":"status","type":"Long"},{"name":"timeStamp","type":"Long"},{"name":"transactionHash","type":"String"},{"name":"valueInEther","type":"Double"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'addressFrom': 0,
    'addressTo': 1,
    'gasPrice': 2,
    'maxGas': 3,
    'status': 4,
    'timeStamp': 5,
    'transactionHash': 6,
    'valueInEther': 7
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
  final value0 = object.addressFrom;
  IsarUint8List? _addressFrom;
  if (value0 != null) {
    _addressFrom = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_addressFrom?.length ?? 0) as int;
  final value1 = object.addressTo;
  IsarUint8List? _addressTo;
  if (value1 != null) {
    _addressTo = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_addressTo?.length ?? 0) as int;
  final value2 = object.gasPrice;
  final _gasPrice = value2;
  final value3 = object.maxGas;
  final _maxGas = value3;
  final value4 = object.status;
  final _status = value4;
  final value5 = object.timeStamp;
  final _timeStamp = value5;
  final value6 = object.transactionHash;
  IsarUint8List? _transactionHash;
  if (value6 != null) {
    _transactionHash = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_transactionHash?.length ?? 0) as int;
  final value7 = object.valueInEther;
  final _valueInEther = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _addressFrom);
  writer.writeBytes(offsets[1], _addressTo);
  writer.writeDouble(offsets[2], _gasPrice);
  writer.writeLong(offsets[3], _maxGas);
  writer.writeLong(offsets[4], _status);
  writer.writeDateTime(offsets[5], _timeStamp);
  writer.writeBytes(offsets[6], _transactionHash);
  writer.writeDouble(offsets[7], _valueInEther);
}

TransactionIsarModel _transactionIsarModelDeserializeNative(
    IsarCollection<TransactionIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TransactionIsarModel(
    addressFrom: reader.readStringOrNull(offsets[0]),
    addressTo: reader.readStringOrNull(offsets[1]),
    gasPrice: reader.readDoubleOrNull(offsets[2]),
    maxGas: reader.readLongOrNull(offsets[3]),
    status: reader.readLongOrNull(offsets[4]),
    timeStamp: reader.readDateTime(offsets[5]),
    transactionHash: reader.readStringOrNull(offsets[6]),
    valueInEther: reader.readDoubleOrNull(offsets[7]),
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
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _transactionIsarModelSerializeWeb(
    IsarCollection<TransactionIsarModel> collection,
    TransactionIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'addressFrom', object.addressFrom);
  IsarNative.jsObjectSet(jsObj, 'addressTo', object.addressTo);
  IsarNative.jsObjectSet(jsObj, 'gasPrice', object.gasPrice);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'maxGas', object.maxGas);
  IsarNative.jsObjectSet(jsObj, 'status', object.status);
  IsarNative.jsObjectSet(
      jsObj, 'timeStamp', object.timeStamp.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'transactionHash', object.transactionHash);
  IsarNative.jsObjectSet(jsObj, 'valueInEther', object.valueInEther);
  return jsObj;
}

TransactionIsarModel _transactionIsarModelDeserializeWeb(
    IsarCollection<TransactionIsarModel> collection, dynamic jsObj) {
  final object = TransactionIsarModel(
    addressFrom: IsarNative.jsObjectGet(jsObj, 'addressFrom'),
    addressTo: IsarNative.jsObjectGet(jsObj, 'addressTo'),
    gasPrice: IsarNative.jsObjectGet(jsObj, 'gasPrice'),
    maxGas: IsarNative.jsObjectGet(jsObj, 'maxGas'),
    status: IsarNative.jsObjectGet(jsObj, 'status'),
    timeStamp: IsarNative.jsObjectGet(jsObj, 'timeStamp') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'timeStamp'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
    transactionHash: IsarNative.jsObjectGet(jsObj, 'transactionHash'),
    valueInEther: IsarNative.jsObjectGet(jsObj, 'valueInEther'),
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _transactionIsarModelDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'addressFrom':
      return (IsarNative.jsObjectGet(jsObj, 'addressFrom')) as P;
    case 'addressTo':
      return (IsarNative.jsObjectGet(jsObj, 'addressTo')) as P;
    case 'gasPrice':
      return (IsarNative.jsObjectGet(jsObj, 'gasPrice')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'maxGas':
      return (IsarNative.jsObjectGet(jsObj, 'maxGas')) as P;
    case 'status':
      return (IsarNative.jsObjectGet(jsObj, 'status')) as P;
    case 'timeStamp':
      return (IsarNative.jsObjectGet(jsObj, 'timeStamp') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'timeStamp'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'transactionHash':
      return (IsarNative.jsObjectGet(jsObj, 'transactionHash')) as P;
    case 'valueInEther':
      return (IsarNative.jsObjectGet(jsObj, 'valueInEther')) as P;
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
      QAfterFilterCondition> addressFromIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'addressFrom',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressFromEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'addressFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressFromGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'addressFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressFromLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'addressFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressFromBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'addressFrom',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressFromStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'addressFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressFromEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'addressFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      addressFromContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'addressFrom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      addressFromMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'addressFrom',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'addressTo',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToGreaterThan(
    String? value, {
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToLessThan(
    String? value, {
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToStartsWith(
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> addressToEndsWith(
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

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      addressToContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'addressTo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
          QAfterFilterCondition>
      addressToMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'addressTo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

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
      QAfterFilterCondition> statusIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'status',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> statusEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'status',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> timeStampEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'timeStamp',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> timeStampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'timeStamp',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> timeStampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'timeStamp',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> timeStampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'timeStamp',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
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
      QAfterFilterCondition> valueInEtherIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'valueInEther',
      value: null,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> valueInEtherGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'valueInEther',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> valueInEtherLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'valueInEther',
      value: value,
    ));
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel,
      QAfterFilterCondition> valueInEtherBetween(double? lower, double? upper) {
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
      sortByAddressFrom() {
    return addSortByInternal('addressFrom', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByAddressFromDesc() {
    return addSortByInternal('addressFrom', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByAddressTo() {
    return addSortByInternal('addressTo', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByAddressToDesc() {
    return addSortByInternal('addressTo', Sort.desc);
  }

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
      sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByTimeStamp() {
    return addSortByInternal('timeStamp', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      sortByTimeStampDesc() {
    return addSortByInternal('timeStamp', Sort.desc);
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
      thenByAddressFrom() {
    return addSortByInternal('addressFrom', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByAddressFromDesc() {
    return addSortByInternal('addressFrom', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByAddressTo() {
    return addSortByInternal('addressTo', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByAddressToDesc() {
    return addSortByInternal('addressTo', Sort.desc);
  }

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
      thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByTimeStamp() {
    return addSortByInternal('timeStamp', Sort.asc);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QAfterSortBy>
      thenByTimeStampDesc() {
    return addSortByInternal('timeStamp', Sort.desc);
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
      distinctByAddressFrom({bool caseSensitive = true}) {
    return addDistinctByInternal('addressFrom', caseSensitive: caseSensitive);
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByAddressTo({bool caseSensitive = true}) {
    return addDistinctByInternal('addressTo', caseSensitive: caseSensitive);
  }

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
      distinctByStatus() {
    return addDistinctByInternal('status');
  }

  QueryBuilder<TransactionIsarModel, TransactionIsarModel, QDistinct>
      distinctByTimeStamp() {
    return addDistinctByInternal('timeStamp');
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
  QueryBuilder<TransactionIsarModel, String?, QQueryOperations>
      addressFromProperty() {
    return addPropertyNameInternal('addressFrom');
  }

  QueryBuilder<TransactionIsarModel, String?, QQueryOperations>
      addressToProperty() {
    return addPropertyNameInternal('addressTo');
  }

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

  QueryBuilder<TransactionIsarModel, int?, QQueryOperations> statusProperty() {
    return addPropertyNameInternal('status');
  }

  QueryBuilder<TransactionIsarModel, DateTime, QQueryOperations>
      timeStampProperty() {
    return addPropertyNameInternal('timeStamp');
  }

  QueryBuilder<TransactionIsarModel, String?, QQueryOperations>
      transactionHashProperty() {
    return addPropertyNameInternal('transactionHash');
  }

  QueryBuilder<TransactionIsarModel, double?, QQueryOperations>
      valueInEtherProperty() {
    return addPropertyNameInternal('valueInEther');
  }
}
