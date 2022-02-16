import 'package:bt_football/models/exports.dart';
import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match extends BaseNetworkModel {
  final int? id;
  @JsonKey(name: 'utcDate')
  final DateTime? date;
  final Score? score;
  final Team? homeTeam;
  final Team? awayTeam;

  Match({this.id, this.date, this.score, this.homeTeam, this.awayTeam});

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Match.fromJson(json);
}
