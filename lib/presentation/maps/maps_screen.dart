import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../business_logic/cubit/maps/maps_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/map/valorant_map.dart';
import '../common/app_drawer.dart';
import '../common/app_loading_indicator.dart';
import '../common/error_widget.dart';
import '../common/interactive_app_bar.dart';
import '../common/no_internet_widget.dart';
import 'widgets/maps_list_view.dart';
import 'widgets/maps_skeleton_list_view.dart';

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

  Widget _buildBlocWidget() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        Widget child;

        if (state is MapsLoaded) {
          allMaps = (state).maps;
          child = searchedMaps.isNotEmpty
              ? MapsListView(maps: searchedMaps)
              : MapsListView(maps: allMaps);
        } else if (state is MapsError) {
          child = AppErrorWidget(
            message: state.error,
            onRetry: () => BlocProvider.of<MapsCubit>(context).getAllMaps(),
          );
        } else {
          child = const MapsSkeletonListView();
        }

        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: child,
        );
      },
    );
  }

  void _searchMap(String searchedMap) {
    setState(() {
      searchedMaps = allMaps
          .where(
            (valorantMap) => valorantMap.displayName!
                .toLowerCase()
                .trim()
                .contains(searchedMap.trim().toLowerCase()),
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
