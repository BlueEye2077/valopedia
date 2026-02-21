import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/map/valorant_map.dart';
import '../../../data/repository/repository.dart';
import '../../../data/web_services/api_error_handler.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final Repository repository;
  List<ValorantMap> allMaps = [];

  MapsCubit({required this.repository}) : super(MapsInitial());

  Future<void> getAllMaps() async {
    if (allMaps.isNotEmpty) {
      emit(MapsLoaded(allMaps));
      return;
    }

    try {
      allMaps = await repository.getAllMaps();
      emit(MapsLoaded(allMaps));
    } catch (e) {
      emit(MapsError(getErrorMessage(e)));
    }
  }
}
