import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_model.freezed.dart';
part 'crypto_model.g.dart';

@freezed
class CryptoModel with _$CryptoModel {
  const factory CryptoModel({
    required String id,
    required String rank,
    required String symbol,
    required String name,
    String? supply,
    String? maxSupply,
    String? marketCapUsd,
    String? volumeUsd24Hr,
    String? priceUsd,
    String? changePercent24Hr,
    String? vwap24Hr,
  }) = _CryptoModel;

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);
}
