

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/get_char.dart';
import 'package:rickandmorty/features/rickandmorty/presentation/bloc/test_bloc.dart';

class MockUseCase extends Mock implements GetPersonsUseCase{}


void main() {

  TestBloc? testBloc;
  MockUseCase? mockUseCase;

  setUp(() {
    mockUseCase = MockUseCase();
    testBloc = TestBloc(getPersonsUseCase: mockUseCase!);
  });

  group('initialState', () {
    test('should return some state', ()async {
      expect(testBloc!.state, equals(TestInitial()));
    });
  });


  group('map event to state', () {

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
    final tList = [tPerson];

    test('should return right state', () async {
      when(mockUseCase!.call(PersonPageParams(query: 1)))
          .thenAnswer((realInvocation) async => Right(tList));
      expectLater(testBloc, emitsInOrder([
        TestInitial(),
        TestScreenLoading(),
        TestScreenLoaded()
      ]));

    });

  });
}