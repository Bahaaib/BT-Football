import 'package:bt_football/models/season.dart';
import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition.g.dart';

@JsonSerializable()
class Competition extends BaseNetworkModel {
  final Season? currentSeason;

  Competition({this.currentSeason});

  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Competition.fromJson(json);
}
