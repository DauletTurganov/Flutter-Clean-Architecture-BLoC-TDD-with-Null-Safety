import 'dart:convert';

import 'package:rickandmorty/core/error/exception.dart';
import 'package:rickandmorty/features/rickandmorty/data/models/person/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>>getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

class PersonLocalDataSourceImpl implements PersonLocalDataSource{
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<PersonModel>> getLastPersonsFromCache() async{
    final jsonPersonList =  sharedPreferences.getStringList('CACHED_PERSON_LIST');
    if (jsonPersonList != null) {
      return Future.value(jsonPersonList.map((e) => PersonModel.fromJson(json.decode(e))).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonList = persons.map((person) => json.encode(person.toJson())).toList();
    // TODO: implement personsToCache
    sharedPreferences.setStringList('CACHED_PERSON_LIST', jsonPersonList);
    return Future.value(jsonPersonList);
  }

}