class Ability {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Ability.fromJson(Map<String, dynamic> json) {
    slot = json["slot"];
    displayName = json["displayName"];
    description = json["description"];
    displayIcon = json["displayIcon"];
  }
}
