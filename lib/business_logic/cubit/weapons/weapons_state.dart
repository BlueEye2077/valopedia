part of 'weapons_cubit.dart';

@immutable
sealed class WeaponsState {}

final class WeaponsInitial extends WeaponsState {}

final class WeaponsLoaded extends WeaponsState {
  final List<Weapon> weapons;
  WeaponsLoaded(this.weapons);
}

class WeaponsError extends WeaponsState {
  final String error;
  WeaponsError(this.error);
}
