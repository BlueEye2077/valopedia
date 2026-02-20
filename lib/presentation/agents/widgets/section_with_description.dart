import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';
import '../../common/section_title.dart';

class SectionWithDescription extends StatelessWidget {
  final String title;
  final String description;
  const SectionWithDescription({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: MyColors.mySilver, fontSize: 16),
          ),
        ],
      ),
    );
  }
}