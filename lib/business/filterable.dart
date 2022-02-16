import 'package:bt_football/models/exports.dart';

abstract class Filterable {
  List<int?>? getTeamIdsByMatchResult({required Match match}) =>
      throw UnimplementedError();
}
