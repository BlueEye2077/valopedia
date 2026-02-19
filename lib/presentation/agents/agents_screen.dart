import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:valopedia/presentation/agents/widgets/agent_item_skeleton.dart';
import '../../business_logic/cubit/agents/agents_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/agent/agent.dart';
import 'widgets/agents_gridview.dart';
import '../common/app_drawer.dart';
import '../common/app_loading_indicator.dart';
import '../common/interactive_app_bar.dart';
import '../common/no_internet_widget.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentsScreen>
    with AutomaticKeepAliveClientMixin {
  late List<Agent> allAgents;
  List<Agent> searchedAgents = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AgentsCubit>(context).getAllAgents();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<AgentsCubit, AgentsState>(
      builder: (context, state) {
        Widget child;

        if (state is AgentsLoaded) {
          allAgents = (state).agents;
          child = _buildAgentGridView();
        } else {
          child = _buildAgentsSkeletonGridview();
        }

        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: child,
        );
      },
    );
  }

  Widget _buildAgentGridView() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            AgentsGridview(
              items: searchedAgents.isNotEmpty ? searchedAgents : allAgents,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentsSkeletonGridview() {
    return Skeletonizer(
      key: const ValueKey('skeleton'),
      enabled: true,
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const AgentItemSkeleton();
        },
      ),
    );
  }

  void _searchAgent(String searchedAgent) {
    setState(() {
      searchedAgents = allAgents
          .where(
            (agent) => agent.displayName!.toLowerCase().trim().contains(
              searchedAgent.trim().toLowerCase(),
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
        hint: "Find an agent...",
        title: "All Agents",
        onSearchChanged: _searchAgent,
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
