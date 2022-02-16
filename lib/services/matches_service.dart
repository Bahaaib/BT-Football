import 'package:bt_football/business/filter.dart';
import 'package:bt_football/models/exports.dart';
import 'package:bt_football/network/clients/football_api_client.dart';
import 'package:bt_football/network/layers/network_performer.dart';
import 'package:bt_football/network/network_models/network_error.dart';
import 'package:bt_football/network/network_models/network_result.dart';
import 'package:get_it/get_it.dart';

class MatchesService {
  Future<Team> getTopTeamBy(
          {required Filter filter,
          required periodInDays,
          required String competition}) async =>
      throw UnimplementedError();

  Future<List<Match>> fetchCompetitionMatches(String competition) async {
    final Result<List<Match>, NetworkError> matchesResult =
        await GetIt.instance<NetworkPerformer>().perform<Match, List<Match>>(
            route: FootballApiClient.matches(competition),
            responseType: Match(),
            parserKey: 'matches');

    final List<Match> finishedMatches = [];

    matchesResult.when(
        success: (matches) => finishedMatches.addAll(matches),
        failure: (error) => throw error);

    return finishedMatches;
  }

  Future<List<Match>> _getMatchesInPeriod(
          {required List<Match> finishedMatches,
          required String competition,
          int periodInDays = 30}) async =>
      throw UnimplementedError();

  bool _isInPeriod(Match match, DateTime startDate, DateTime endDate) =>
      throw UnimplementedError();

  Future<DateTime?> _fetchCompetitionEndDay(
          {required String competition}) async =>
      throw UnimplementedError();

  DateTime _calculateStartDate(
          {required DateTime endDate, required int period}) =>
      throw UnimplementedError();

  bool _competitionEnded(DateTime? endDate) => throw UnimplementedError();

  Future<Team?> _findTopTeam({required int topTeamId}) async {
    Result<Team, NetworkError> resultTeam =
    await GetIt.instance<NetworkPerformer>().perform<Team, Team>(
        route: FootballApiClient.team(topTeamId), responseType: Team());

    Team? topTeam;

    resultTeam.when(
        success: (team) => topTeam = team, failure: (error) => throw error);

    return topTeam;
  }
}
