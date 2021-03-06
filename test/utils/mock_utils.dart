import 'dart:convert';

import 'package:bt_football/network/layers/network_connectivity.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockUtil {
  static Future<Map<String, dynamic>> loadMatchesJson() async {
    return await _loadJson(path: CodeStrings.matchesMockPath);
  }

  static Future<Map<String, dynamic>> loadCompetitionJson() async {
    return await _loadJson(path: CodeStrings.competitionMockPath);
  }

  static Future<Map<String, dynamic>> loadTeamJson() async {
    return await _loadJson(path: CodeStrings.teamMockPath);
  }

  static Future<Map<String, dynamic>> _loadJson({required String path}) async {
    final String mockResponse = await rootBundle.loadString(path);

    return json.decode(mockResponse);
  }

  static void setNetworkConnected() {
    _mockNetworkConnectivity(connected: true);
  }

  static void setNetworkDisconnected() {
    _mockNetworkConnectivity(connected: false);
  }

  static void _mockNetworkConnectivity({required bool connected}) {
    final NetworkConnectivity networkConnectivity =
        GetIt.instance<NetworkConnectivity>();

    when(networkConnectivity.connected).thenAnswer((_) async => connected);
  }
}
