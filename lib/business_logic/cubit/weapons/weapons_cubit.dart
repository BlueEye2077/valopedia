import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/weapon/weapon.dart';
import '../../../data/repository/repository.dart';

part 'weapons_state.dart';

class WeaponsCubit extends Cubit<WeaponsState> {
  final Repository agentsRepository;
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
