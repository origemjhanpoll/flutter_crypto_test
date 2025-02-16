import 'package:intl/intl.dart';

String formatPrice(double value) {
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
