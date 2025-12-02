import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';

class InteractiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String searchText) onSearchChanged;
  final String title;

  const InteractiveAppBar({
    super.key,
    required this.title,
    required this.onSearchChanged,
  });

  @override
  State<InteractiveAppBar> createState() => _InteractiveAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _InteractiveAppBarState extends State<InteractiveAppBar> {
  bool _isSearching = false;
  final TextEditingController _textController = TextEditingController();

  Widget _buildAppBarTitle() {
    return Text(
      widget.title,
      // "All Agents",
      style: const TextStyle(color: MyColors.myWhite, fontSize: 20),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _textController,

      onChanged: (searchedAgent) {
        // context.read<AgentsCubit>().getSearchedAgents(
        //   searchedAgent: searchedAgent,
        // );
        widget.onSearchChanged(searchedAgent);
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
          onPressed: _stopSearching,
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
      widget.onSearchChanged("");
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
    return AppBar(
      iconTheme: const IconThemeData(color: MyColors.myWhite),

      title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
      backgroundColor: const Color.fromARGB(255, 55, 5, 10),
      actions: _buildAppBarActions(),
    );
  }
}
