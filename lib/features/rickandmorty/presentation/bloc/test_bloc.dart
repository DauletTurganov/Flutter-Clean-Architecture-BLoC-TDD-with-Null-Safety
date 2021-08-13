import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';
import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/get_char.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc({required this.getPersonsUseCase}) : super(TestInitial());

  final GetPersonsUseCase getPersonsUseCase;

  @override
  Stream<TestState> mapEventToState(
    TestEvent event,
  ) async* {
    if (event is LoadPerson) {
    yield* _mapPersonSearch(query: event.personQuery);
    }
    // TODO: implement mapEventToState
  }


  Stream<TestState> _mapPersonSearch({int? query}) async* {
    yield TestScreenLoading();
    final failureOrPerson = await getPersonsUseCase(PersonPageParams(query: query));
    // print(failureOrPerson);

  //   if (failureOrPerson.isLeft) {
  //     yield TestScreenError(message: '${failureOrPerson.left}');
  //   } else if (failureOrPerson.isRight) {
  //     print(failureOrPerson.right);
  //     yield TestScreenLoaded(persons: failureOrPerson.right);
  //   }
  }
}
