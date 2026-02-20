import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import '../../constants/my_colors.dart';
import '../agents/agents_screen.dart';
import '../common/app_drawer.dart';
import '../maps/maps_screen.dart';
import '../weapons/weapons_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;
  late List<Widget> _appScreens;

  @override
  void initState() {
    super.initState();
    _appScreens = [
      const WeaponsScreen(),
      const AgentsScreen(),
      const MapsScreen(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildBottomNavigationBar() {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: MyColors.myDarkRed,
      index: _currentIndex,

      onTap: (index) => setState(() {
        _pageController.jumpToPage(index);
      }),
      items: const <Widget>[
        Icon(RpgAwesome.crossed_pistols, size: 32, color: MyColors.myWhite),
        Icon(RpgAwesome.double_team, size: 32, color: MyColors.myWhite),
        Icon(FontAwesome5.map, size: 32, color: MyColors.myWhite),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const AppDrawer(),

      body: PageView(
        controller: _pageController,
        children: _appScreens,
        onPageChanged: (index) => setState(() {
          _currentIndex = index;
        }),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
