import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import '../../constants/my_colors.dart';
import '../../constants/strings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.myGrey,

      // width: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/images/backgrounds/side_drawer_background.jpg",
                fit: .cover,
              ),
            ),
          ),
          Column(
            children: [
              DrawerHeader(
                
                margin: const .fromLTRB(0, 0, 0, 0),
                padding: const .all(0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: .cover,
                    image: AssetImage(
                      "assets/images/backgrounds/drawer_background.jpg",
                      
                    ),
                  ),
                ),

                child: Container(
                  width: .infinity,
                  height: .infinity,
                  alignment: .bottomLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Valopedia",
                      style: TextStyle(color: MyColors.myWhite, fontSize: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(favouriteAgentsScreen);
                },
                leading: const Icon(
                  RpgAwesome.double_team,
                  color: MyColors.myBrightRed,
                  size: 26,
                ),
                title: const Text(
                  "Favourite Agents",
                  style: TextStyle(color: MyColors.myWhite, fontSize: 21),
                ),
              ),

              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(favouriteMapsScreen);
                },
                leading: const Icon(
                  FontAwesome5.map,
                  color: MyColors.myBrightRed,
                  size: 26,
                ),
                title: const Text(
                  "Favourite Maps",
                  style: TextStyle(color: MyColors.myWhite, fontSize: 21),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(favouriteWeaponsScreen);
                },
                leading: const Icon(
                  RpgAwesome.crossed_pistols,
                  color: MyColors.myBrightRed,
                  size: 26,
                ),
                title: const Text(
                  "Favourite Weapons",
                  style: TextStyle(color: MyColors.myWhite, fontSize: 21),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
