// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int?,
      area: json['area'] == null
          ? null
          : Area.fromJson(json['area'] as Map<String, dynamic>),
      name: json['name'] as String?,
      shortName: json['shortName'] as String?,
      abbreviation: json['tla'] as String?,
      logoUrl: json['crestUrl'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      email: json['email'] as String?,
      foundationYear: json['founded'] as int?,
      players: (json['squad'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'area': instance.area,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.abbreviation,
      'crestUrl': instance.logoUrl,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'email': instance.email,
      'founded': instance.foundationYear,
      'squad': instance.players,
    };
