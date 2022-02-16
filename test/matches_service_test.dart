import 'package:bt_football/business/filter_types.dart';
import 'package:bt_football/network/layers/network_connectivity.dart';
import 'package:bt_football/network/layers/network_performer.dart';
import 'package:bt_football/network/network_models/network_error.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:bt_football/services/matches_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:bt_football/models/exports.dart';

import 'matches_service_test.mocks.dart';
import 'utils/http_request_util.dart';
import 'utils/mock_utils.dart';

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
    await _requestsUtil.prepareAllHttpMocks();
  });

  group('test matches service class', () {
    test(
        'when fetching competition matches while network is connected,'
        ' should get list of matches', () async {
      MockUtil.setNetworkConnected();
      List<Match> matches = await MatchesService()
          .fetchCompetitionMatches(CodeStrings.englishPremierLeague);

      expect(matches.isNotEmpty, true);
    });

    test(
        'when fetching competition matches while network is connected,'
        ' should throw a network error', () async {
      MockUtil.setNetworkDisconnected();

      expect(
          () async => MatchesService()
              .fetchCompetitionMatches(CodeStrings.englishPremierLeague),
          throwsA(isA<NetworkError>()));
    });

    test(
        'when fetching most winning team in last 30 days from (Feb 15, 2022),'
        'should show Liverpool FC', () async {
      MockUtil.setNetworkConnected();
      const int durationOf30Days = 30;
      const int liverpoolTeamId = 64;

      Team team = await MatchesService().getTopTeamBy(
          competition: CodeStrings.englishPremierLeague,
          filter: MostWinning(),
          periodInDays: durationOf30Days);

      expect(team.id, liverpoolTeamId);
    });
  });

  tearDownAll(() => GetIt.instance.reset());
}
