import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valopedia/business_logic/cubit/cubit/agents_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/presentation/widgets/agent_item.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentsScreen> {
  late List<Agent> allAgents;

  List<Agent> _searchedAgents = [];
  bool _isSearching = false;
  final TextEditingController _textController = TextEditingController();

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
        physics: const ClampingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        shrinkWrap: true,

        itemCount: _searchedAgents.isNotEmpty
            ? _searchedAgents.length
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
            _searchedAgents.isNotEmpty
                ? _searchedAgents[index].uuid
                : allAgents[index].uuid,
          ),
          agent: _searchedAgents.isNotEmpty
              ? _searchedAgents[index]
              : allAgents[index],
        ),
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myRed),
    );
  }

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
        _getSearchedAgents(searchedAgent: searchedAgent);
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

  void _getSearchedAgents({required String searchedAgent}) {
    _searchedAgents = allAgents
        .where(
          (agent) => agent.displayName!.toLowerCase().trim().contains(
            searchedAgent.trim().toLowerCase(),
          ),
        )
        .toList();

    setState(() {});
  }

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
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.myWhite),

        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        backgroundColor: const Color.fromARGB(255, 55, 5, 10),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
