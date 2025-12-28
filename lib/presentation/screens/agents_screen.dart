import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../business_logic/cubit/agents/agents_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/agent/agent.dart';
import '../widgets/agents_gridview.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/interactive_app_bar.dart';
import '../widgets/no_internet_widget.dart';

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
        if (state is AgentsLoaded) {
          allAgents = (state).agents;

          return _buildAgentGridView();
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  Widget _buildAgentGridView() {
    return SingleChildScrollView(
      child: searchedAgents.isNotEmpty
          ? AgentsGridview(items: searchedAgents, gridType: .agent)
          : AgentsGridview(items: allAgents, gridType: .agent),
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
      backgroundColor: MyColors.myGrey,
      drawer: const AppDrawer(),
      appBar: InteractiveAppBar(
        title: "All Agents",
        onSearchChanged: _searchAgent,
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
