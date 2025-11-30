import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:valopedia/data/models/agent.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  List<Agent> favouriteAgents = [];

  FavouritesCubit() : super(FavouritesInitial());

  void toggleFavorites(Agent agent) {
    if (favouriteAgents.contains(agent)) {
      favouriteAgents = favouriteAgents
          .where((element) => element != agent)
          .toList();
      print("removed");
      emit(FavouriesLoaded(favourites: favouriteAgents));
    } else {
      favouriteAgents = [...favouriteAgents, agent];
      print("added");
      emit(FavouriesLoaded(favourites: favouriteAgents));
    }
  }

  bool isFavourite(Agent agent) {
    if (favouriteAgents.contains(agent)) {
      return true;
    } else {
      return false;
    }
  }
}
