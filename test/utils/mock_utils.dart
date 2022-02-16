import 'dart:convert';

import 'package:flutter/services.dart';

class MockUtil {
  static Future<Map<String, dynamic>> loadMatchesJson() async {
    return await _loadJson(path: 'assets/json/matches_response_mock.json');
  }

  static Future<Map<String, dynamic>> loadCompetitionJson() async {
    return await _loadJson(path: 'assets/json/competition_response_mock.json');
  }

  static Future<Map<String, dynamic>> loadTeamJson() async {
    return await _loadJson(path: 'assets/json/team_response_mock.json');
  }

  static Future<Map<String, dynamic>> _loadJson({required String path}) async {
    final String mockResponse = await rootBundle.loadString(path);

    return json.decode(mockResponse);
  }
}
