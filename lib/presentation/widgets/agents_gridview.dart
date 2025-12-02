import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/agent_item.dart';

class AgentsGridview extends StatelessWidget {
  final List<Agent> agents;
  const AgentsGridview({super.key, required this.agents});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.myGrey,

      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        shrinkWrap: true,

        itemCount: agents.length,
        //  searchList.isNotEmpty
        //     ? searchList.length
        //     : allAgents.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => AgentItem(
          key: ValueKey(
            agents[index].uuid,
            // searchList.isNotEmpty
            //     ? searchList[index].uuid
            //     : allAgents[index].uuid,
          ),
          agent: agents[index],
          // searchList.isNotEmpty
          //     ? searchList[index]
          //     : allAgents[index],
        ),
      ),
    );
  }
}
