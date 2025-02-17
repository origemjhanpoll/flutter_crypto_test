import 'package:equatable/equatable.dart';
import 'package:flutter_crypto_test/app/models/crypto_price_history.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryEmpty extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<CryptoPriceHistory> historys;
  const HistorySuccess({required this.historys});

  @override
  List<Object?> get props => [historys];
}

class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
