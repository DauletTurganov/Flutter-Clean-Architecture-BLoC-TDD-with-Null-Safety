part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}

class GoTestScreen extends TestEvent {


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoadPerson extends TestEvent {

  int? personQuery;

  LoadPerson({required this.personQuery});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
