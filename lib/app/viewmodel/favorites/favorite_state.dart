import 'package:equatable/equatable.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteEmpty extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<CryptoModel> favorites;
  const FavoriteSuccess({required this.favorites});

  @override
  List<Object?> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
