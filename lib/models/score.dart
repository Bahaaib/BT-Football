import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score.g.dart';

@JsonSerializable()
class Score extends BaseNetworkModel {
  final String? winner;

  Score({this.winner});

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Score.fromJson(json);
}
