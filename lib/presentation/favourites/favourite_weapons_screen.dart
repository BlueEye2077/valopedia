import 'package:flutter/material.dart';

import '../../data/models/weapon/weapon.dart';
import '../weapons/widgets/weapons_grid_view.dart';
import 'generic_favourites_screen.dart';

class FavouriteWeaponsScreen extends StatelessWidget {
  const FavouriteWeaponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericFavouritesScreen(
      title: "Favourite Weapons",
      hint: "Find A Weapon",
      viewBuilder: (List<Weapon> weapons) => WeaponsGridView(weapons: weapons),
      searchFilter: (Weapon weapon, query) => weapon.displayName!
          .toLowerCase()
          .trim()
          .contains(query.trim().toLowerCase()),
    );
  }
}
