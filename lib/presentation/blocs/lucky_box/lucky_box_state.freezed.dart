// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lucky_box_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LuckyBoxState {
  List<LuckyBoxEntity> get luckyBoxes => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<LuckyBoxEntity> luckyBoxes, String? errorMessage)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<LuckyBoxEntity> luckyBoxes, String? errorMessage)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LuckyBoxEntity> luckyBoxes, String? errorMessage)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LuckyBoxState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LuckyBoxState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LuckyBoxState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LuckyBoxStateCopyWith<LuckyBoxState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LuckyBoxStateCopyWith<$Res> {
  factory $LuckyBoxStateCopyWith(
          LuckyBoxState value, $Res Function(LuckyBoxState) then) =
      _$LuckyBoxStateCopyWithImpl<$Res>;
  $Res call({List<LuckyBoxEntity> luckyBoxes, String? errorMessage});
}

/// @nodoc
class _$LuckyBoxStateCopyWithImpl<$Res>
    implements $LuckyBoxStateCopyWith<$Res> {
  _$LuckyBoxStateCopyWithImpl(this._value, this._then);

  final LuckyBoxState _value;
  // ignore: unused_field
  final $Res Function(LuckyBoxState) _then;

  @override
  $Res call({
    Object? luckyBoxes = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      luckyBoxes: luckyBoxes == freezed
          ? _value.luckyBoxes
          : luckyBoxes // ignore: cast_nullable_to_non_nullable
              as List<LuckyBoxEntity>,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LuckyBoxStateCopyWith<$Res>
    implements $LuckyBoxStateCopyWith<$Res> {
  factory _$$_LuckyBoxStateCopyWith(
          _$_LuckyBoxState value, $Res Function(_$_LuckyBoxState) then) =
      __$$_LuckyBoxStateCopyWithImpl<$Res>;
  @override
  $Res call({List<LuckyBoxEntity> luckyBoxes, String? errorMessage});
}

/// @nodoc
class __$$_LuckyBoxStateCopyWithImpl<$Res>
    extends _$LuckyBoxStateCopyWithImpl<$Res>
    implements _$$_LuckyBoxStateCopyWith<$Res> {
  __$$_LuckyBoxStateCopyWithImpl(
      _$_LuckyBoxState _value, $Res Function(_$_LuckyBoxState) _then)
      : super(_value, (v) => _then(v as _$_LuckyBoxState));

  @override
  _$_LuckyBoxState get _value => super._value as _$_LuckyBoxState;

  @override
  $Res call({
    Object? luckyBoxes = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_LuckyBoxState(
      luckyBoxes: luckyBoxes == freezed
          ? _value._luckyBoxes
          : luckyBoxes // ignore: cast_nullable_to_non_nullable
              as List<LuckyBoxEntity>,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LuckyBoxState implements _LuckyBoxState {
  const _$_LuckyBoxState(
      {final List<LuckyBoxEntity> luckyBoxes = const [], this.errorMessage})
      : _luckyBoxes = luckyBoxes;

  final List<LuckyBoxEntity> _luckyBoxes;
  @override
  @JsonKey()
  List<LuckyBoxEntity> get luckyBoxes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_luckyBoxes);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LuckyBoxState.loaded(luckyBoxes: $luckyBoxes, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LuckyBoxState &&
            const DeepCollectionEquality()
                .equals(other._luckyBoxes, _luckyBoxes) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_luckyBoxes),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_LuckyBoxStateCopyWith<_$_LuckyBoxState> get copyWith =>
      __$$_LuckyBoxStateCopyWithImpl<_$_LuckyBoxState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<LuckyBoxEntity> luckyBoxes, String? errorMessage)
        loaded,
  }) {
    return loaded(luckyBoxes, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<LuckyBoxEntity> luckyBoxes, String? errorMessage)?
        loaded,
  }) {
    return loaded?.call(luckyBoxes, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LuckyBoxEntity> luckyBoxes, String? errorMessage)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(luckyBoxes, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LuckyBoxState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LuckyBoxState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LuckyBoxState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LuckyBoxState implements LuckyBoxState {
  const factory _LuckyBoxState(
      {final List<LuckyBoxEntity> luckyBoxes,
      final String? errorMessage}) = _$_LuckyBoxState;

  @override
  List<LuckyBoxEntity> get luckyBoxes;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LuckyBoxStateCopyWith<_$_LuckyBoxState> get copyWith =>
      throw _privateConstructorUsedError;
}
