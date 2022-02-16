import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bt_football/network/contracts/base_client_generator.dart';
import 'package:bt_football/network/network_options/network_options.dart';
import 'package:get_it/get_it.dart';

class NetworkCreator {
  static NetworkCreator creator = NetworkCreator();
  final Dio _client = GetIt.instance<Dio>();

  Future<Response> request(
      {required BaseClientGenerator route, NetworkOptions? options}) {
    _client.interceptors.add(LogInterceptor());
    return _client.fetch(
      RequestOptions(
        baseUrl: route.baseURL,
        method: route.method,
        path: route.path,
        queryParameters: route.queryParameters,
        headers: route.header,
        data: route.body,
        sendTimeout: route.sendTimeout,
        receiveTimeout: route.sendTimeout,
        onReceiveProgress: options?.onReceiveProgress,
        validateStatus: (statusCode) => (statusCode! >= HttpStatus.ok &&
            statusCode <= HttpStatus.multipleChoices),
      ),
    );
  }
}
