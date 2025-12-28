import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/agent/agent.dart';
import 'agent_item.dart';

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
        // shrinkWrap: true,
        cacheExtent: 2000,
        itemCount: agents.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) =>
            AgentItem(key: ValueKey(agents[index].uuid), agent: agents[index]),
      ),
    );
  }
}
