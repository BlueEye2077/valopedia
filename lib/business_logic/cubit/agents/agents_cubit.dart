import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/agent/agent.dart';
import '../../../data/repository/repository.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  final Repository agentsRepository;
  List<Agent> allAgents = [];

  AgentsCubit({required this.agentsRepository}) : super(AgentsInitial());

  void getAllAgents() {
    // if (allAgents.isNotEmpty) {
    //   emit(AgentsLoaded(allAgents));
    //   print("still there");
    //   return;
    // } else {
      agentsRepository.getAllAgents().then((agents) {
        allAgents = agents;
        emit(AgentsLoaded(allAgents));
        return;
      });
    // }
  }
}
