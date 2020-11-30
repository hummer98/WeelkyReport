// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$_$_ReportFromJson(Map<String, dynamic> json) {
  return _$_Report(
    id: json['id'] as String,
    createdAt:
        const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    twitter: json['twitter'] as Map<String, dynamic>,
    qiita: json['qiita'] as Map<String, dynamic>,
    zenn: json['zenn'] as Map<String, dynamic>,
    note: json['note'] as Map<String, dynamic>,
    lastGeneratedAt: json['lastGeneratedAt'] == null
        ? null
        : DateTime.parse(json['lastGeneratedAt'] as String),
  );
}

Map<String, dynamic> _$_$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'twitter': instance.twitter,
      'qiita': instance.qiita,
      'zenn': instance.zenn,
      'note': instance.note,
      'lastGeneratedAt': instance.lastGeneratedAt?.toIso8601String(),
    };
