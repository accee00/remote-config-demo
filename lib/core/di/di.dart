import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_demo/data/data/remote_config_data_source.dart';
import 'package:remote_config_demo/data/repository/remote_config_repoimpl.dart';
import 'package:remote_config_demo/domain/repository/remote_config_repo.dart';
import 'package:remote_config_demo/domain/usecase/get_val_usecase.dart';
import 'package:remote_config_demo/domain/usecase/intialise.dart';
import 'package:remote_config_demo/presentation/bloc/bloc/remote_config_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<RemoteConfigDataSource>(
    () =>
        RemoteConfigDataSourceImpl(remoteConfig: FirebaseRemoteConfig.instance),
  );
  getIt.registerLazySingleton<RemoteConfigRepo>(
    () => RemoteConfigRepoimpl(
      remoteConfigDataSource: getIt<RemoteConfigDataSource>(),
    ),
  );
  getIt.registerFactory<GetStringValueUseCase>(
    () => GetStringValueUseCase(getIt<RemoteConfigRepo>()),
  );
  getIt.registerFactory<Intialise>(() => Intialise(getIt<RemoteConfigRepo>()));
  getIt.registerFactory(
    () => RemoteConfigBloc(getIt<GetStringValueUseCase>(), getIt<Intialise>()),
  );
}
