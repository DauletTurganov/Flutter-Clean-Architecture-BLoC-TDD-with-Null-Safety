import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/either.dart';
import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure ,Type >> call(Params params);
}