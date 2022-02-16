import 'package:dio/dio.dart';
import 'package:bt_football/network/contracts/base_client_generator.dart';
import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:bt_football/network/layers/network_connectivity.dart';
import 'package:bt_football/network/layers/network_creator.dart';
import 'package:bt_football/network/layers/network_parser.dart';
import 'package:bt_football/network/network_models/network_error.dart';
import 'package:bt_football/network/network_models/network_result.dart';
import 'package:bt_football/network/network_options/network_options.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:get_it/get_it.dart';

class NetworkPerformer {
  Future<Result<P, NetworkError>> perform<T extends BaseNetworkModel, P>(
      {required BaseClientGenerator route,
      required T responseType,
      NetworkOptions? options,
      String? parserKey}) async {
    if (await GetIt.instance<NetworkConnectivity>().connected) {
      try {
        Response response = await NetworkCreator.creator
            .request(route: route, options: options);
        P data = NetworkParser.parser.parse<T, P>(
            response: response,
            responseType: responseType,
            parserKey: parserKey);
        return Result.success(data);
      } on DioError catch (diorError) {
        return Result.failure(
          NetworkError.request(
              error: diorError.response?.data['message'] ??
                  AppStrings.undefinedError),
        );
      } on TypeError catch (e) {
        return Result.failure(NetworkError.type(error: e.toString()));
      }
    }
    return const Result.failure(
        NetworkError.connectivity(message: AppStrings.noInternetError));
  }
}
