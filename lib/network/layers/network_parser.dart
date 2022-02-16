import 'package:dio/dio.dart';
import 'package:bt_football/network/contracts/base_network_model.dart';

class NetworkParser {
  static NetworkParser parser = NetworkParser();

  P parse<T extends BaseNetworkModel, P>(
      {required Response<dynamic> response,
      required T responseType,
      String? parserKey}) {
    try {
      dynamic responseData =
          parserKey != null ? response.data[parserKey] : response.data;

      if (responseData is List) {
        List list = responseData;

        P parsedList = List<T>.from(
            list.map((item) => responseType.fromJson(item)).toList()) as P;
        return parsedList;
      }
      P parsedInstance = responseType.fromJson(responseData) as P;
      return parsedInstance;
    } on TypeError catch (_) {
      rethrow;
    }
  }
}
