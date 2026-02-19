import 'dart:async';

import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../common/app_loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, rootScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: .bottomCenter,
        fit: .expand,
        children: [
          Image.asset("assets/images/splash.jpg", fit: .cover),
          const Positioned(
            bottom: 45,
            child: AppLoadingIndicator(color: MyColors.myLightGrey),
          ),
        ],
      ),
    );
  }
}
