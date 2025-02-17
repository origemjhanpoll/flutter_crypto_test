import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/repositories/repository.dart';
import 'package:flutter_crypto_test/app/services/api_service.dart';
import 'package:flutter_crypto_test/app/services/local_service.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/history/history_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/markets/markets_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/price/price_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton<http.Client>(() => http.Client());
  di.registerLazySingleton<ApiService>(() => ApiService(http.Client()));
  di.registerLazySingleton<LocalService>(() => LocalService());
  di.registerLazySingleton<IRepository>(
    () => Repository(
      apiService: di<ApiService>(),
      localService: di<LocalService>(),
    ),
  );
  di.registerFactory<CryptosCubit>(
    () => CryptosCubit(repository: di<IRepository>()),
  );
  di.registerFactory<PriceCubit>(
    () => PriceCubit(repository: di<IRepository>()),
  );
  di.registerFactory<HistoryCubit>(
    () => HistoryCubit(repository: di<IRepository>()),
  );
  di.registerFactory<MarketsCubit>(
    () => MarketsCubit(repository: di<IRepository>()),
  );
}
