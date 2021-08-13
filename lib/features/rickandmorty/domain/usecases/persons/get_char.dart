
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/rickandmorty/data/usecase.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/repository/person_repository.dart';

class GetPersonsUseCase extends UseCase<List<PersonEntity>, PersonPageParams>{
  final PersonRepository repository;

  GetPersonsUseCase({required this.repository});


  Future<Either<Failure, List<PersonEntity>>> call(
      PersonPageParams params) async => await repository.getPerson(query: params.query);

}

class PersonPageParams extends Equatable {
  final int? query;

  PersonPageParams({this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}
