import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';
import 'package:valopedia/data/repository/agents_repository.dart';

part 'weapons_state.dart';

class WeaponsCubit extends Cubit<WeaponsState> {
  final AgentsRepository agentsRepository;
  List<Weapon> allWeapons = [];

  WeaponsCubit({required this.agentsRepository}) : super(WeaponsInitial());

  void getAllWeapons() {
    if (allWeapons.isNotEmpty) {
      emit(WeaponsLoaded(allWeapons));
      return;
    } else {
      agentsRepository.getAllWeapons().then((weapons) {
        allWeapons = weapons;
        emit(WeaponsLoaded(allWeapons));
        return;
      });
    }
  }
}
