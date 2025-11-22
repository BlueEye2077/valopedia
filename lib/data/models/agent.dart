import 'package:valopedia/data/models/ability.dart';
import 'package:valopedia/data/models/role.dart';

class Agent {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  String? releaseDate;
  List<dynamic>? characterTags;

  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? minimapPortrait;
  String? homeScreenPromoTileImage;
  String? background;

  List<dynamic>? backgroundGradientColors;

  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;

  Role? role;

  late List<Ability> abilities;

  Agent.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"] as String?;
    displayName = json["displayName"] as String?;
    description = json["description"] as String?;
    developerName = json["developerName"] as String?;
    releaseDate = json["releaseDate"] as String?;
    characterTags = json["characterTags"] as List<dynamic>?;

    displayIcon = json["displayIcon"] as String?;
    displayIconSmall = json["displayIconSmall"] as String?;
    bustPortrait = json["bustPortrait"] as String?;
    fullPortrait = json["fullPortrait"] as String?;
    fullPortraitV2 = json["fullPortraitV2"] as String?;
    killfeedPortrait = json["killfeedPortrait"] as String?;
    minimapPortrait = json["minimapPortrait"] as String?;
    homeScreenPromoTileImage = json["homeScreenPromoTileImage"] as String?;
    background = json["background"] as String?;

    backgroundGradientColors =
        json["backgroundGradientColors"] as List<dynamic>?;

    assetPath = json["assetPath"] as String?;

    isFullPortraitRightFacing = json["isFullPortraitRightFacing"] as bool?;
    isPlayableCharacter = json["isPlayableCharacter"] as bool?;
    isAvailableForTest = json["isAvailableForTest"] as bool?;
    isBaseContent = json["isBaseContent"] as bool?;

    role = Role.fromJson(json["role"]);

    abilities = (json["abilities"] as List)
        .map((ability) => Ability.fromJson(ability))
        .toList();
  }
}
