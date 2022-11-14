import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// [init]
  ///component primay like [storage] and [environment]
  // final config = EnvConfig.getInstance();
  final prefs = await SharedPreferences.getInstance();

  // sl.registerLazySingleton(() => prefs);

  // /// [flavor]
  // /// implementation flavor with different [environment] both ios and android
  // sl.registerLazySingleton(() => config);

  // //! Features - Auth
  // // Bloc
  // sl.registerFactory(() => AuthBloc(sl()));

  // // Use cases
  // sl.registerLazySingleton(() => LoginUsecase(sl()));

  // // Repository
  // sl.registerLazySingleton<AuthRepository>(
  //     () => AuthRepositoryImpl(sl(), sl()));

  // // Data sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //     () => AuthRemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //     () => AuthLocalDataSourceImpl(sl()));

  // // Network
  // sl.registerLazySingleton(() => sl<HttpClient>().dio);
  // sl.registerLazySingleton(() => HttpClient(config: sl(), preferences: sl()));

  // sl.registerLazySingleton(() => NotificationService());

  //! External
}
