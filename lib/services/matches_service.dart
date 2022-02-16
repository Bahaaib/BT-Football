import 'package:bt_football/business/filter.dart';
import 'package:bt_football/models/exports.dart';
import 'package:bt_football/network/clients/football_api_client.dart';
import 'package:bt_football/network/layers/network_performer.dart';
import 'package:bt_football/network/network_models/network_error.dart';
import 'package:bt_football/network/network_models/network_result.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:get_it/get_it.dart';

class MatchesService {
  Future<Team> getTopTeamBy(
      {required Filter filter,
      required periodInDays,
      required String competition}) async {
    final List<Match> finishedMatches =
        await fetchCompetitionMatches(competition);

    if (finishedMatches.isEmpty) throw CodeStrings.noMatches;

    final List<Match> matchesInPeriod = await _getMatchesInPeriod(
      finishedMatches: finishedMatches,
      competition: competition,
      periodInDays: periodInDays,
    );

    int topTeamId = filter.findTopTeamIdFor(playedMatches: matchesInPeriod);

    Team? topTeam = await _findTopTeam(topTeamId: topTeamId);

    if (topTeam == null) throw CodeStrings.noTeam;

    return topTeam;
  }

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
      int periodInDays = 30}) async {
    if (periodInDays <= 0) throw CodeStrings.negativePeriod;

    final DateTime endDate = await _calculateEndDate(
        finishedMatches: finishedMatches, competition: competition);
    final DateTime startDate =
        _calculateStartDate(endDate: endDate, period: periodInDays);

    return finishedMatches
        .where((match) => _isInPeriod(match, startDate, endDate))
        .toList();
  }

  bool _isInPeriod(Match match, DateTime startDate, DateTime endDate) {
    if (match.date == null) return false;
    return match.date!.isAfter(startDate) && match.date!.isBefore(endDate);
  }

  Future<DateTime> _calculateEndDate(
      {required List<Match> finishedMatches,
      required String competition}) async {
    final DateTime? competitionEndDate =
        await _fetchCompetitionEndDay(competition: competition);

    if (_competitionEnded(competitionEndDate)) {
      return finishedMatches.last.date!;
    }

    return DateTime.now();
  }

  Future<DateTime?> _fetchCompetitionEndDay(
      {required String competition}) async {
    final Result<Competition, NetworkError> resultCompetition =
        await GetIt.instance<NetworkPerformer>()
            .perform<Competition, Competition>(
                route: FootballApiClient.competition(competition),
                responseType: Competition());

    Competition? result;

    resultCompetition.when(
        success: (comp) => result = comp, failure: (error) => throw error);
    return result?.currentSeason?.endDate;
  }

  DateTime _calculateStartDate(
      {required DateTime endDate, required int period}) {
    return endDate.subtract(Duration(days: period));
  }

  bool _competitionEnded(DateTime? endDate) {
    return endDate != null && endDate.isBefore(DateTime.now());
  }

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
