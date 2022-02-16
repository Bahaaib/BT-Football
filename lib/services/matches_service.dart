import 'package:bt_football/models/exports.dart';

class MatchesService {
  Future<Team> getTopTeamBy(
          {required periodInDays, required String competition}) async =>
      throw UnimplementedError();

  Future<List<Match>> fetchCompetitionMatches(String competition) async =>
      throw UnimplementedError();

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

  Future<Team?> _findTopTeam({required int topTeamId}) async =>
      throw UnimplementedError();
}
