import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/maps/maps_cubit.dart';
import 'package:valopedia/business_logic/cubit/weapons/weapons_cubit.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';
import 'package:valopedia/presentation/screens/root_screen.dart';
import 'package:valopedia/presentation/screens/weapon_details_screen.dart';

import 'business_logic/cubit/agents/agents_cubit.dart';
import 'business_logic/cubit/favourites/favourites_cubit.dart';
import 'constants/strings.dart';
import 'data/models/agent/agent.dart';
import 'data/repository/agents_repository.dart';
import 'data/web_services/agents_web_services.dart';
import 'presentation/screens/details_screen.dart';
import 'presentation/screens/favourites_screen.dart';

class AppRouter {
  late AgentsRepository agentsRepository;
  late AgentsCubit agentsCubit;
  late MapsCubit mapsCubit;
  late WeaponsCubit weaponsCubit;
  late FavouritesCubit favouritesCubit;

  AppRouter() {
    agentsRepository = AgentsRepository(agentWebServices: AgentWebServices());
    agentsCubit = AgentsCubit(agentsRepository: agentsRepository);
    mapsCubit = MapsCubit(agentsRepository: agentsRepository);
    weaponsCubit = WeaponsCubit(agentsRepository: agentsRepository);

    favouritesCubit = FavouritesCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case splashScreen:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());

      case agentsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: agentsCubit),
              BlocProvider.value(value: mapsCubit),
              BlocProvider.value(value: weaponsCubit),
            ],
            child: const RootScreen(),
          ),
        );
      // case agentsScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: agentsCubit,
      //       child: const AgentsScreen(),
      //     ),
      //   );

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

      case weaponDatailsScreen:
      final Weapon weapon = settings.arguments as Weapon ;
      return MaterialPageRoute(
          builder: (_) => 
            WeaponDatailsScreen(weapon: weapon),
          
        );
    }
    return null;
  }
}
