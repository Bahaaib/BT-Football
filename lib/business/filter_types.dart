import 'package:bt_football/business/filter.dart';
import 'package:bt_football/models/match.dart';
import 'package:bt_football/models/score.dart';
import 'package:bt_football/resources/strings.dart';

class MostWinning extends Filter {
  @override
  List<int?>? getTeamIdsByMatchResult({required Match match}) {
    final Score? score = match.score;
    if (score == null || score.winner == CodeStrings.draw) return null;
    if (score.winner == CodeStrings.homeTeam) return [match.awayTeam?.id];
    return [match.awayTeam?.id];
  }
}

class MostLosing extends Filter {
  @override
  List<int?>? getTeamIdsByMatchResult({required Match match}) {
    final Score? score = match.score;
    if (score == null || score.winner == CodeStrings.draw) return null;
    if (score.winner == CodeStrings.homeTeam) return [match.awayTeam?.id];
    return [match.homeTeam?.id];
  }
}

class MostDraw extends Filter {
  @override
  List<int?>? getTeamIdsByMatchResult({required Match match}) {
    // TODO: implement getTeamIdsByMatchResult
    throw UnimplementedError();
  }
}
