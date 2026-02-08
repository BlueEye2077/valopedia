import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions baseOpttions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio = Dio(baseOpttions);
  }

  // The function to get all the agents
  Future<List<dynamic>> getAllAgents() async {
    try {
      Response response = await dio.get("agents");
      print("agent api sent");
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }

  // The function to get all the maps
  Future<List<dynamic>> getAllMaps() async {
    try {
      Response response = await dio.get("maps");
      print("maps api sent");
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }

  // The function to get all the weapons
  Future<List<dynamic>> getAllWeapons() async {
    try {
      Response response = await dio.get("weapons");
      print("weapons api sent");
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }
}
