import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'favourites_state.dart';

class FavouritesCubit<T> extends Cubit<FavouritesState<T>> {
  List<T> favourites = [];

  FavouritesCubit() : super(FavouritesInitial());

  void isFavouritesEmpty() {
    if (favourites.isEmpty) {
      emit(NoFavourites());
    }
  }

  void toggleFavourites(T item) {
    if (favourites.contains(item)) {
      favourites = favourites.where((element) => element != item).toList();
      if (favourites.isEmpty) {
        emit(NoFavourites());
      } else {
        emit(FavouritesLoaded(favourites: favourites));
      }
    } else {
      favourites = [...favourites, item];
      print(("is added"));
      print((favourites));
      emit(FavouritesLoaded(favourites: favourites));
      
    }
  }

  bool isFavourite(T item) {
    if (favourites.contains(item)) {
      return true;
    } else {
      return false;
    }
  }
}
