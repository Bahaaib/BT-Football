// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Competition _$CompetitionFromJson(Map<String, dynamic> json) => Competition(
      currentSeason: json['currentSeason'] == null
          ? null
          : Season.fromJson(json['currentSeason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'currentSeason': instance.currentSeason,
    };
