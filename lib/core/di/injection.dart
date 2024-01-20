import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../extensions/dialog_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> registerDependncies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);

  getIt.registerLazySingleton<DialogService>(() => DialogService());

  //New dependencies here
  getIt.registerLazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(
          sharedPreferences: getIt(), appDatabase: getIt()));
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authLocalDataSource: getIt(), authRemoteDataSource: getIt()));
}
