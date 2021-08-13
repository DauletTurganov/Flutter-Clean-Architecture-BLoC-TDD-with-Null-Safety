// {
// "id": 2,
// "name": "Morty Smith",
// "status": "Alive",
// "species": "Human",
// "type": "",
// "gender": "Male",
// "origin": {
// "name": "Earth",
// "url": "https://rickandmortyapi.com/api/location/1"
// },
// "location": {
// "name": "Earth",
// "url": "https://rickandmortyapi.com/api/location/20"
// },
// "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
// "episode": [
// "https://rickandmortyapi.com/api/episode/1",
// "https://rickandmortyapi.com/api/episode/2",
// // ...
// ],
// "url": "https://rickandmortyapi.com/api/character/2",
// "created": "2017-11-04T18:50:21.651Z"
// }

import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginEntity? origin;
  final LocationEntity? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  PersonEntity(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  @override
  // TODO: implement props
  List<Object?> get props =>[id, name, status, species, type, gender, origin, location, image, episode, url, created];

}

class LocationEntity extends Equatable{
  final String? name;
  final String? url;

  LocationEntity({this.name, this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [name, url];
}

class OriginEntity extends Equatable{
  final String? name;
  final String? url;

  OriginEntity({this.name, this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [name, url];
}