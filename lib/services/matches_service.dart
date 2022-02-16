import 'package:bt_football/models/exports.dart';

class MatchesService {
  DateTime _calculateStartDate(
          {required DateTime endDate, required int period}) =>
      throw UnimplementedError();

  bool _competitionEnded(DateTime? endDate) => throw UnimplementedError();

  Future<Team?> _findTopTeam({required int topTeamId}) async =>
      throw UnimplementedError();
}
