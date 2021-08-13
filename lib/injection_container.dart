
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/core/network/network_info.dart';
import 'package:rickandmorty/core/network/rest_client_service.dart';
import 'package:rickandmorty/features/rickandmorty/data/datasource/person_remote_data_source.dart';
import 'package:rickandmorty/features/rickandmorty/data/repository/person_local_data_source.dart';
import 'package:rickandmorty/features/rickandmorty/data/repository/person_repository_impl.dart';
import 'package:rickandmorty/features/rickandmorty/domain/repository/person_repository.dart';
import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/getAllChars.dart';
import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/get_char.dart';
import 'package:rickandmorty/features/rickandmorty/presentation/bloc/test_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async{

  final client = Dio();
  sl.registerLazySingleton(() => RestClientService(client));

  final sharedPrefernces = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefernces);
  sl.registerLazySingleton(() => Connectivity());


  sl.registerLazySingleton(() => GetAllPersons());
  sl.registerLazySingleton(() => GetPersonsUseCase(repository: sl()));

  sl.registerLazySingleton<PersonRepository>(() =>
      PersonRepositoryImpl(remoteDataSource: sl(),
          networkInfo: sl(),
          localDataSource: sl()));


  sl.registerLazySingleton<PersonRemoteDataSource>(() =>
      PersonRemoteDataSourceImpl(restClientService: RestClientService(client)));

  sl.registerLazySingleton<PersonLocalDataSource>(() =>
      PersonLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(connectivity: sl()));
  




  sl.registerFactory(() =>
      TestBloc(getPersonsUseCase: sl()));



}