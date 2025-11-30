import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/cubit/agents_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';

class InteractiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  const InteractiveAppBar({super.key});

  @override
  State<InteractiveAppBar> createState() => _InteractiveAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _InteractiveAppBarState extends State<InteractiveAppBar> {
  List<Agent> _searchedAgents = [];
  bool _isSearching = false;
  final TextEditingController _textController = TextEditingController();

  Widget _buildAppBarTitle() {
    return const Text(
      "All Agents",
      style: TextStyle(color: MyColors.myWhite, fontSize: 20),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _textController,

      onChanged: (searchedAgent) {
        context.read<AgentsCubit>().getSearchedAgents(
          searchedAgent: searchedAgent,
        );

        // _getSearchedAgents(searchedAgent: searchedAgent);
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        hint: Text(
          "Find an agent...",
          style: TextStyle(color: MyColors.myWhite, fontSize: 20),
        ),
      ),
      style: const TextStyle(color: MyColors.myWhite, fontSize: 20),
    );
  }
  //todo...
  // void _getSearchedAgents({required String searchedAgent}) {
  //   _searchedAgents = widget.allAgents
  //       .where(
  //         (agent) => agent.displayName!.toLowerCase().trim().contains(
  //           searchedAgent.trim().toLowerCase(),
  //         ),
  //       )
  //       .toList();

  //   setState(() {});
  // }

  List<Widget> _buildAppBarActions() {
    if (!_isSearching) {
      return [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(Icons.search, color: MyColors.myWhite),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _clearSearch,
          icon: const Icon(Icons.clear, color: MyColors.myWhite),
        ),
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _clearSearch() {
    setState(() {
      _textController.clear();
      _searchedAgents.clear();
    });
    context.read<AgentsCubit>().getSearchedAgents(searchedAgent: '');
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: MyColors.myWhite),

      title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
      backgroundColor: const Color.fromARGB(255, 55, 5, 10),
      actions: _buildAppBarActions(),
    );
  }
}
