import 'package:flutter/material.dart';

import '../../../data/models/agent/agent.dart';
import 'agent_item.dart';

class AgentsGridview extends StatelessWidget {
  final List<Agent> items;
  const AgentsGridview({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            physics: const ClampingScrollPhysics(),
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
            shrinkWrap: true,
            cacheExtent: 2000,
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>
                AgentItem(key: ValueKey(items[index].uuid), agent: items[index]),
          ),
        ],
      ),
    );
  }
}
