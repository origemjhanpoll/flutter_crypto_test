import 'package:equatable/equatable.dart';
import 'package:flutter_crypto_test/app/models/crypto_markets_model.dart';

abstract class MarketsState extends Equatable {
  const MarketsState();

  @override
  List<Object?> get props => [];
}

class MarketInitial extends MarketsState {}

class MarketLoading extends MarketsState {}

class MarketEmpty extends MarketsState {}

class MarketSuccess extends MarketsState {
  final List<CryptoMarketsModel> markets;
  const MarketSuccess({required this.markets});

  @override
  List<Object?> get props => [markets];
}

class MarketError extends MarketsState {
  final String message;
  const MarketError(this.message);

  @override
  List<Object?> get props => [message];
}
