import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class AgentWebServices {
  late Dio dio;

  AgentWebServices() {
    BaseOptions baseOpttions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio = Dio(baseOpttions);
  }

  Future<List<dynamic>>getAllAgents() async {
    try {
      Response response = await dio.get("agents");
      
      return response.data["data"];
    } catch (e) {
      return [];
    }
  }
}
