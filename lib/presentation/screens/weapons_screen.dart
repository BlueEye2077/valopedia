import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../business_logic/cubit/weapons/weapons_cubit.dart';
import '../../data/models/weapon/weapon.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/interactive_app_bar.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/weapons_list_view.dart';

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
        if (state is WeaponsLoaded) {
          allWeapons = (state).weapons;
          return 
           searchedWeapons.isNotEmpty
              ? WeaponsListView(weapons: searchedWeapons)
              : WeaponsListView(weapons: allWeapons);
        } else {
          return const AppLoadingIndicator();
        }
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
