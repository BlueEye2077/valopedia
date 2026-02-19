import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/maps/maps_cubit.dart';
import 'business_logic/cubit/weapons/weapons_cubit.dart';
import 'data/models/map/valorant_map.dart';
import 'data/models/weapon/weapon.dart';
import 'presentation/weapons/all_weapon_skins_screen.dart';
import 'presentation/weapons/all_weapon_stats_screen.dart';
import 'presentation/favourites/favourite_agents_screen.dart';
import 'presentation/favourites/favourite_maps_screen.dart';
import 'presentation/favourites/favourite_weapons_screen.dart';
import 'presentation/root/root_screen.dart';
import 'presentation/maps/valorant_map_details_screen.dart';
import 'presentation/weapons/weapon_details_screen.dart';

import 'business_logic/cubit/agents/agents_cubit.dart';
import 'business_logic/cubit/favourites/favourites_cubit.dart';
import 'constants/strings.dart';
import 'data/models/agent/agent.dart';
import 'data/repository/repository.dart';
import 'data/web_services/web_services.dart';
import 'presentation/agents/agent_details_screen.dart';

class AppRouter {
  late Repository agentsRepository;
  late AgentsCubit agentsCubit;
  late MapsCubit mapsCubit;
  late WeaponsCubit weaponsCubit;
  late FavouritesCubit<Agent> favouriteAgentsCubit;
  late FavouritesCubit<ValorantMap> favouriteMapsCubit;
  late FavouritesCubit<Weapon> favouriteWeaponsCubit;

  AppRouter() {
    agentsRepository = Repository(agentWebServices: WebServices());
    agentsCubit = AgentsCubit(agentsRepository: agentsRepository);
    mapsCubit = MapsCubit(agentsRepository: agentsRepository);
    weaponsCubit = WeaponsCubit(agentsRepository: agentsRepository);

    favouriteAgentsCubit = FavouritesCubit<Agent>();
    favouriteMapsCubit = FavouritesCubit<ValorantMap>();
    favouriteWeaponsCubit = FavouritesCubit<Weapon>();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case splashScreen:
      // return MaterialPageRoute(builder: (_) => const SplashScreen());

      case rootScreen:
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

      case agentDetailsScreen:
        final Agent agent = settings.arguments as Agent;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouriteAgentsCubit,
            child: AgentDetailsScreen(agent: agent),
          ),
        );

      case weaponDatailsScreen:
        final Weapon weapon = settings.arguments as Weapon;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouriteWeaponsCubit,
            child: WeaponDatailsScreen(weapon: weapon),
          ),
        );

      case mapsDatailsScreen:
        final ValorantMap valorantMap = settings.arguments as ValorantMap;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouriteMapsCubit,
            child: ValorantMapDetailsScreen(valorantMap: valorantMap),
          ),
        );

      case favouriteAgenetsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouriteAgentsCubit,
            child: const FavouriteAgentsScreen(),
          ),
        );

      case favouriteMapsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouriteMapsCubit,
            child: const FavouriteMapsScreen(),
          ),
        );

      case favouriteWeaponsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: favouriteWeaponsCubit,
            child: const FavouriteWeaponsScreen(),
          ),
        );

      case allWeaponStatsScreen:
        final Weapon weapon = settings.arguments as Weapon;
        return MaterialPageRoute(
          builder: (_) => AllWeaponStatsScreen(weapon: weapon),
        );

      case allWeaponSkinsScreen:
        final Weapon weapon = settings.arguments as Weapon;
        return MaterialPageRoute(
          builder: (_) => AllWeaponSkinsScreen(weapon: weapon),
        );
    }

    return null;
  }
}
