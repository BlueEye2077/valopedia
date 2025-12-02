import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/cubit/agents_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/agents_gridview.dart';
import 'package:valopedia/presentation/widgets/app_drawer.dart';
import 'package:valopedia/presentation/widgets/app_loading_indicator.dart';
import 'package:valopedia/presentation/widgets/interactive_app_bar.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentsScreen> {
  late List<Agent> allAgents;
  List<Agent> searchedAgents = [];

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

          return 
          allAgents.isNotEmpty?AgentsGridview(agents: searchedAgents):
          AgentsGridview(agents: allAgents);
          // return buildAgentsScreen();
        } else {
          return const AppLoadingIndicator();
        }
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
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: MyColors.myGrey,

      appBar: InteractiveAppBar(
        title: "All Agents",
        onSearchChanged: _searchAgent,
      ),
      body: buildBlocWidget(),
    );
  }
}
