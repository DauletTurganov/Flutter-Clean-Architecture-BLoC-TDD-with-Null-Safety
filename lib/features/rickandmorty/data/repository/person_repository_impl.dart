import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/core/network/network_info.dart';
import 'package:rickandmorty/features/rickandmorty/data/datasource/person_remote_data_source.dart';
import 'package:rickandmorty/features/rickandmorty/data/models/person/person_model.dart';
import 'package:rickandmorty/features/rickandmorty/data/repository/person_local_data_source.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository{
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl( {required this.remoteDataSource,required this.networkInfo, required this.localDataSource});

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons({int? page}) {
    // TODO: implement getAllPersons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PersonModel>>> getPerson({int? query}) async{
    if (await networkInfo.isConnected) {
      try{
        final remotePerson = await remoteDataSource.getPerson(query);
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson.toList());
      } on ServerException {
        return Left(ServerFailure(message: 'OSHIBKA EBANAYA'));
      }

    } else {
      try{
        final locationPerson = await localDataSource.getLastPersonsFromCache();
        return  Right(locationPerson);
      }on CacheException {
        return Left(CacheFailure());
      }
    }
  }
  
}