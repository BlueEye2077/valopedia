import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valopedia/data/models/agent.dart';
import 'package:valopedia/data/repository/agents_repository.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  final AgentsRepository agentsRepository;

  AgentsCubit({required this.agentsRepository}) : super(AgentsInitial());

  void getAllAgents() {
    agentsRepository.getAllAgents().then((agents) {
      emit(AgentsLoaded(agents));
    });
  }
}
