import 'package:bt_football/business/filterable.dart';

abstract class Filter implements Filterable {
  int findTopTeamIdFor({required List<Match> playedMatches}) =>
      throw UnimplementedError();

  Map<int, int> _sortResultsOfPlayedMatches(Map<int, int> unsortedResults) =>
      throw UnimplementedError();

  Map<int, int> _extractResultsFromPlayedMatches(List<Match> playedMatches) =>
      throw UnimplementedError();
}
