import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/cubit/agents_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/presentation/widgets/agent_item.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentsScreen> {
  late List allAgents;

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

          return buildAgentsScreen();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget buildAgentsScreen() {
    return Container(
      color: MyColors.myGrey,

      child: GridView.builder(
        itemCount: allAgents.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => AgentItem(agent: allAgents[index]),
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myRed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar: AppBar(backgroundColor: MyColors.myRed),
      body: buildBlocWidget(),
    );
  }
}
