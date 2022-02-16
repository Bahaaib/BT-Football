import 'package:bt_football/bloc/matches/matches_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';

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

  tearDownAll(() => GetIt.instance.reset);
}
