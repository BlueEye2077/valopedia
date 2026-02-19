import 'package:flutter/material.dart';
import '../../../data/models/map/valorant_map.dart';
import 'valorant_map_item.dart';

class MapsListView extends StatelessWidget {
  final List<ValorantMap> maps;

  const MapsListView({super.key, required this.maps});

  @override
  Widget build(BuildContext context) {
    return
    SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
            shrinkWrap: true, // To be compatible with SingleChildScrollView
            cacheExtent: 2000,
            physics: const BouncingScrollPhysics(),
            itemCount: maps.length,
            itemBuilder: (context, index) =>
                ValorantMapItem(valorantMap: maps[index]),
          ),
        ),
      
    );
  }
}
