import 'package:intl/intl.dart';

String formatMultPrices(double value) {
  if (value >= 1000) {
    return NumberFormat("#,##0.000", "en_US").format(value);
  } else if (value < 1) {
    return value
        .toStringAsFixed(8)
        .replaceAll(RegExp(r'0+$'), '')
        .replaceAll(RegExp(r'\.$'), '');
  } else {
    return value.toStringAsFixed(2);
  }
}

String formatPrice(double value) {
  return NumberFormat("#,###", "en_US").format(value);
}

String formatVolumeUsd(double value) {
  if (value >= 1e9) {
    return "\$${(value / 1e9).toStringAsFixed(0)}b";
  } else if (value >= 1e6) {
    return "\$${(value / 1e6).toStringAsFixed(0)}m";
  } else if (value >= 1e3) {
    return "\$${(value / 1e3).toStringAsFixed(0)}k";
  } else {
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(value);
  }
}
