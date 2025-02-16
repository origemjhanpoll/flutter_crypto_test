import 'package:equatable/equatable.dart';

class PriceState extends Equatable {
  final Map<String, double> previousPrices;
  final Map<String, double> currentPrices;

  const PriceState({required this.previousPrices, required this.currentPrices});

  @override
  List<Object> get props => [previousPrices, currentPrices];
}
