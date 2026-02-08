import 'package:flutter/material.dart';
import 'package:valopedia/data/models/map/valorant_map.dart';
import 'package:valopedia/presentation/screens/generic_favourites_screen.dart';
import 'package:valopedia/presentation/widgets/maps_list_view.dart';

class FavouriteMapsScreen extends StatelessWidget {
  const FavouriteMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericFavouritesScreen(
      hint: "Find a map...",
      title: "Favourite Maps",
      viewBuilder: (List<ValorantMap> maps) => MapsListView(maps: maps),
      searchFilter: (ValorantMap map, query) => map.displayName!
          .toLowerCase()
          .trim()
          .contains(query.trim().toLowerCase()),
    );
  }
}
