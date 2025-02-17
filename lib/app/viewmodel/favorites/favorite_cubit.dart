import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/viewmodel/favorites/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final IRepository _repository;

  FavoriteCubit({required IRepository repository})
    : _repository = repository,
      super(FavoriteInitial());

  Future<void> load() async {
    emit(FavoriteLoading());

    try {
      final result = await _repository.getFavorites();
      if (result.isEmpty) {
        emit(FavoriteEmpty());
      } else {
        emit(FavoriteSuccess(favorites: result));
      }
    } on HttpException catch (error) {
      emit(FavoriteError(error.message));
    } catch (e) {
      emit(FavoriteError('An unexpected error occurred: $e'));
    }
  }

  save(CryptoModel asset) async {
    try {
      await _repository.saveFavorite(asset);

      final result = await _repository.getFavorites();

      emit(FavoriteSuccess(favorites: result));
    } catch (e) {
      emit(FavoriteError('An unexpected error occurred: $e'));
    }
  }

  remove(CryptoModel asset) async {
    try {
      await _repository.removeFavorite(asset.id);
      final result = await _repository.getFavorites();

      emit(FavoriteSuccess(favorites: result));
    } catch (e) {
      emit(FavoriteError('An unexpected error occurred: $e'));
    }
  }
}
