class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String origin;
  final String location;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory CharacterModel.fromJsonApi(Map<String, dynamic> json) {
    final origin = json['origin'] != null ? json['origin']['name'] : '';
    final location = json['location'] != null ? json['location']['name'] : '';

    return CharacterModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      origin: origin,
      location: location,
      image: json['image'] ?? '',
    );
  }
}
