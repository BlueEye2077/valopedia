import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio = Dio(baseOptions);
  }

  // The function to get all the agents
  Future<List<dynamic>> getAllAgents() async {
    try {
      Response response = await dio.get("agents");
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }

  // The function to get all the maps
  Future<List<dynamic>> getAllMaps() async {
    try {
      Response response = await dio.get("maps");
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }

  // The function to get all the weapons
  Future<List<dynamic>> getAllWeapons() async {
    try {
      Response response = await dio.get("weapons");
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }
}
