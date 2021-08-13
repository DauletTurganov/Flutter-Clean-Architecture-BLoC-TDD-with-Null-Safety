
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/rickandmorty/data/models/person/person_model.dart';
import 'package:rickandmorty/features/rickandmorty/data/repository/person_repository_impl.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/repository/person_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/get_char.dart';

import 'get_char_test.mocks.dart';



// class MockPersonRepository extends Mock implements
// PersonRepository{
// }
@GenerateMocks([PersonRepository])
void main() {


  MockPersonRepository? mockPersonRepository = MockPersonRepository();
  GetPersonsUseCase? usecase = GetPersonsUseCase(repository: mockPersonRepository);

final tNumber = 1;

final tPerson =
PersonEntity(
  id: 1,
  name: 'Rick',
  status: 'Alive',
  species: 'Human',
  type: null,
  gender: 'Male',
  origin: null,
  location: null,
  image: '',
  episode: [],
  url: '',
  created: null
);
  final tPersons = [tPerson];

test('Should return person Entity', () async{
  // usecase = GetPersonsUseCase(repository: mockPersonRepository);
  // mockPersonRepository = MockPersonRepository();
  print('123');
  print(tPersons);
  when(mockPersonRepository.getPerson(query: 1)).thenAnswer((asd) async {
    // print(Right(tPersons));
    return Right(tPersons);
  });
  // final result = Right(tPersons);
  final result = await usecase.call(PersonPageParams(query: 1));
  // print(result);
  // expect(actual, matcher)
  expect(result, Right(tPersons));


  verify(mockPersonRepository.getPerson(query: 1));
  verifyNoMoreInteractions(mockPersonRepository);
});

}
