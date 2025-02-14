// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_price_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoPriceHistoryImpl _$$CryptoPriceHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$CryptoPriceHistoryImpl(
  priceUsd: json['priceUsd'] as String,
  time: (json['time'] as num).toInt(),
);

Map<String, dynamic> _$$CryptoPriceHistoryImplToJson(
  _$CryptoPriceHistoryImpl instance,
) => <String, dynamic>{'priceUsd': instance.priceUsd, 'time': instance.time};
