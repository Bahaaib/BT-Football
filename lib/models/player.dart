import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player extends BaseNetworkModel {
  int? id;
  String? name;
  String? position;
  String? dateOfBirth;
  String? countryOfBirth;
  String? nationality;
  String? role;

  Player(
      {this.id,
      this.name,
      this.position,
      this.dateOfBirth,
      this.countryOfBirth,
      this.nationality,
      this.role});

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Player.fromJson(json);
}
