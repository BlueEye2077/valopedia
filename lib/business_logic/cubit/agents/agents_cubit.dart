import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../data/models/agent.dart';
import '../../../data/repository/agents_repository.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  final AgentsRepository agentsRepository;
  List<Agent> allAgents = [];
  List<Agent> searchedAgents = [];

  AgentsCubit({required this.agentsRepository}) : super(AgentsInitial());

  void getAllAgents() {
    agentsRepository.getAllAgents().then((agents) {
      allAgents = agents;
      emit(AgentsLoaded(allAgents));
    });
  }
}
