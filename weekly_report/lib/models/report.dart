import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weekly_report/models/profile.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
abstract class Report with _$Report {
  const Report._();

  const factory Report({
    @nullable String id,

    /// レコード作成日
    @TimestampConverter() @required DateTime createdAt,

    /// Twitter
    @nullable Map<String, dynamic> twitter,

    /// Twitter
    @nullable Map<String, dynamic> qiita,

    /// Twitter
    @nullable Map<String, dynamic> zenn,

    /// Twitter
    @nullable Map<String, dynamic> note,

    /// 週報生成日時
    @nullable DateTime lastGeneratedAt,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  factory Report.fromDocument(DocumentSnapshot snapshot) => Report.fromJson({
        ...snapshot.data(),
        'id': snapshot.id,
      });

  @override
  Map<String, dynamic> toJson() => _$_$_ReportToJson(this);

  Map<String, dynamic> toDocument() => {...toJson()}..remove('id');

  static Stream<List<Report>> stream({@required String userId}) {
    assert(userId != null);
    return FirebaseFirestore.instance.collection('users/${userId}/logs').snapshots().map((q) => q.docs
        .map(
          (d) => Report.fromDocument(d),
        )
        .toList());
  }
}
