import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/map/valorant_map.dart';
import '../../../data/repository/repository.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  Repository agentsRepository;
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
