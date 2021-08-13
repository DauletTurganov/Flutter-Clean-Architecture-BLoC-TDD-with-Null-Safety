import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/core/misc/constants.dart';
import 'package:rickandmorty/core/network/base_model.dart';
import 'package:rickandmorty/core/network/rest_client_service.dart';
import 'package:rickandmorty/features/rickandmorty/data/models/person/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int? page);
  Future<List<PersonModel>> getPerson(int? query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {

  final RestClientService restClientService;

  PersonRemoteDataSourceImpl({required this.restClientService});


  @override
  Future<List<PersonModel>> getPerson(int? query) async{
    final response = await restClientService.get(baseUrl + '/character/2');
    if (response.statusCode != 200) {
      throw ServerException(message: 'Network error');
    } else {
      print(response.data);
      final data = PersonModel.fromJson(response.data);
      final newList = [data];
      // final baseModel =  BaseModel.fromJson(response.data);
      // print(baseModel);
      // print(baseModel.result);
      // if (!baseModel.status) {
      //   throw ServerException(message: baseModel.message ?? 'Network error');
      // }
      return newList;
    }

  }

  @override
  Future<List<PersonModel>> getAllPersons(int? page) {
    // TODO: implement getAllPersons
    throw UnimplementedError();
  }


  
}