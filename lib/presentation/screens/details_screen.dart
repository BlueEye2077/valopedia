import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valopedia/business_logic/cubit/favourites_cubit/cubit/favourites_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/ability_tile.dart';
import 'package:valopedia/presentation/widgets/details_divider.dart';
import 'package:valopedia/presentation/widgets/role_card.dart';

class DetailsScreen extends StatefulWidget {
  final Agent agent;

  const DetailsScreen({super.key, required this.agent});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Image Stack
  Widget _buildFlexibleSpaceBarBackground() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          fit: BoxFit.cover,
          image: const AssetImage("assets/images/background2.jpg"),
        ),
        Hero(
          tag: widget.agent.uuid!,

          child: CachedNetworkImage(
            imageUrl: widget.agent.fullPortrait!,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Image.asset("assets/images/jet.gif", fit: BoxFit.cover),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }

  // App Bar
  Widget _buildSliverAppBar() {
    bool isFav = BlocProvider.of<FavouritesCubit>(
      context,
    ).isFavourite(widget.agent);
    // bool isFav =
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<FavouritesCubit>(
              context,
            ).toggleFavorites(widget.agent);
            
          },
          icon: isFav
              ? const Icon(Icons.favorite_sharp)
              : const Icon(Icons.favorite_outline_sharp),
        ),
      ],
      iconTheme: const IconThemeData(color: MyColors.myWhite),
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myLightGrey,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildFlexibleSpaceBarBackground(),
        title: Text(
          widget.agent.displayName!,
          style: const TextStyle(letterSpacing: 12, color: MyColors.myWhite),
          softWrap: true,
          overflow: .ellipsis,
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      textAlign: .start,
      // "BIOGRAPHY",
      title.toUpperCase(),
      style: const TextStyle(
        color: MyColors.myRed,
        fontSize: 24,
        fontWeight: .bold,
      ),
    );
  }

  Widget _buildSectionWithDescription(String title, String description) {
    return Container(
      margin: const .all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: MyColors.mySilver, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAbilitesSection() {
    return Container(
      margin: const .all(12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _buildSectionTitle("Abilities"),
          ...widget.agent.abilities.map(
            (ability) => AbilityTile(ability: ability),
          ),
        ],
      ),
    );
  }

  // Body
  Widget _buildSliverBody() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          // padding: EdgeInsets.all(8),
          // margin: EdgeInsets.all(8),
          child: Column(
            children: [
              const DetailsDivider(
                color: MyColors.myRed,
                thickness: 8,
                indent: 0,
                endIndent: 0,
              ),

              _buildSectionWithDescription(
                "Biography",
                widget.agent.description!,
              ),
              const DetailsDivider(),

              RoleCard(agent: widget.agent),
              const DetailsDivider(),

              _buildAbilitesSection(),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [_buildSliverAppBar(), _buildSliverBody()],
          );
        },
      ),
    );
  }
}
