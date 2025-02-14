// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_price_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CryptoPriceHistory _$CryptoPriceHistoryFromJson(Map<String, dynamic> json) {
  return _CryptoPriceHistory.fromJson(json);
}

/// @nodoc
mixin _$CryptoPriceHistory {
  String get priceUsd => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  /// Serializes this CryptoPriceHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CryptoPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CryptoPriceHistoryCopyWith<CryptoPriceHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoPriceHistoryCopyWith<$Res> {
  factory $CryptoPriceHistoryCopyWith(
    CryptoPriceHistory value,
    $Res Function(CryptoPriceHistory) then,
  ) = _$CryptoPriceHistoryCopyWithImpl<$Res, CryptoPriceHistory>;
  @useResult
  $Res call({String priceUsd, int time});
}

/// @nodoc
class _$CryptoPriceHistoryCopyWithImpl<$Res, $Val extends CryptoPriceHistory>
    implements $CryptoPriceHistoryCopyWith<$Res> {
  _$CryptoPriceHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CryptoPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? priceUsd = null, Object? time = null}) {
    return _then(
      _value.copyWith(
            priceUsd:
                null == priceUsd
                    ? _value.priceUsd
                    : priceUsd // ignore: cast_nullable_to_non_nullable
                        as String,
            time:
                null == time
                    ? _value.time
                    : time // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CryptoPriceHistoryImplCopyWith<$Res>
    implements $CryptoPriceHistoryCopyWith<$Res> {
  factory _$$CryptoPriceHistoryImplCopyWith(
    _$CryptoPriceHistoryImpl value,
    $Res Function(_$CryptoPriceHistoryImpl) then,
  ) = __$$CryptoPriceHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String priceUsd, int time});
}

/// @nodoc
class __$$CryptoPriceHistoryImplCopyWithImpl<$Res>
    extends _$CryptoPriceHistoryCopyWithImpl<$Res, _$CryptoPriceHistoryImpl>
    implements _$$CryptoPriceHistoryImplCopyWith<$Res> {
  __$$CryptoPriceHistoryImplCopyWithImpl(
    _$CryptoPriceHistoryImpl _value,
    $Res Function(_$CryptoPriceHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CryptoPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? priceUsd = null, Object? time = null}) {
    return _then(
      _$CryptoPriceHistoryImpl(
        priceUsd:
            null == priceUsd
                ? _value.priceUsd
                : priceUsd // ignore: cast_nullable_to_non_nullable
                    as String,
        time:
            null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoPriceHistoryImpl implements _CryptoPriceHistory {
  const _$CryptoPriceHistoryImpl({required this.priceUsd, required this.time});

  factory _$CryptoPriceHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoPriceHistoryImplFromJson(json);

  @override
  final String priceUsd;
  @override
  final int time;

  @override
  String toString() {
    return 'CryptoPriceHistory(priceUsd: $priceUsd, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoPriceHistoryImpl &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, priceUsd, time);

  /// Create a copy of CryptoPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoPriceHistoryImplCopyWith<_$CryptoPriceHistoryImpl> get copyWith =>
      __$$CryptoPriceHistoryImplCopyWithImpl<_$CryptoPriceHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoPriceHistoryImplToJson(this);
  }
}

abstract class _CryptoPriceHistory implements CryptoPriceHistory {
  const factory _CryptoPriceHistory({
    required final String priceUsd,
    required final int time,
  }) = _$CryptoPriceHistoryImpl;

  factory _CryptoPriceHistory.fromJson(Map<String, dynamic> json) =
      _$CryptoPriceHistoryImpl.fromJson;

  @override
  String get priceUsd;
  @override
  int get time;

  /// Create a copy of CryptoPriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoPriceHistoryImplCopyWith<_$CryptoPriceHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
