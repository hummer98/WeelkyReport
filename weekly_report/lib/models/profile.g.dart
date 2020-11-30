// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$_$_ProfileFromJson(Map<String, dynamic> json) {
  return _$_Profile(
    id: json['id'] as String,
    noteId: json['noteId'] as String,
    twitterId: json['twitterId'] as String,
    qiitaId: json['qiitaId'] as String,
    zennId: json['zennId'] as String,
    createdAt:
        const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
  );
}

Map<String, dynamic> _$_$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'noteId': instance.noteId,
      'twitterId': instance.twitterId,
      'qiitaId': instance.qiitaId,
      'zennId': instance.zennId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
