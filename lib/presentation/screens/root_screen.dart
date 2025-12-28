import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/presentation/screens/agents_screen.dart';
import 'package:valopedia/presentation/screens/maps_screen.dart';
import 'package:valopedia/presentation/screens/weapons_screen.dart';
import 'package:valopedia/presentation/widgets/app_drawer.dart';

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
    return BottomNavigationBar(
      backgroundColor: MyColors.myDarkRed,
      currentIndex: _currentIndex,
      onTap: (index) => setState(() {
        _pageController.jumpToPage(index);
      }),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.gavel), label: "Weapons"),
        BottomNavigationBarItem(
          icon: Icon(Icons.co_present_rounded),
          label: "Agents",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.map_sharp), label: "Maps"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
