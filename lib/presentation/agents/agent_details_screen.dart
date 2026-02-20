import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../business_logic/cubit/favourites/favourites_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/agent/agent.dart';
import '../common/custom_sliver_app_bar.dart';
import '../common/details_divider.dart';
import '../common/section_title.dart';
import 'widgets/ability_tile.dart';
import 'widgets/role_card.dart';

class AgentDetailsScreen extends StatefulWidget {
  final Agent agent;

  const AgentDetailsScreen({super.key, required this.agent});

  @override
  State<AgentDetailsScreen> createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {
  // Image Stack
  Widget _buildFlexibleSpaceBarBackground() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          fit: BoxFit.cover,
          image: const AssetImage(
            "assets/images/backgrounds/agent_details_background.jpg",
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: Hero(
            tag: widget.agent.uuid!,
    
            child: CachedNetworkImage(
              imageUrl: widget.agent.fullPortrait!,
              fit: BoxFit.cover,
              memCacheHeight: 800,
              placeholder: (context, url) =>
                  Container(color: MyColors.myGrey),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionWithDescription(String title, String description) {
    return Container(
      margin: const .all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title),
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
          const SectionTitle(title: "Abilities"),
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
        Column(
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
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: BlocBuilder<FavouritesCubit<Agent>, FavouritesState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                item: widget.agent,
                flexibleSpaceBarBackground: _buildFlexibleSpaceBarBackground,
                expandedHeight: 600,
                title: widget.agent.displayName!,
              ),

              _buildSliverBody(),
            ],
          );
        },
      ),
    );
  }
}
