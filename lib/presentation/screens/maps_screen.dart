import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:valopedia/business_logic/cubit/maps/maps_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/map/valorant_map.dart';
import 'package:valopedia/presentation/widgets/app_drawer.dart';
import 'package:valopedia/presentation/widgets/app_loading_indicator.dart';
import 'package:valopedia/presentation/widgets/interactive_app_bar.dart';
import 'package:valopedia/presentation/widgets/maps_list_view.dart';
import 'package:valopedia/presentation/widgets/no_internet_widget.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen>
    with AutomaticKeepAliveClientMixin {
  late List<ValorantMap> allMaps;
  List<ValorantMap> searchedMaps = [];

  @override
  bool get wantKeepAlive => true;

  Widget buildBlocWidget() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is MapsLoaded) {
          print("this is maps listview build");

          allMaps = (state).maps;
          return searchedMaps.isNotEmpty
              ? MapsListView(maps: searchedMaps)
              : MapsListView(maps: allMaps);
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  void _searchMap(String searchedWeapon) {
    setState(() {
      searchedMaps = allMaps
          .where(
            (weapon) => weapon.displayName!.toLowerCase().trim().contains(
              searchedWeapon.trim().toLowerCase(),
            ),
          )
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MapsCubit>(context).getAllMaps();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: InteractiveAppBar(
        hint: "Find a map...",
        title: "All Maps",
        onSearchChanged: _searchMap,
      ),

      backgroundColor: MyColors.myGrey,

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
                return buildBlocWidget();
              } else {
                return const NoInternetWidget();
              }
            },
        child: const AppLoadingIndicator(),
      ),
    );
  }
}
