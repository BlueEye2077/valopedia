import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/constants/strings.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';

class WeaponItem extends StatelessWidget {
  final Weapon weapon;

  const WeaponItem({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          // Navigator.of(
          // context,
          // ).push(MaterialPageRoute(builder: (context) => SplashScreen())),
          Navigator.pushNamed(context, weaponDatailsScreen, arguments: weapon),
      child: Hero(
        tag: weapon.uuid!,
        child: Material(
              type: MaterialType.transparency,
          child: Container(
            width: .infinity,
            height: 300,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(25) ,
              border: Border.all(width: 1, color: Colors.blueGrey),
            ),
            margin: const .all(6),
            child: Stack(
              alignment: .center,
          
              children: [
                Image.asset(
                  "assets/images/backgrounds/background1.jpg",
                  fit: .cover,
                  height: .infinity,
                  width: .infinity,
                ),
          
                Padding(
                  padding: const .all(12),
                  child: Container(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: weapon.displayIcon!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 6,
                  right: 6,
                  child: Text(
                    weapon.displayName!,
                    style: const TextStyle(fontSize: 18, color: MyColors.myWhite),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const .all(4),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(84, 96, 125, 139),
                    ),
                    child: Text(
                      "${weapon.shopData != null ? weapon.shopData!.cost.toString() : 'Owned'} \$",
                      style: const TextStyle(
                        fontSize: 18,
                        // fontVariations: [FontVariation.italic(0.129)],
                        color: MyColors.myWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   width: double.infinity,
    //   margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
    //   padding: EdgeInsetsDirectional.all(4),
    //   decoration: BoxDecoration(
    //     color: MyColors.myWhite,
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   child: InkWell(
    //     onTap: () => Navigator.pushNamed(
    //       context,
    //       weaponDatailsScreen,
    //       arguments: weapon,
    //     ),
    //     child: GridTile(
    //       child: Hero(
    //         tag: weapon.uuid!,
    //         child: Container(
    //           color: MyColors.myGrey,
    //           child: weapon.displayIcon != null
    //               ? FadeInImage.assetNetwork(
    //                   width: double.infinity,
    //                   height: double.infinity,
    //                   placeholder: "assets/images/backgrounds/maps_placeholder.gif",
    //                   image: weapon.displayIcon!,
    //                   fit: BoxFit.cover,
    //                 )
    //               : Image.asset('assets/images/placeholder.jpg'),
    //         ),
    //       ),
    //       footer: Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //         color: Colors.black54,
    //         alignment: Alignment.bottomCenter,
    //         child: Text(
    //           '${weapon.displayName}',
    //           style: TextStyle(
    //             height: 1.3,
    //             fontSize: 16,
    //             color: MyColors.myWhite,
    //             fontWeight: FontWeight.bold,
    //           ),
    //           overflow: TextOverflow.ellipsis,
    //           maxLines: 2,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
