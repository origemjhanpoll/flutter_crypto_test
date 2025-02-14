import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_price_history.freezed.dart';
part 'crypto_price_history.g.dart';

@freezed
class CryptoPriceHistory with _$CryptoPriceHistory {
  const factory CryptoPriceHistory({
    required String priceUsd,
    required int time,
  }) = _CryptoPriceHistory;

  factory CryptoPriceHistory.fromJson(Map<String, dynamic> json) =>
      _$CryptoPriceHistoryFromJson(json);
}
