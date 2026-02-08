part of 'favourites_cubit.dart';

@immutable
sealed class FavouritesState<T> {}

final class FavouritesInitial<T> extends FavouritesState<T> {}

class NoFavourites<T> extends FavouritesState<T> {}

class FavouritesLoaded<T> extends FavouritesState<T> {
  final List<T> favourites;

  FavouritesLoaded({required this.favourites});
}
