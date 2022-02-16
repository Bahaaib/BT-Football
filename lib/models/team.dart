import 'package:bt_football/models/exports.dart';
import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team extends BaseNetworkModel {
  final int? id;
  final Area? area;
  final String? name;
  final String? shortName;
  @JsonKey(name: 'tla')
  final String? abbreviation;
  @JsonKey(name: 'crestUrl')
  final String? logoUrl;
  final String? address;
  final String? phone;
  final String? website;
  final String? email;
  @JsonKey(name: 'founded')
  final int? foundationYear;
  @JsonKey(name: 'squad')
  final List<Player>? players;

  Team(
      {this.id,
      this.area,
      this.name,
      this.shortName,
      this.abbreviation,
      this.logoUrl,
      this.address,
      this.phone,
      this.website,
      this.email,
      this.foundationYear,
      this.players});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Team.fromJson(json);
}
