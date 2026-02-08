import 'package:flutter/material.dart';
import 'package:valopedia/data/models/agent/agent.dart';
import 'package:valopedia/presentation/screens/generic_favourites_screen.dart';
import 'package:valopedia/presentation/widgets/agents_gridview.dart';

class FavouriteAgentsScreen extends StatelessWidget {
  const FavouriteAgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericFavouritesScreen(
      hint: "Find an agent...",
      title: "Favourite Agents",
      viewBuilder: (List<Agent> agents) => AgentsGridview(items: agents),

      // tells the "GenericFavouritesScreen" that the element should be of type "Agent"
      searchFilter: (Agent agent, userenteredQuery) => agent.displayName!
          .toLowerCase()
          .trim()
          .contains(userenteredQuery.trim().toLowerCase()),
    );
  }
}
