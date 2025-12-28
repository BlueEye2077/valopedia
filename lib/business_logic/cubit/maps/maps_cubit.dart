import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valopedia/data/models/map/map.dart';
import 'package:valopedia/data/repository/agents_repository.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  AgentsRepository agentsRepository;
  List<ValorantMap> allMaps = [];

  MapsCubit({required this.agentsRepository}) : super(MapsInitial());

  void getAllMaps() {
    if (allMaps.isNotEmpty) {
      emit(MapsLoaded(allMaps));
      return;
    } else {
      agentsRepository.getAllMaps().then((maps) {
        allMaps = maps;
        emit(MapsLoaded(allMaps));
        return;
      });
    }
  }
}
