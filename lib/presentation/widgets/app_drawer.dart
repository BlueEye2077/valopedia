import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/constants/strings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: MyColors.myGrey,
      child: Column(
        children: [
          DrawerHeader(
            margin: const .fromLTRB(0, 0, 0, 0),
            padding: const .all(0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: .cover,
                image: AssetImage("assets/images/drawer_background.jpg"),
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
              Navigator.of(context).pushNamed(favouritesScreen);
            },
            leading: const Icon(Icons.favorite_sharp),
            title: const Text(
              "Favourite Agents",
              style: TextStyle(color: MyColors.mySilver, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}