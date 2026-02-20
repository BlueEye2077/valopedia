import 'package:flutter/material.dart';

class CustomCorners extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Color color;
  final double width;

  const CustomCorners({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,

      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            top: top != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
            left: left != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
            right: right != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
            bottom: bottom != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
