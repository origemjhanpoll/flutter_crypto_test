import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/viewmodel/history/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final IRepository _repository;

  HistoryCubit({required IRepository repository})
    : _repository = repository,
      super(HistoryInitial());

  Future<void> load({required String id, required String interval}) async {
    emit(HistoryLoading());

    try {
      final historysResult = await _repository.getHistory(
        id: id,
        interval: interval,
      );
      if (historysResult.isEmpty) {
        emit(HistoryEmpty());
      } else {
        emit(HistorySuccess(historys: historysResult));
      }
    } on HttpException catch (error) {
      emit(HistoryError(error.message));
    } catch (e) {
      emit(HistoryError('An unexpected error occurred: $e'));
    }
  }
}
