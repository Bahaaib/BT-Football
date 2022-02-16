import 'package:bt_football/business/filter.dart';
import 'package:bt_football/business/filter_types.dart';
import 'package:bt_football/models/exports.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/mock_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final Map<String, dynamic> _allMatchesResponse = {};

  setUpAll(() async {
    _allMatchesResponse.addAll(await MockUtil.loadMatchesJson());
  });

  Future<int> _getTopTeamIdFor({required Filter filter}) async {
    final List<Match> matches = List<Match>.from(_allMatchesResponse['matches']
        .map((item) => Match().fromJson(item))
        .toList());

    return filter.findTopTeamIdFor(playedMatches: matches);
  }

  test(
      'when matches is filtered by most winning team, '
          'it should get Manchester City FC', () async {
    const int manchesterCityTeamId = 65;
    int mostWinningTeam = await _getTopTeamIdFor(filter: MostWinning());

    expect(mostWinningTeam, manchesterCityTeamId);
  });
}
