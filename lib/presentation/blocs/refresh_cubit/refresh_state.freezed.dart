// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'refresh_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RefreshState {
  bool get refreshHomePage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RefreshStateCopyWith<RefreshState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshStateCopyWith<$Res> {
  factory $RefreshStateCopyWith(
          RefreshState value, $Res Function(RefreshState) then) =
      _$RefreshStateCopyWithImpl<$Res>;
  $Res call({bool refreshHomePage});
}

/// @nodoc
class _$RefreshStateCopyWithImpl<$Res> implements $RefreshStateCopyWith<$Res> {
  _$RefreshStateCopyWithImpl(this._value, this._then);

  final RefreshState _value;
  // ignore: unused_field
  final $Res Function(RefreshState) _then;

  @override
  $Res call({
    Object? refreshHomePage = freezed,
  }) {
    return _then(_value.copyWith(
      refreshHomePage: refreshHomePage == freezed
          ? _value.refreshHomePage
          : refreshHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RefreshStateCopyWith<$Res>
    implements $RefreshStateCopyWith<$Res> {
  factory _$$_RefreshStateCopyWith(
          _$_RefreshState value, $Res Function(_$_RefreshState) then) =
      __$$_RefreshStateCopyWithImpl<$Res>;
  @override
  $Res call({bool refreshHomePage});
}

/// @nodoc
class __$$_RefreshStateCopyWithImpl<$Res>
    extends _$RefreshStateCopyWithImpl<$Res>
    implements _$$_RefreshStateCopyWith<$Res> {
  __$$_RefreshStateCopyWithImpl(
      _$_RefreshState _value, $Res Function(_$_RefreshState) _then)
      : super(_value, (v) => _then(v as _$_RefreshState));

  @override
  _$_RefreshState get _value => super._value as _$_RefreshState;

  @override
  $Res call({
    Object? refreshHomePage = freezed,
  }) {
    return _then(_$_RefreshState(
      refreshHomePage: refreshHomePage == freezed
          ? _value.refreshHomePage
          : refreshHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RefreshState with DiagnosticableTreeMixin implements _RefreshState {
  const _$_RefreshState({this.refreshHomePage = false});

  @override
  @JsonKey()
  final bool refreshHomePage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RefreshState(refreshHomePage: $refreshHomePage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RefreshState'))
      ..add(DiagnosticsProperty('refreshHomePage', refreshHomePage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshState &&
            const DeepCollectionEquality()
                .equals(other.refreshHomePage, refreshHomePage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(refreshHomePage));

  @JsonKey(ignore: true)
  @override
  _$$_RefreshStateCopyWith<_$_RefreshState> get copyWith =>
      __$$_RefreshStateCopyWithImpl<_$_RefreshState>(this, _$identity);
}

abstract class _RefreshState implements RefreshState {
  const factory _RefreshState({final bool refreshHomePage}) = _$_RefreshState;

  @override
  bool get refreshHomePage;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshStateCopyWith<_$_RefreshState> get copyWith =>
      throw _privateConstructorUsedError;
}
