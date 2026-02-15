import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  const SectionTitle({
    super.key,
    required this.title,
    this.textAlign = .center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      textAlign: textAlign,

      style: const TextStyle(
        color: MyColors.myRed,
        fontSize: 24,
        fontWeight: .bold,
      ),
    );
  }
}
