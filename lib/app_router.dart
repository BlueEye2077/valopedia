import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/cubit/agents_cubit.dart';
import 'package:valopedia/business_logic/cubit/favourites_cubit/cubit/favourites_cubit.dart';
import 'package:valopedia/constants/strings.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/data/repository/agents_repository.dart';
import 'package:valopedia/data/web_services/agents_web_services.dart';
import 'package:valopedia/presentation/screens/agents_screen.dart';
import 'package:valopedia/presentation/screens/details_screen.dart';
import 'package:valopedia/presentation/screens/favourites_screen.dart';

class AppRouter {
  late AgentsRepository agentsRepository;
  late AgentsCubit agentsCubit;
  late FavouritesCubit favouritesCubit;

  AppRouter() {
    agentsRepository = AgentsRepository(agentWebServices: AgentWebServices());
    agentsCubit = AgentsCubit(agentsRepository: agentsRepository);
    favouritesCubit = FavouritesCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case agentsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: agentsCubit,
            child: const AgentsScreen(),
          ),
        );

      case detailsScreen:
        final Agent agent = settings.arguments as Agent;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouritesCubit,
            child: DetailsScreen(agent: agent),
          ),
        );
      case favouritesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouritesCubit,
            child: const FavouritesScreen(),
          ),
        );
    }
    return null;
  }
}
