import '../models/agent/agent.dart';
import '../models/map/valorant_map.dart';
import '../models/weapon/weapon.dart';
import '../web_services/web_services.dart';

class Repository {
  final WebServices webServices;

  Repository({required this.webServices});

  // The function to get the agents
  Future<List<Agent>> getAllAgents() async {
    List<dynamic> response = await webServices.getAllAgents();
    return response.map((agent) => Agent.fromJson(agent)).toList();
  }

  // The function to get the maps
  Future<List<ValorantMap>> getAllMaps() async {
    List<dynamic> response = await webServices.getAllMaps();
    return response.map((map) => ValorantMap.fromJson(map)).toList();
  }

  // The function to get the weapons
  Future<List<Weapon>> getAllWeapons() async {
    List<dynamic> response = await webServices.getAllWeapons();
    return response.map((weapon) => Weapon.fromJson(weapon)).toList();
  }
}
