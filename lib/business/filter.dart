import 'package:bt_football/business/filterable.dart';
import 'package:bt_football/models/exports.dart';

abstract class Filter implements Filterable {
  int findTopTeamIdFor({required List<Match> playedMatches}) =>
      throw UnimplementedError();

  Map<int, int> _sortResultsOfPlayedMatches(Map<int, int> unsortedResults) {
    final List<MapEntry<int, int>> orderedEntries = unsortedResults.entries
        .toList()
      ..sort((teamA, teamB) => teamA.value.compareTo(teamB.value));

    return Map.fromEntries(orderedEntries);
  }

  Map<int, int> _extractResultsFromPlayedMatches(List<Match> playedMatches) {
    final Map<int, int> teamsResult = {};

    for (int i = 0; i < playedMatches.length; i++) {
      final List<int?>? opponentsIds =
          getTeamIdsByMatchResult(match: playedMatches[i]);
      if (opponentsIds == null || opponentsIds.isEmpty) continue;

      final int? firstOpponentId = opponentsIds.first;
      if (firstOpponentId == null) continue;
      teamsResult.update(firstOpponentId, (result) => ++result,
          ifAbsent: () => 1);

      //In case of a draw, a second opponent ID is provided
      if (opponentsIds.length < 2) continue;
      teamsResult.update(opponentsIds[1]!, (result) => ++result,
          ifAbsent: () => 1);
    }

    return teamsResult;
  }
}
