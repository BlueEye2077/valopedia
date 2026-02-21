import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../business_logic/cubit/weapons/weapons_cubit.dart';
import '../../data/models/weapon/weapon.dart';
import '../common/app_drawer.dart';
import '../common/app_loading_indicator.dart';
import '../common/error_widget.dart';
import '../common/interactive_app_bar.dart';
import '../common/no_internet_widget.dart';
import 'widgets/weapons_grid_view.dart';
import 'widgets/weapons_skeleton_grid_view.dart';

class WeaponsScreen extends StatefulWidget {
  const WeaponsScreen({super.key});

  @override
  State<WeaponsScreen> createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen>
    with AutomaticKeepAliveClientMixin {
  late List<Weapon> allWeapons;
  List<Weapon> searchedWeapons = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeaponsCubit>(context).getAllWeapons();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildBlocWidget() {
    return BlocBuilder<WeaponsCubit, WeaponsState>(
      builder: (context, state) {
        Widget child;
        if (state is WeaponsLoaded) {
          allWeapons = (state).weapons;
          child = searchedWeapons.isNotEmpty
              ? WeaponsGridView(weapons: searchedWeapons)
              : WeaponsGridView(weapons: allWeapons);
        } else if (state is WeaponsError) {
          child = AppErrorWidget(
            message: state.error,
            onRetry: () =>
                BlocProvider.of<WeaponsCubit>(context).getAllWeapons(),
          );
        } else {
          child = const WeaponsSkeletonGridView();
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
    );
  }

  void _searchWeapon(String searchedWeapon) {
    setState(() {
      searchedWeapons = allWeapons
          .where(
            (weapon) => weapon.displayName!.toLowerCase().trim().contains(
              searchedWeapon.trim().toLowerCase(),
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: InteractiveAppBar(
        hint: "Find a weapon...",
        title: "All Weapons",
        onSearchChanged: _searchWeapon,
      ),

      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity.contains(
                ConnectivityResult.none,
              );
              if (connected) {
                return _buildBlocWidget();
              } else {
                return const NoInternetWidget();
              }
            },
        child: const AppLoadingIndicator(),
      ),
    );
  }
}
