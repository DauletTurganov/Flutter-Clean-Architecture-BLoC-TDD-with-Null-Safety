import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/rickandmorty/data/usecase.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/repository/person_repository.dart';

class GetAllPersons extends UseCase<List<PersonEntity>, AllPersonParams> {
  final PersonRepository? repository;

  GetAllPersons({this.repository});


  Future<Either<Failure, List<PersonEntity>>> call(AllPersonParams params) async {
    return await repository!.getAllPersons(page: params.page);
  }

}

class AllPersonParams extends Equatable{
  final int? page;

  AllPersonParams(this.page);

  @override
  // TODO: implement props
  List<Object?> get props => [page];
}