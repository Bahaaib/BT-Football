import 'package:bt_football/bloc/matches/matches_bloc.dart';
import 'package:bt_football/bloc/matches/matches_state.dart';
import 'package:bt_football/ui/home/home_page.dart';
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
    testWidgets('when app starts, should display home page',
            (WidgetTester tester) async {
          await _testWidget(
              tester: tester,
              givenState: MatchesInitial(),
              expectedWidget: HomePage);
        });

    testWidgets('when start fetching a team, should display loading widget',
            (WidgetTester tester) async {
          await _testWidget(
              tester: tester,
              givenState: MostWinningTeamLoading(),
              expectedWidget: LoadingView);
        });
  });

  setUpAll(() async {
    _injectDependencies();
    BlocUtil.stubMatchesBloc();
  });

  tearDownAll(() => GetIt.instance.reset);
}
