import 'package:bt_football/business/filterable.dart';

abstract class Filter implements Filterable {
  Map<int, int> _sortResultsOfPlayedMatches(Map<int, int> unsortedResults) =>
      throw UnimplementedError();

  Map<int, int> _extractResultsFromPlayedMatches(List<Match> playedMatches) =>
      throw UnimplementedError();
}
