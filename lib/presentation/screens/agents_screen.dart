import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/cubit/agents_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/agent_item.dart';
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
  late List<Agent> searchedAgents;

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
          searchedAgents = (state).searchedAgents;

          return buildAgentsScreen();
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  Widget buildAgentsScreen() {
    return Container(
      color: MyColors.myGrey,

      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        shrinkWrap: true,

        itemCount: searchedAgents.isNotEmpty
            ? searchedAgents.length
            : allAgents.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => AgentItem(
          key: ValueKey(
            searchedAgents.isNotEmpty
                ? searchedAgents[index].uuid
                : allAgents[index].uuid,
          ),
          agent: searchedAgents.isNotEmpty
              ? searchedAgents[index]
              : allAgents[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: MyColors.myGrey,

      appBar: const InteractiveAppBar(),
      body: buildBlocWidget(),
    );
  }
}
