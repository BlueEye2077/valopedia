part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

final class MapsInitial extends MapsState {}

class MapsLoaded extends MapsState {
  final List<ValorantMap> maps;
  MapsLoaded(this.maps);
}

class MapsError extends MapsState {
  final String error;
  MapsError(this.error);
}
