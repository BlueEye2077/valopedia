import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color color;

  const AppLoadingIndicator({super.key, this.color = MyColors.myRed});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
