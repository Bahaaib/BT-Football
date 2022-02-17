import 'package:bt_football/bloc/matches/matches_bloc.dart';
import 'package:bt_football/bloc/matches/matches_state.dart';
import 'package:bt_football/models/exports.dart';
import 'package:bt_football/ui/home/home_page.dart';
import 'package:bt_football/ui/shared_widgets/exports.dart';
import 'package:bt_football/ui/team/landscape_team.dart';
import 'package:bt_football/ui/team/tablet_portrait_team.dart';
import 'package:bt_football/ui/team/team_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';
import 'utils/bloc_util.dart';

@GenerateMocks([MatchesBloc])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  void _injectDependencies() {
    GetIt.instance.registerLazySingleton<MatchesBloc>(() => MockMatchesBloc());
  }

  setUpAll(() async {
    _injectDependencies();
    BlocUtil.stubMatchesBloc();
  });

  Future<void> _testWidget(
      {required WidgetTester tester,
      required MatchesState givenState,
      required Type expectedWidget}) async {
    final MatchesBloc mockMatchesBloc = GetIt.instance<MatchesBloc>();
    when(mockMatchesBloc.state).thenAnswer((_) => givenState);

    Widget widget = MaterialApp(
      builder: (_, __) => BlocProvider<MatchesBloc>(
        create: (_) => mockMatchesBloc,
        child: const HomePage(),
      ),
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(widget);

    final Finder homePage = find.byType(expectedWidget);

    expect(homePage, findsOneWidget);
  }

  group('test home page states', () {
    testWidgets('when app starts, should display an empty home page',
            (WidgetTester tester) async {
          await _testWidget(
              tester: tester,
              givenState: MatchesInitial(),
              expectedWidget: EmptyView);
        });

    testWidgets('when start fetching a team, should display loading widget',
        (WidgetTester tester) async {
      await _testWidget(
          tester: tester,
          givenState: MostWinningTeamLoading(),
          expectedWidget: LoadingView);
    });

    testWidgets('when an error occurs during fetch, should display an error',
        (WidgetTester tester) async {
      await _testWidget(
          tester: tester,
          givenState: MostWinningTeamError('Mock Error'),
          expectedWidget: ErrorView);
    });

    testWidgets('when a team is fetched, should display team info',
        (WidgetTester tester) async {
      final Team simpleTeam = Team(name: 'Liverpool FC', foundationYear: 1892);
      await _testWidget(
          tester: tester,
          givenState: MostWinningTeamFetched(simpleTeam),
          expectedWidget: TeamInfo);
    });
  });

  Future<void> _testWidgetOrientation(
      {required WidgetTester tester,
      required Size orientationSize,
      required Type expectedWidget}) async {
    final MatchesBloc mockMatchesBloc = GetIt.instance<MatchesBloc>();
    final Team simpleTeam = Team(name: 'Liverpool FC', foundationYear: 1892);
    const double emulationRation = 3.0;
    when(mockMatchesBloc.state)
        .thenAnswer((_) => MostWinningTeamFetched(simpleTeam));
    tester.binding.window.physicalSizeTestValue =
        orientationSize * emulationRation;

    Widget widget = MaterialApp(
      builder: (_, __) => BlocProvider<MatchesBloc>(
        create: (_) => mockMatchesBloc,
        child: const HomePage(),
      ),
    );

    await tester.pumpWidget(widget);

    final Finder homePage = find.byType(expectedWidget);

    expect(homePage, findsOneWidget);

    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  }

  group('test home page orientation', () {
    testWidgets('when screen width > 600 px, should display in landscape mode',
        (WidgetTester tester) async {
      await _testWidgetOrientation(
          tester: tester,
          orientationSize: const Size(800, 600.0),
          expectedWidget: LandscapeTeam);
    });

    testWidgets(
        'when screen height > 600 px, should display in tablet portrait mode',
        (WidgetTester tester) async {
      await _testWidgetOrientation(
          tester: tester,
          orientationSize: const Size(1700, 2650),
          expectedWidget: TabletPortraitTeam);
    });
  });

  tearDownAll(() => GetIt.instance.reset);
}
