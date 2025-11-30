import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/favourites_cubit/cubit/favourites_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/agent_item.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late List<Agent> favouritesAgents;

  Widget _buildAgentsScreen() {
    return Container(
      color: MyColors.myGrey,

      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        shrinkWrap: true,

        itemCount: favouritesAgents.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => AgentItem(
          key: ValueKey(
            favouritesAgents.isNotEmpty
                ? favouritesAgents[index].uuid
                : favouritesAgents[index].uuid,
          ),
          agent: favouritesAgents.isNotEmpty
              ? favouritesAgents[index]
              : favouritesAgents[index],
        ),
      ),
    );
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouriesLoaded) {
          favouritesAgents = state.favourites;
          return _buildAgentsScreen();
        } else {
          return Center(
            child: CircularProgressIndicator(color: MyColors.myRed),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Agents",
          style: TextStyle(color: MyColors.myWhite, fontSize: 20),
        ),
      ),
      body: _buildBlocWidget(),
    );
  }
}
