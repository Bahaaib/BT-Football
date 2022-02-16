import 'package:bt_football/bloc/matches/exports.dart';
import 'package:bt_football/models/exports.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class BlocUtil {
  static void stubMatchesBloc() {
    final MatchesBloc matchesBloc = GetIt.instance<MatchesBloc>();
    final Team simpleTeam = Team(name: 'Liverpool FC', foundationYear: 1892);

    when(matchesBloc.stream).thenAnswer(
      (_) => Stream.fromIterable(
        [
          MatchesInitial(),
          MostWinningTeamLoading(),
          MostWinningTeamFetched(simpleTeam),
          MostWinningTeamError('Mock Error')
        ],
      ),
    );
  }
}
