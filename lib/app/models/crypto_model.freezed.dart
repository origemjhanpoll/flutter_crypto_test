// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) {
  return _CryptoModel.fromJson(json);
}

/// @nodoc
mixin _$CryptoModel {
  String get id => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get supply => throw _privateConstructorUsedError;
  String? get maxSupply => throw _privateConstructorUsedError;
  String get marketCapUsd => throw _privateConstructorUsedError;
  String get volumeUsd24Hr => throw _privateConstructorUsedError;
  String get priceUsd => throw _privateConstructorUsedError;
  String get changePercent24Hr => throw _privateConstructorUsedError;
  String? get vwap24Hr => throw _privateConstructorUsedError;

  /// Serializes this CryptoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CryptoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CryptoModelCopyWith<CryptoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoModelCopyWith<$Res> {
  factory $CryptoModelCopyWith(
    CryptoModel value,
    $Res Function(CryptoModel) then,
  ) = _$CryptoModelCopyWithImpl<$Res, CryptoModel>;
  @useResult
  $Res call({
    String id,
    String rank,
    String symbol,
    String name,
    String supply,
    String? maxSupply,
    String marketCapUsd,
    String volumeUsd24Hr,
    String priceUsd,
    String changePercent24Hr,
    String? vwap24Hr,
  });
}

/// @nodoc
class _$CryptoModelCopyWithImpl<$Res, $Val extends CryptoModel>
    implements $CryptoModelCopyWith<$Res> {
  _$CryptoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CryptoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rank = null,
    Object? symbol = null,
    Object? name = null,
    Object? supply = null,
    Object? maxSupply = freezed,
    Object? marketCapUsd = null,
    Object? volumeUsd24Hr = null,
    Object? priceUsd = null,
    Object? changePercent24Hr = null,
    Object? vwap24Hr = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            rank:
                null == rank
                    ? _value.rank
                    : rank // ignore: cast_nullable_to_non_nullable
                        as String,
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            supply:
                null == supply
                    ? _value.supply
                    : supply // ignore: cast_nullable_to_non_nullable
                        as String,
            maxSupply:
                freezed == maxSupply
                    ? _value.maxSupply
                    : maxSupply // ignore: cast_nullable_to_non_nullable
                        as String?,
            marketCapUsd:
                null == marketCapUsd
                    ? _value.marketCapUsd
                    : marketCapUsd // ignore: cast_nullable_to_non_nullable
                        as String,
            volumeUsd24Hr:
                null == volumeUsd24Hr
                    ? _value.volumeUsd24Hr
                    : volumeUsd24Hr // ignore: cast_nullable_to_non_nullable
                        as String,
            priceUsd:
                null == priceUsd
                    ? _value.priceUsd
                    : priceUsd // ignore: cast_nullable_to_non_nullable
                        as String,
            changePercent24Hr:
                null == changePercent24Hr
                    ? _value.changePercent24Hr
                    : changePercent24Hr // ignore: cast_nullable_to_non_nullable
                        as String,
            vwap24Hr:
                freezed == vwap24Hr
                    ? _value.vwap24Hr
                    : vwap24Hr // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CryptoModelImplCopyWith<$Res>
    implements $CryptoModelCopyWith<$Res> {
  factory _$$CryptoModelImplCopyWith(
    _$CryptoModelImpl value,
    $Res Function(_$CryptoModelImpl) then,
  ) = __$$CryptoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String rank,
    String symbol,
    String name,
    String supply,
    String? maxSupply,
    String marketCapUsd,
    String volumeUsd24Hr,
    String priceUsd,
    String changePercent24Hr,
    String? vwap24Hr,
  });
}

/// @nodoc
class __$$CryptoModelImplCopyWithImpl<$Res>
    extends _$CryptoModelCopyWithImpl<$Res, _$CryptoModelImpl>
    implements _$$CryptoModelImplCopyWith<$Res> {
  __$$CryptoModelImplCopyWithImpl(
    _$CryptoModelImpl _value,
    $Res Function(_$CryptoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CryptoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rank = null,
    Object? symbol = null,
    Object? name = null,
    Object? supply = null,
    Object? maxSupply = freezed,
    Object? marketCapUsd = null,
    Object? volumeUsd24Hr = null,
    Object? priceUsd = null,
    Object? changePercent24Hr = null,
    Object? vwap24Hr = freezed,
  }) {
    return _then(
      _$CryptoModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        rank:
            null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                    as String,
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        supply:
            null == supply
                ? _value.supply
                : supply // ignore: cast_nullable_to_non_nullable
                    as String,
        maxSupply:
            freezed == maxSupply
                ? _value.maxSupply
                : maxSupply // ignore: cast_nullable_to_non_nullable
                    as String?,
        marketCapUsd:
            null == marketCapUsd
                ? _value.marketCapUsd
                : marketCapUsd // ignore: cast_nullable_to_non_nullable
                    as String,
        volumeUsd24Hr:
            null == volumeUsd24Hr
                ? _value.volumeUsd24Hr
                : volumeUsd24Hr // ignore: cast_nullable_to_non_nullable
                    as String,
        priceUsd:
            null == priceUsd
                ? _value.priceUsd
                : priceUsd // ignore: cast_nullable_to_non_nullable
                    as String,
        changePercent24Hr:
            null == changePercent24Hr
                ? _value.changePercent24Hr
                : changePercent24Hr // ignore: cast_nullable_to_non_nullable
                    as String,
        vwap24Hr:
            freezed == vwap24Hr
                ? _value.vwap24Hr
                : vwap24Hr // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoModelImpl implements _CryptoModel {
  const _$CryptoModelImpl({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    this.vwap24Hr,
  });

  factory _$CryptoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String rank;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final String supply;
  @override
  final String? maxSupply;
  @override
  final String marketCapUsd;
  @override
  final String volumeUsd24Hr;
  @override
  final String priceUsd;
  @override
  final String changePercent24Hr;
  @override
  final String? vwap24Hr;

  @override
  String toString() {
    return 'CryptoModel(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.marketCapUsd, marketCapUsd) ||
                other.marketCapUsd == marketCapUsd) &&
            (identical(other.volumeUsd24Hr, volumeUsd24Hr) ||
                other.volumeUsd24Hr == volumeUsd24Hr) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.changePercent24Hr, changePercent24Hr) ||
                other.changePercent24Hr == changePercent24Hr) &&
            (identical(other.vwap24Hr, vwap24Hr) ||
                other.vwap24Hr == vwap24Hr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    rank,
    symbol,
    name,
    supply,
    maxSupply,
    marketCapUsd,
    volumeUsd24Hr,
    priceUsd,
    changePercent24Hr,
    vwap24Hr,
  );

  /// Create a copy of CryptoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoModelImplCopyWith<_$CryptoModelImpl> get copyWith =>
      __$$CryptoModelImplCopyWithImpl<_$CryptoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoModelImplToJson(this);
  }
}

abstract class _CryptoModel implements CryptoModel {
  const factory _CryptoModel({
    required final String id,
    required final String rank,
    required final String symbol,
    required final String name,
    required final String supply,
    final String? maxSupply,
    required final String marketCapUsd,
    required final String volumeUsd24Hr,
    required final String priceUsd,
    required final String changePercent24Hr,
    final String? vwap24Hr,
  }) = _$CryptoModelImpl;

  factory _CryptoModel.fromJson(Map<String, dynamic> json) =
      _$CryptoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get rank;
  @override
  String get symbol;
  @override
  String get name;
  @override
  String get supply;
  @override
  String? get maxSupply;
  @override
  String get marketCapUsd;
  @override
  String get volumeUsd24Hr;
  @override
  String get priceUsd;
  @override
  String get changePercent24Hr;
  @override
  String? get vwap24Hr;

  /// Create a copy of CryptoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoModelImplCopyWith<_$CryptoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
