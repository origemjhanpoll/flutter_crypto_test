import 'package:equatable/equatable.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';

abstract class CryptosState extends Equatable {
  const CryptosState();

  @override
  List<Object?> get props => [];
}

class CryptoInitial extends CryptosState {}

class CryptoLoading extends CryptosState {}

class CryptoEmpty extends CryptosState {}

class CryptoSuccess extends CryptosState {
  final List<CryptoModel> cryptos;
  const CryptoSuccess({required this.cryptos});

  @override
  List<Object?> get props => [cryptos];
}

class CryptoUpdatePrice extends CryptosState {
  final Map<String, dynamic> price;
  const CryptoUpdatePrice({required this.price});

  @override
  List<Object?> get props => [price];
}

class CryptoError extends CryptosState {
  final String message;
  const CryptoError(this.message);

  @override
  List<Object?> get props => [message];
}
