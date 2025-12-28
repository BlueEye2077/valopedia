import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../data/models/agent/agent.dart';
import '../../../data/repository/agents_repository.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  final AgentsRepository agentsRepository;
  List<Agent> allAgents = [];
  List<Agent> searchedAgents = [];

  AgentsCubit({required this.agentsRepository}) : super(AgentsInitial());

  void getAllAgents() {
    if (allAgents.isNotEmpty) {
      emit(AgentsLoaded(allAgents));
      print("still there");
      return;
    } else {
      agentsRepository.getAllAgents().then((agents) {
        allAgents = agents;
        print("another api call my guy");
        emit(AgentsLoaded(allAgents));
        return;
      });
    }
  }
}
