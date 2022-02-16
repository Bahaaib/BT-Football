import 'package:bt_football/network/contracts/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class Area extends BaseNetworkModel {
  final int? id;
  final String? name;

  Area({this.id, this.name});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => Area.fromJson(json);
}
