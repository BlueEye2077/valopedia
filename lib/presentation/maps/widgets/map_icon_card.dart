import 'package:flutter/material.dart';

class MapIconCard extends StatelessWidget {
  final Widget child;
  final double? height;
  const MapIconCard({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(89, 178, 180, 188)),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      elevation: 3,
      color: const Color(0xFF1F2B38),
      child: Container(
        width: .infinity,
        height: height,
        margin: const .all(12),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 214, 213, 213),
        ),
        child: child,
      ),
    );
  }
}