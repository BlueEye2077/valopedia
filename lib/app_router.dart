import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/agents/agents_cubit.dart';
import 'business_logic/cubit/favourites/favourites_cubit.dart';
import 'constants/strings.dart';
import 'data/models/agent.dart';
import 'data/repository/agents_repository.dart';
import 'data/web_services/agents_web_services.dart';
import 'presentation/screens/agents_screen.dart';
import 'presentation/screens/details_screen.dart';
import 'presentation/screens/favourites_screen.dart';

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
      // case splashScreen:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());

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
