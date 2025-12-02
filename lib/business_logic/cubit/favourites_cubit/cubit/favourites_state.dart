part of 'favourites_cubit.dart';

@immutable
sealed class FavouritesState {}

final class FavouritesInitial extends FavouritesState {}


class NoFavourites extends FavouritesState{}

class FavouriesLoaded extends FavouritesState {
  final List<Agent> favourites;

  FavouriesLoaded({required this.favourites});
}
