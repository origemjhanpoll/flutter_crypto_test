import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_state.dart';

class CryptosCubit extends Cubit<CryptosState> {
  final IRepository _repository;
  StreamSubscription<Map<String, String>>? _priceSubscription;
  final StreamController<Map<String, String>> _priceController =
      StreamController.broadcast();

  CryptosCubit({required IRepository repository})
    : _repository = repository,
      super(CryptoInitial());

  Future<void> load({String? query}) async {
    emit(CryptoLoading());

    try {
      final cryptosResult = await _repository.searchCrypto(query ?? '');
      if (cryptosResult.isEmpty) {
        emit(CryptoEmpty());
      } else {
        emit(CryptoSuccess(cryptos: cryptosResult));
        _startPriceUpdates(cryptosResult.map((e) => e.id).toList());
      }
    } on HttpException catch (error) {
      emit(CryptoError(error.message));
    } catch (e) {
      emit(CryptoError('An unexpected error occurred: $e'));
    }
  }

  void _startPriceUpdates(List<String> ids) {
    _priceSubscription?.cancel();
    _priceSubscription = _repository.getPricesStream(ids).listen((prices) {
      _priceController.add(prices);
    });
  }

  Stream<Map<String, String>> get allPricesStream => _priceController.stream;

  @override
  Future<void> close() {
    _priceSubscription?.cancel();
    _priceController.close();
    return super.close();
  }
}
