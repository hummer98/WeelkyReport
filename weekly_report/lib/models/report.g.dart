// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$_$_ReportFromJson(Map<String, dynamic> json) {
  return _$_Report(
    id: json['id'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    startAt: json['startAt'] == null
        ? null
        : DateTime.parse(json['startAt'] as String),
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
    lastGeneratedAt: json['lastGeneratedAt'] == null
        ? null
        : DateTime.parse(json['lastGeneratedAt'] as String),
  );
}

Map<String, dynamic> _$_$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'lastGeneratedAt': instance.lastGeneratedAt?.toIso8601String(),
    };
