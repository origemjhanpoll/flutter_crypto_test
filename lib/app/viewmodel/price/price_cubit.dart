import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';

class PriceCubit extends Cubit<Map<String, String>> {
  final IRepository _repository;
  StreamSubscription<Map<String, String>>? _priceSubscription;

  PriceCubit({required IRepository repository})
    : _repository = repository,
      super({});

  void startPriceUpdates({List<String>? ids}) {
    _priceSubscription?.cancel();
    _priceSubscription = _repository.getPricesStream(ids ?? []).listen((
      prices,
    ) {
      emit(prices);
    });
  }

  @override
  Future<void> close() {
    _priceSubscription?.cancel();
    return super.close();
  }
}
