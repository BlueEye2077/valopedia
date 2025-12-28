class Weapon {
  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;

  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skins>? skins;

  Weapon.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    defaultSkinUuid = json['defaultSkinUuid'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    assetPath = json['assetPath'];

    weaponStats = json['weaponStats'] != null
        ? WeaponStats.fromJson(json['weaponStats'])
        : null;

    shopData = json['shopData'] != null
        ? ShopData.fromJson(json['shopData'])
        : null;

    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
  }
}

class WeaponStats {
  int? fireRate;
  int? magazineSize;
  double? runSpeedMultiplier;
  double? equipTimeSeconds;
  int? reloadTimeSeconds;
  double? firstBulletAccuracy;
  int? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  Null? fireMode;
  String? altFireType;
  AdsStats? adsStats;
  Null? altShotgunStats;
  Null? airBurstStats;
  List<DamageRanges>? damageRanges;

  WeaponStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    feature = json['feature'];
    fireMode = json['fireMode'];
    altFireType = json['altFireType'];
    adsStats = json['adsStats'] != null
        ? AdsStats.fromJson(json['adsStats'])
        : null;
    altShotgunStats = json['altShotgunStats'];
    airBurstStats = json['airBurstStats'];
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(DamageRanges.fromJson(v));
      });
    }
  }
}

class AdsStats {
  double? zoomMultiplier;
  double? fireRate;
  double? runSpeedMultiplier;
  int? burstCount;
  double? firstBulletAccuracy;

  AdsStats.fromJson(Map<String, dynamic> json) {
    zoomMultiplier = json['zoomMultiplier'];
    fireRate = json['fireRate'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    burstCount = json['burstCount'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
  }
}

class DamageRanges {
  int? rangeStartMeters;
  int? rangeEndMeters;
  double? headDamage;
  int? bodyDamage;
  double? legDamage;

  DamageRanges.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }
}

class ShopData {
  int? cost;
  String? category;
  int? shopOrderPriority;
  String? categoryText;
  GridPosition? gridPosition;
  bool? canBeTrashed;
  Null? image;
  String? newImage;
  Null? newImage2;
  String? assetPath;

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    shopOrderPriority = json['shopOrderPriority'];
    categoryText = json['categoryText'];
    gridPosition = json['gridPosition'] != null
        ? GridPosition.fromJson(json['gridPosition'])
        : null;
    canBeTrashed = json['canBeTrashed'];
    image = json['image'];
    newImage = json['newImage'];
    newImage2 = json['newImage2'];
    assetPath = json['assetPath'];
  }
}

class GridPosition {
  int? row;
  int? column;

  GridPosition.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
  }
}

class Skins {
  String? uuid;
  String? displayName;
  String? themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  String? wallpaper;
  String? assetPath;
  List<Chromas>? chromas;
  List<Levels>? levels;

  Skins.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    themeUuid = json['themeUuid'];
    contentTierUuid = json['contentTierUuid'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
    assetPath = json['assetPath'];
    if (json['chromas'] != null) {
      chromas = <Chromas>[];
      json['chromas'].forEach((v) {
        chromas!.add(Chromas.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(Levels.fromJson(v));
      });
    }
  }
}

class Chromas {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? fullRender;
  String? swatch;
  String? streamedVideo;
  String? assetPath;

  Chromas.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    fullRender = json['fullRender'];
    swatch = json['swatch'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }
}

class Levels {
  String? uuid;
  String? displayName;
  String? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String? assetPath;

  Levels.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    levelItem = json['levelItem'];
    displayIcon = json['displayIcon'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }
}
