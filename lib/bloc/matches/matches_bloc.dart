import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bt_football/bloc/matches/exports.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc() : super(MatchesInitial()) {
    on<MostWinningTeamRequested>(_findMostWinningTeam);
  }

  Future<void> _findMostWinningTeam(
      MatchesEvent event, Emitter<MatchesState> emit) async {}
}
