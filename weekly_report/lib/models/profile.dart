import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json?.toDate();

  @override
  Timestamp toJson(DateTime object) => object == null ? null : Timestamp.fromDate(object);
}

@freezed
abstract class Profile with _$Profile {
  const Profile._();
  const factory Profile({
    @required String id,
    @nullable String noteId,
    @nullable String twitterId,
    @nullable String qiitaId,
    @nullable String zennId,
    @TimestampConverter() DateTime createdAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  factory Profile.fromDocument(DocumentSnapshot snapshot) => Profile.fromJson({
        ...snapshot.data(),
        'id': snapshot.id,
      });

  @override
  Map<String, dynamic> toJson() => _$_$_ProfileToJson(this);
  Map<String, dynamic> toDocument() => {...toJson()}..remove('id');

  static Future<Profile> get(String id) async {
    final ref = FirebaseFirestore.instance.collection('users').doc(id);
    final snapshot = await ref.get();
    if (snapshot.exists) {
      return Profile.fromDocument(snapshot);
    } else {
      return Profile(id: id);
    }
  }

  Future save() {
    return FirebaseFirestore.instance.collection('users').doc(id).set(
          toDocument(),
          SetOptions(merge: true),
        );
  }
}
