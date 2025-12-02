import '../models/agent.dart';
import '../web_services/agents_web_services.dart';

class AgentsRepository {
  List<Agent> agents = [];

  final AgentWebServices agentWebServices;

  AgentsRepository({required this.agentWebServices});

  Future<List<Agent>> getAllAgents() async {
    List<dynamic> response = await agentWebServices.getAllAgents();
    agents = response.map((agent) => Agent.fromJson(agent)).toList();
    return agents;
  }
}
