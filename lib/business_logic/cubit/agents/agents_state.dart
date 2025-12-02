part of 'agents_cubit.dart';

@immutable
sealed class AgentsState {}

final class AgentsInitial extends AgentsState {}

class AgentsLoaded extends AgentsState {
  final List<Agent> agents;
  AgentsLoaded(this.agents);
}
