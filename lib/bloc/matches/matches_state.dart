import 'package:bt_football/models/exports.dart';

abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class MostWinningTeamLoading extends MatchesState {}

class MostWinningTeamFetched extends MatchesState {
  final Team team;

  MostWinningTeamFetched(this.team);
}

class MostWinningTeamError extends MatchesState {
  final String message;

  MostWinningTeamError(this.message);
}
