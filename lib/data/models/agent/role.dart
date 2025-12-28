class Role {
  late String uuid;
  late String displayName;
  late String description;
  late String displayIcon;
  late String assetPath;

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    displayName = json["displayName"];
    description = json["description"];
    displayIcon = json["displayIcon"];
    assetPath = json["assetPath"];
  }
}
