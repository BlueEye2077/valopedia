import 'package:flutter/material.dart';

class DetailsDivider extends StatelessWidget {
  static const _kDefaultColor = Color.fromARGB(97, 178, 180, 188);

  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;

  const DetailsDivider({
    super.key,
    this.color = _kDefaultColor,
    this.thickness = 1,
    this.indent = 15,
    this.endIndent = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      color: color,
      thickness: thickness,
      endIndent: endIndent,
    );
  }
}
