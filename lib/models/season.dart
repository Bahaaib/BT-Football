import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable()
class Season extends BaseNetworkModel {
  final DateTime? startDate;
  final DateTime? endDate;

  Season({this.startDate, this.endDate});

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Season.fromJson(json);
}
