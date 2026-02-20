import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/agent/agent.dart';
import '../../../data/repository/repository.dart';
import '../../../data/web_services/api_error_handler.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  final Repository repository;
  List<Agent> allAgents = [];

  AgentsCubit({required this.repository}) : super(AgentsInitial());

  Future<void> getAllAgents() async {
    if (allAgents.isNotEmpty) {
      emit(AgentsLoaded(allAgents));
      return;
    }

    try {
      allAgents = await repository.getAllAgents();
      emit(AgentsLoaded(allAgents));
    } catch (e) {
      emit(AgentsError(getErrorMessage(e)));
    }
  }
}
