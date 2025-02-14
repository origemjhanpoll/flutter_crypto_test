import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_markets_model.freezed.dart';
part 'crypto_markets_model.g.dart';

@freezed
class CryptoMarketsModel with _$CryptoMarketsModel {
  const factory CryptoMarketsModel({
    required String exchangeId,
    required String baseId,
    required String quoteId,
    required String baseSymbol,
    required String quoteSymbol,
    required String volumeUsd24Hr,
    required String priceUsd,
    required String volumePercent,
  }) = _CryptoMarketsModel;

  factory CryptoMarketsModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketsModelFromJson(json);
}
