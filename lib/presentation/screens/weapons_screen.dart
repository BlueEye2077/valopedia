import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:valopedia/business_logic/cubit/weapons/weapons_cubit.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';
import 'package:valopedia/presentation/widgets/app_loading_indicator.dart';
import 'package:valopedia/presentation/widgets/no_internet_widget.dart';
import 'package:valopedia/presentation/widgets/weapon_item.dart';

class WeaponsScreen extends StatefulWidget {
  const WeaponsScreen({super.key});

  @override
  State<WeaponsScreen> createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen> with AutomaticKeepAliveClientMixin{
  late List<Weapon> allWeapons;
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
          return _buildWeaponsWidget();
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  Widget _buildWeaponsWidget() {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        shrinkWrap: true,
        cacheExtent: 2000,
        itemCount: allWeapons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => WeaponItem(weapon: allWeapons[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        super.build(context);

    return Scaffold(
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
