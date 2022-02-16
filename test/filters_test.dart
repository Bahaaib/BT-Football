import 'package:bt_football/business/filter.dart';
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
}
