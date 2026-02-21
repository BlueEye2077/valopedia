import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../business_logic/cubit/agents/agents_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/agent/agent.dart';
import '../common/app_drawer.dart';
import '../common/app_loading_indicator.dart';
import '../common/error_widget.dart';
import '../common/interactive_app_bar.dart';
import '../common/no_internet_widget.dart';
import 'widgets/agent_skeleton_gridview.dart';
import 'widgets/agents_gridview.dart';

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

  Widget _buildBlocWidget() {
    return BlocBuilder<AgentsCubit, AgentsState>(
      builder: (context, state) {
        Widget child;

        if (state is AgentsLoaded) {
          allAgents = (state).agents;
          child = AgentsGridview(
            items: searchedAgents.isNotEmpty ? searchedAgents : allAgents,
          );
        } else if (state is AgentsError) {
          child = AppErrorWidget(
            message: state.error,
            onRetry: () => BlocProvider.of<AgentsCubit>(context).getAllAgents(),
          );
        } else {
          child = const AgentSkeletonGridview();
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
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
