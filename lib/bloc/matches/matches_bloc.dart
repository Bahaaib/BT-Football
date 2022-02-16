import 'package:bt_football/business/filter_types.dart';
import 'package:bt_football/models/exports.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:bt_football/services/matches_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bt_football/bloc/matches/exports.dart';
import 'package:get_it/get_it.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final MatchesService _matchesService = GetIt.instance<MatchesService>();

  MatchesBloc() : super(MatchesInitial()) {
    on<MostWinningTeamRequested>(_findMostWinningTeam);
  }

  Future<void> _findMostWinningTeam(
      MatchesEvent event, Emitter<MatchesState> emit) async {
    try {
      emit(MostWinningTeamLoading());
      Team mostWinningTeam = await _matchesService.getTopTeamBy(
        filter: MostWinning(),
        competition: CodeStrings.englishPremierLeague,
        periodInDays: 30,
      );

      emit(MostWinningTeamFetched(mostWinningTeam));
    } catch (error) {
      emit(MostWinningTeamError(error.toString()));
    }
  }
}
