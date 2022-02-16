import 'package:bt_football/network/layers/network_connectivity.dart';
import 'package:bt_football/network/layers/network_performer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';

import 'matches_service_test.mocks.dart';
import 'utils/http_request_util.dart';

@GenerateMocks([NetworkConnectivity])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final RequestUtil _requestsUtil = RequestUtil();

  void _injectDependencies() {
    GetIt.instance.registerSingleton<Dio>(_requestsUtil.mockHttpClient);
    GetIt.instance.registerLazySingleton<NetworkConnectivity>(
        () => MockNetworkConnectivity());
    GetIt.instance
        .registerLazySingleton<NetworkPerformer>(() => NetworkPerformer());
  }

  setUpAll(() async {
    _injectDependencies();
  });

  tearDownAll(() => GetIt.instance.reset());
}
