import 'package:flutter/material.dart';

import 'details_divider.dart';

class DividerWithSpace extends StatelessWidget {
  final double? space;
  const DividerWithSpace({super.key, this.space});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: space ?? 6),
        const DetailsDivider(),
        SizedBox(height: space ?? 6),
      ],
    );
  }
}