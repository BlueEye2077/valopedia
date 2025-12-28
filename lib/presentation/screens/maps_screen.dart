import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:valopedia/business_logic/cubit/agents/agents_cubit.dart';
import 'package:valopedia/business_logic/cubit/maps/maps_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/map/map.dart';
import 'package:valopedia/presentation/widgets/app_loading_indicator.dart';
import 'package:valopedia/presentation/widgets/no_internet_widget.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late List<ValorantMap> allMaps;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MapsCubit>(context).getAllMaps();
  }

  Widget _buildMapsListView() {
    return ListView.builder(
      itemCount: allMaps.length,
      itemBuilder: (context, index) =>
          ListTile(title: Text(allMaps[index].displayName!)),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is MapsLoaded) {
          allMaps = (state).maps;
          return _buildMapsListView();
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
