// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_markets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoMarketsModelImpl _$$CryptoMarketsModelImplFromJson(
  Map<String, dynamic> json,
) => _$CryptoMarketsModelImpl(
  exchangeId: json['exchangeId'] as String,
  baseId: json['baseId'] as String,
  quoteId: json['quoteId'] as String,
  baseSymbol: json['baseSymbol'] as String,
  quoteSymbol: json['quoteSymbol'] as String,
  volumeUsd24Hr: json['volumeUsd24Hr'] as String,
  priceUsd: json['priceUsd'] as String,
  volumePercent: json['volumePercent'] as String,
);

Map<String, dynamic> _$$CryptoMarketsModelImplToJson(
  _$CryptoMarketsModelImpl instance,
) => <String, dynamic>{
  'exchangeId': instance.exchangeId,
  'baseId': instance.baseId,
  'quoteId': instance.quoteId,
  'baseSymbol': instance.baseSymbol,
  'quoteSymbol': instance.quoteSymbol,
  'volumeUsd24Hr': instance.volumeUsd24Hr,
  'priceUsd': instance.priceUsd,
  'volumePercent': instance.volumePercent,
};
