class AppStrings {
  static const String mostWinningTeam = "Most Winning Team";
  static const String noResults = "No results yet";
  static const String gkInitials = "GK";
  static const String defInitials = "DEF";
  static const String mdfInitials = "MDF";
  static const String fwdInitials = "FWD";
  static const String notApplicable = "N/A";

  static const String undefinedError = "Undefined Network Error";
  static const String noInternetError = "No Internet Connection";
  static const String errorLabel = "ERROR";
}

class CodeStrings {
  static const String dateFormatterLocale = "en_US";
  static const String goalkeeperPosition = "Goalkeeper";
  static const String defenderPosition = "Defender";
  static const String midfielderPosition = "Midfielder";
  static const String attackerPosition = "Attacker";
  static const String homeTeam = "HOME_TEAM";
  static const String awayTeam = "AWAY_TEAM";
  static const String draw = "DRAW";

  //Exceptions
  static const String noMatches = "No matches played in this competition";
  static const String noTeam = "Could NOT find a team. Please try again";
  static const String negativePeriod =
      "Period of days MUST be a positive number";

  //Network
  static const String baseApi = 'https://api.football-data.org/v2/';
  static const String tokenKey = 'X-Auth-Token';
  static const String tokenValue = '73088ac0ab05426081a1810b71f81e7d';
  static const String matchStatus = 'status';
  static const String finishedStatus = 'FINISHED';

  //Competition Codes
  static const String englishPremierLeague = 'PL';
  static const String germanBundesliga = 'BL1';
  static const String spanishPrimeraDivision = 'PD';
  static const String italySerieA = 'SA';
  static const String frenchLigue1 = 'FL1';

  //Assets
  static const String placeholder = 'assets/images/stadium.png';
  static const String matchesMockPath =
      'assets/json/matches_response_mock.json';
  static const String competitionMockPath =
      'assets/json/competition_response_mock.json';
  static const String teamMockPath = 'assets/json/team_response_mock.json';
}
