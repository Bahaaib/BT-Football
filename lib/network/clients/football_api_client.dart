import 'package:bt_football/resources/strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bt_football/network/contracts/base_client_generator.dart';

part 'football_api_client.freezed.dart';

@freezed
class FootballApiClient extends BaseClientGenerator with _$FootballApiClient {
  const FootballApiClient._() : super();

  const factory FootballApiClient.matches(String competition) = _Matches;

  const factory FootballApiClient.competition(String competition) =
      _Competiotion;

  const factory FootballApiClient.team(int teamId) = _Team;

  @override
  String get baseURL => CodeStrings.baseApi;

  @override
  Map<String, dynamic> get header =>
      {CodeStrings.tokenKey: CodeStrings.tokenValue};

  @override
  String get path {
    return when<String>(
        matches: (String competition) => 'competitions/$competition/matches',
        competition: (String competition) => 'competitions/$competition',
        team: (int teamId) => 'teams/$teamId');
  }

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => 'GET',
    );
  }

  @override
  dynamic get body {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      matches: (_) => {CodeStrings.matchStatus: CodeStrings.finishedStatus},
      orElse: () {
        return null;
      },
    );
  }
}
