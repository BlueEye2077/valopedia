import 'package:flutter/material.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';
import 'package:valopedia/presentation/screens/generic_favourites_screen.dart';
import 'package:valopedia/presentation/widgets/weapons_list_view.dart';

class FavouriteWeaponsScreen extends StatelessWidget {
  const FavouriteWeaponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericFavouritesScreen(
      title: "Favourite Weapons",
      hint: "Find A Weapon",
      viewBuilder: (List<Weapon> weapons) => WeaponsListView(weapons: weapons),
      searchFilter: (Weapon weapon, query) => weapon.displayName!
          .toLowerCase()
          .trim()
          .contains(query.trim().toLowerCase()),
    );
  }
}
