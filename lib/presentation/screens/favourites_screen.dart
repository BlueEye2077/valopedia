import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valopedia/business_logic/cubit/favourites_cubit/cubit/favourites_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/agents_gridview.dart';
import 'package:valopedia/presentation/widgets/app_loading_indicator.dart';
import 'package:valopedia/presentation/widgets/interactive_app_bar.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late List<Agent> favouritesAgents;
  List<Agent> searchedAgents = [];
  

  Widget _buildNoFavouritesFoundWidget() {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          SvgPicture.asset(
            "assets/images/favourites.svg",
            fit: .cover,
            height: 300,
          ),
          const SizedBox(height: 15),
          const Text(
            "No favourites found, Try adding some...",
            textAlign: .center,
            style: TextStyle(fontSize: 32, color: MyColors.myWhite),
          ),
        ],
      ),
    );
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouriesLoaded) {
          favouritesAgents = state.favourites;
          return searchedAgents.isNotEmpty
              ? AgentsGridview(agents: searchedAgents)
              : AgentsGridview(agents: favouritesAgents);
        } else if (state is NoFavourites) {
          return _buildNoFavouritesFoundWidget();
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  void _searchAgent(String searchedAgent) {
    setState(() {
      searchedAgents = favouritesAgents
          .where(
            (agent) => agent.displayName!.toLowerCase().trim().contains(
              searchedAgent.trim().toLowerCase(),
            ),
          )
          .toList();
    });
  }



  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavouritesCubit>(context).isFavouritesEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InteractiveAppBar(
        title: "Favourites Agents",
        onSearchChanged: _searchAgent,
      ),
      backgroundColor: MyColors.myGrey,
      body: _buildBlocWidget(),
    );
  }
}
