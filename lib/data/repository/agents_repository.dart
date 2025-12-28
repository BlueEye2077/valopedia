import 'package:valopedia/data/models/map/map.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';

import '../models/agent/agent.dart';
import '../web_services/agents_web_services.dart';

class AgentsRepository {
  List<Agent> agents = [];
  List<ValorantMap> maps = [];
  List<Weapon> weapons = [];

  final AgentWebServices agentWebServices;

  AgentsRepository({required this.agentWebServices});

  Future<List<Agent>> getAllAgents() async {
    List<dynamic> response = await agentWebServices.getAllAgents();
    agents = response.map((agent) => Agent.fromJson(agent)).toList();
    return agents;
  }

  Future<List<ValorantMap>> getAllMaps() async {
    List<dynamic> response = await agentWebServices.getAllMaps();
    maps = response.map((map) => ValorantMap.fromJson(map)).toList();
    return maps;
  }

  Future<List<Weapon>> getAllWeapons() async {
    List<dynamic> response = await agentWebServices.getAllWeapons();
    weapons = response.map((weapon) => Weapon.fromJson(weapon)).toList();
    return weapons;
  }
}
