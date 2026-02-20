import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/weapon/weapon.dart';
import '../../../data/repository/repository.dart';
import '../../../data/web_services/api_error_handler.dart';

part 'weapons_state.dart';

class WeaponsCubit extends Cubit<WeaponsState> {
  final Repository repository;
  List<Weapon> allWeapons = [];

  WeaponsCubit({required this.repository}) : super(WeaponsInitial());

  Future<void> getAllWeapons() async {
    if (allWeapons.isNotEmpty) {
      emit(WeaponsLoaded(allWeapons));
      return;
    }

    try {
      allWeapons = await repository.getAllWeapons();
      emit(WeaponsLoaded(allWeapons));
    } catch (e) {
      emit(WeaponsError(getErrorMessage(e)));
    }
  }
}
