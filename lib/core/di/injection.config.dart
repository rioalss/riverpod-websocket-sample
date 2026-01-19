// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasources/coinbase_datasource.dart' as _i50;
import '../../data/datasources/coinbase_datasource_impl.dart' as _i954;
import '../../data/repositories/coinbase_repositories_impl.dart' as _i786;
import '../../domain/repositories/coinbase_repositories.dart' as _i45;
import '../../domain/usecase/get_coinbase_status_usecase.dart' as _i47;
import '../../domain/usecase/get_coinbase_ticker_usecase.dart' as _i164;
import '../service/network/websocket_service.dart' as _i476;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i476.WebsocketService>(() => _i476.WebsocketService());
    gh.lazySingleton<_i50.CoinbaseDatasource>(
        () => _i954.CoinbaseDatasourceImpl(gh<_i476.WebsocketService>()));
    gh.lazySingleton<_i45.CoinbaseRepositories>(
        () => _i786.CoinbaseRepositoriesImpl(gh<_i50.CoinbaseDatasource>()));
    gh.lazySingleton<_i47.GetCoinbaseStatusUsecase>(
        () => _i47.GetCoinbaseStatusUsecase(gh<_i45.CoinbaseRepositories>()));
    gh.lazySingleton<_i164.GetCoinbaseTickerUsecase>(
        () => _i164.GetCoinbaseTickerUsecase(gh<_i45.CoinbaseRepositories>()));
    return this;
  }
}
