
import 'package:rickandmorty/features/rickandmorty/domain/enitities/person_enitity.dart';

class PersonModel extends PersonEntity {
  PersonModel({
    required int? id,
    required String? name,
    required String? status,
    required String? species,
    required String? type,
    required String? gender,
    required OriginEntity? origin,
    required LocationEntity? location,
    required String? image,
    required List<String>? episode,
    required String? url,
    required String? created,}

  ) : super(
    id: id,
    name: name,
    status: status,
    species: species,
    type: type,
    gender: gender,
    origin: origin,
    location: location,
    image: image,
    episode: episode,
    url: url,
    created: created
  );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: json['origin'] != null ? OriginModel.fromJson(json['origin']) : null,
        location: json['origin'] != null ? LocationModel.fromJson(json['location']) : null,
        image: json['image'],
        episode: (json['episode'] as List<dynamic>).map((e) => e as String ).toList(),
        url: json['url'],
        created: json['created'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'status' : status,
      'species' : species,
      'type' : type,
      'gender' : gender,
      'origin' : origin,
      'location' : location,
      'image' : image,
      'episode' : episode,
      'url' : url,
      'created' : created,
    };
  }
}

class OriginModel extends OriginEntity{
  OriginModel({
    required String? name,
    required String? url,
}) : super(name: name, url: url);

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(name: json['name'], url: json['url']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'url' : url

    };
  }
}

class LocationModel extends LocationEntity {
  LocationModel({
    required String? name,
    required String? url,
  }) : super(name: name, url: url);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'], url: json['url']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'url' : url

    };
  }
}