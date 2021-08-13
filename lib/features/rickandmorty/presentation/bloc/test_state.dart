part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}

class TestScreenLoaded extends TestState {
  List<PersonEntity>? persons;
  TestScreenLoaded({this.persons});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class TestScreenLoading extends TestState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class TestScreenError extends TestState {
  String? message;
  TestScreenError({this.message});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
