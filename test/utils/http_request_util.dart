import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'mock_utils.dart';

class RequestUtil {
  final Dio _dio = Dio();
  late DioAdapter _dioAdapter;

  Dio get mockHttpClient {
    _dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = _dioAdapter;
    return _dio;
  }

  Future<void> mockTeam() async {
    final Map<String, dynamic> response = await MockUtil.loadTeamJson();
    const String liverpoolTeamPath = 'teams/64';
    _mockHttpRequest(path: liverpoolTeamPath, response: response);
  }

  void _mockHttpRequest(
      {required String path,
        required Map<String, dynamic> response,
        Map<String, dynamic>? queryParams}) {
    _dioAdapter.onGet(path, (request) async {
      request.reply(200, response);
    },
        data: null,
        headers: {
          "X-Auth-Token": "73088ac0ab05426081a1810b71f81e7d",
          "content-type": "application/json; charset=utf-8"
        },
        queryParameters: queryParams);
  }
}
