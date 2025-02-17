import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/viewmodel/markets/markets_state.dart';

class MarketsCubit extends Cubit<MarketsState> {
  final IRepository _repository;

  MarketsCubit({required IRepository repository})
    : _repository = repository,
      super(MarketInitial());

  Future<void> load(String id) async {
    emit(MarketLoading());

    try {
      final marketsResult = await _repository.getAssetMarket(id);
      if (marketsResult.isEmpty) {
        emit(MarketEmpty());
      } else {
        emit(MarketSuccess(markets: marketsResult));
      }
    } on HttpException catch (error) {
      emit(MarketError(error.message));
    } catch (e) {
      emit(MarketError('An unexpected error occurred: $e'));
    }
  }
}
