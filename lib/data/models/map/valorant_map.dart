class ValorantMap {
  String? uuid;
  String? displayName;
  String? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? listViewIconTall;
  String? splash;
  String? stylizedBackgroundImage;
  String? premierBackgroundImage;
  String? assetPath;
  String? mapUrl;
  num? xMultiplier;
  num? yMultiplier;
  num? xScalarToAdd;
  num? yScalarToAdd;


  ValorantMap.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    tacticalDescription = json['tacticalDescription'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    listViewIconTall = json['listViewIconTall'];
    splash = json['splash'];
    stylizedBackgroundImage = json['stylizedBackgroundImage'];
    premierBackgroundImage = json['premierBackgroundImage'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    xMultiplier = json['xMultiplier'];
    yMultiplier = json['yMultiplier'];
    xScalarToAdd = json['xScalarToAdd'];
    yScalarToAdd = json['yScalarToAdd'];
  }
}
