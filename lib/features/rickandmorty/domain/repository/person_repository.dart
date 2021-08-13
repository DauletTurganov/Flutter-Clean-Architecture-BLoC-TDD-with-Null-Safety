
import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/get_char.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>>getPerson({int? query});
  Future<Either<Failure, List<PersonEntity>>>getAllPersons({int? page, });
}