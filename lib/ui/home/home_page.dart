import 'package:bt_football/bloc/matches/matches_bloc.dart';
import 'package:bt_football/bloc/matches/matches_event.dart';
import 'package:bt_football/bloc/matches/matches_state.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:bt_football/ui/shared_widgets/empty_widget.dart';
import 'package:bt_football/ui/shared_widgets/error_widget.dart';
import 'package:bt_football/ui/shared_widgets/loading_widget.dart';
import 'package:bt_football/ui/team/team_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _fetchMostWinningTeam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mostWinningTeam),
        actions: [
          IconButton(
            onPressed: _fetchMostWinningTeam,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<MatchesBloc, MatchesState>(
        builder: (_, state) => _mapViewToState(state),
      ),
    );
  }

  Widget _mapViewToState(MatchesState state) {
    if (state is MostWinningTeamLoading) {
      return const LoadingView();
    }

    if (state is MostWinningTeamError) {
      return ErrorView(message: state.message);
    }

    if (state is MostWinningTeamFetched) {
      return TeamInfo(team: state.team);
    }

    return const EmptyView();
  }

  void _fetchMostWinningTeam() {
    context.read<MatchesBloc>().add(MostWinningTeamRequested());
  }
}
