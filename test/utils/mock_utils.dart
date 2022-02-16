import 'dart:convert';

import 'package:flutter/services.dart';

class MockUtil {
  static Future<Map<String, dynamic>> _loadJson({required String path}) async {
    final String mockResponse = await rootBundle.loadString(path);

    return json.decode(mockResponse);
  }
}
