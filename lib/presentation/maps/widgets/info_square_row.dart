import 'package:flutter/material.dart';

import '../../../data/models/map/valorant_map.dart';
import 'info_square.dart';

class InfoSquareRow extends StatelessWidget {
  const InfoSquareRow({
    super.key,
    required this.valorantMap,
  });

  final ValorantMap valorantMap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .max,
      children: [
        InfoSquare(
          title: "Coordinates",
          data: valorantMap.coordinates ?? "No Coordinates",
        ),
        InfoSquare(
          title: "Tactics",
          data: valorantMap.tacticalDescription ?? "A/B Sites",
        ),
      ],
    );
  }
}