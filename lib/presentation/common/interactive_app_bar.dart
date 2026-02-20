import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class InteractiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String searchText) onSearchChanged;
  final String title;
  final String hint;

  const InteractiveAppBar({
    super.key,
    required this.title,
    required this.hint,

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

  // build the main title
  Widget _buildAppBarTitle() {
    return Text(
      widget.title,
      style: const TextStyle(color: MyColors.myWhite, fontSize: 20),
    );
  }

  // build the search field
  Widget _buildSearchField() {
    return TextField(
      controller: _textController,

      // send the searched name to 'generic_favourites_screen'
      onChanged: (searchedAgent) {
        widget.onSearchChanged(searchedAgent);
      },

      decoration: InputDecoration(
        border: InputBorder.none,
        hint: Text(
          widget.hint,
          style: const TextStyle(color: MyColors.myWhite, fontSize: 20),
        ),
      ),
      style: const TextStyle(color: MyColors.myWhite, fontSize: 20),
    );
  }

  // build the app bar actions
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
    // creats another layer on top of the app bar
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:_stopSearching,));

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
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: MyColors.myWhite),

      title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
      backgroundColor: MyColors.myDarkRed,
      actions: _buildAppBarActions(),
    );
  }
}
