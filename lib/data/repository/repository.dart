import '../models/agent/agent.dart';
import '../models/map/valorant_map.dart';
import '../models/weapon/weapon.dart';
import '../web_services/web_services.dart';

class Repository {
  List<Agent> agents = [];
  List<ValorantMap> maps = [];
  List<Weapon> weapons = [];
  final WebServices webServices;

  Repository({required this.webServices});

  // The function to get the agents
  Future<List<Agent>> getAllAgents() async {
    List<dynamic> response = await webServices.getAllAgents();
    agents = response.map((agent) => Agent.fromJson(agent)).toList();
    return agents;
  }

  // The function to get the maps
  Future<List<ValorantMap>> getAllMaps() async {
    List<dynamic> response = await webServices.getAllMaps();
    maps = response.map((map) => ValorantMap.fromJson(map)).toList();
    return maps;
  }

  // The function to get the weapons
  Future<List<Weapon>> getAllWeapons() async {
    List<dynamic> response = await webServices.getAllWeapons();
    weapons = response.map((weapon) => Weapon.fromJson(weapon)).toList();
    return weapons;
  }
}
