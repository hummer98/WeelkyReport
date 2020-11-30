// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
class _$ReportTearOff {
  const _$ReportTearOff();

// ignore: unused_element
  _Report call(
      {@nullable String id,
      @required @TimestampConverter() DateTime createdAt,
      @nullable Map<String, dynamic> twitter,
      @nullable Map<String, dynamic> qiita,
      @nullable Map<String, dynamic> zenn,
      @nullable Map<String, dynamic> note,
      @nullable DateTime lastGeneratedAt}) {
    return _Report(
      id: id,
      createdAt: createdAt,
      twitter: twitter,
      qiita: qiita,
      zenn: zenn,
      note: note,
      lastGeneratedAt: lastGeneratedAt,
    );
  }

// ignore: unused_element
  Report fromJson(Map<String, Object> json) {
    return Report.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Report = _$ReportTearOff();

/// @nodoc
mixin _$Report {
  @nullable
  String get id;

  /// レコード作成日
  @TimestampConverter()
  DateTime get createdAt;

  /// Twitter
  @nullable
  Map<String, dynamic> get twitter;

  /// Twitter
  @nullable
  Map<String, dynamic> get qiita;

  /// Twitter
  @nullable
  Map<String, dynamic> get zenn;

  /// Twitter
  @nullable
  Map<String, dynamic> get note;

  /// 週報生成日時
  @nullable
  DateTime get lastGeneratedAt;

  Map<String, dynamic> toJson();
  $ReportCopyWith<Report> get copyWith;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      @TimestampConverter() DateTime createdAt,
      @nullable Map<String, dynamic> twitter,
      @nullable Map<String, dynamic> qiita,
      @nullable Map<String, dynamic> zenn,
      @nullable Map<String, dynamic> note,
      @nullable DateTime lastGeneratedAt});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object id = freezed,
    Object createdAt = freezed,
    Object twitter = freezed,
    Object qiita = freezed,
    Object zenn = freezed,
    Object note = freezed,
    Object lastGeneratedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      twitter:
          twitter == freezed ? _value.twitter : twitter as Map<String, dynamic>,
      qiita: qiita == freezed ? _value.qiita : qiita as Map<String, dynamic>,
      zenn: zenn == freezed ? _value.zenn : zenn as Map<String, dynamic>,
      note: note == freezed ? _value.note : note as Map<String, dynamic>,
      lastGeneratedAt: lastGeneratedAt == freezed
          ? _value.lastGeneratedAt
          : lastGeneratedAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) then) =
      __$ReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      @TimestampConverter() DateTime createdAt,
      @nullable Map<String, dynamic> twitter,
      @nullable Map<String, dynamic> qiita,
      @nullable Map<String, dynamic> zenn,
      @nullable Map<String, dynamic> note,
      @nullable DateTime lastGeneratedAt});
}

/// @nodoc
class __$ReportCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(_Report _value, $Res Function(_Report) _then)
      : super(_value, (v) => _then(v as _Report));

  @override
  _Report get _value => super._value as _Report;

  @override
  $Res call({
    Object id = freezed,
    Object createdAt = freezed,
    Object twitter = freezed,
    Object qiita = freezed,
    Object zenn = freezed,
    Object note = freezed,
    Object lastGeneratedAt = freezed,
  }) {
    return _then(_Report(
      id: id == freezed ? _value.id : id as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      twitter:
          twitter == freezed ? _value.twitter : twitter as Map<String, dynamic>,
      qiita: qiita == freezed ? _value.qiita : qiita as Map<String, dynamic>,
      zenn: zenn == freezed ? _value.zenn : zenn as Map<String, dynamic>,
      note: note == freezed ? _value.note : note as Map<String, dynamic>,
      lastGeneratedAt: lastGeneratedAt == freezed
          ? _value.lastGeneratedAt
          : lastGeneratedAt as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Report extends _Report with DiagnosticableTreeMixin {
  const _$_Report(
      {@nullable this.id,
      @required @TimestampConverter() this.createdAt,
      @nullable this.twitter,
      @nullable this.qiita,
      @nullable this.zenn,
      @nullable this.note,
      @nullable this.lastGeneratedAt})
      : assert(createdAt != null),
        super._();

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$_$_ReportFromJson(json);

  @override
  @nullable
  final String id;
  @override

  /// レコード作成日
  @TimestampConverter()
  final DateTime createdAt;
  @override

  /// Twitter
  @nullable
  final Map<String, dynamic> twitter;
  @override

  /// Twitter
  @nullable
  final Map<String, dynamic> qiita;
  @override

  /// Twitter
  @nullable
  final Map<String, dynamic> zenn;
  @override

  /// Twitter
  @nullable
  final Map<String, dynamic> note;
  @override

  /// 週報生成日時
  @nullable
  final DateTime lastGeneratedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Report(id: $id, createdAt: $createdAt, twitter: $twitter, qiita: $qiita, zenn: $zenn, note: $note, lastGeneratedAt: $lastGeneratedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Report'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('twitter', twitter))
      ..add(DiagnosticsProperty('qiita', qiita))
      ..add(DiagnosticsProperty('zenn', zenn))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('lastGeneratedAt', lastGeneratedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Report &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.twitter, twitter) ||
                const DeepCollectionEquality()
                    .equals(other.twitter, twitter)) &&
            (identical(other.qiita, qiita) ||
                const DeepCollectionEquality().equals(other.qiita, qiita)) &&
            (identical(other.zenn, zenn) ||
                const DeepCollectionEquality().equals(other.zenn, zenn)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.lastGeneratedAt, lastGeneratedAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastGeneratedAt, lastGeneratedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(twitter) ^
      const DeepCollectionEquality().hash(qiita) ^
      const DeepCollectionEquality().hash(zenn) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(lastGeneratedAt);

  @override
  _$ReportCopyWith<_Report> get copyWith =>
      __$ReportCopyWithImpl<_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReportToJson(this);
  }
}

abstract class _Report extends Report {
  const _Report._() : super._();
  const factory _Report(
      {@nullable String id,
      @required @TimestampConverter() DateTime createdAt,
      @nullable Map<String, dynamic> twitter,
      @nullable Map<String, dynamic> qiita,
      @nullable Map<String, dynamic> zenn,
      @nullable Map<String, dynamic> note,
      @nullable DateTime lastGeneratedAt}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  @nullable
  String get id;
  @override

  /// レコード作成日
  @TimestampConverter()
  DateTime get createdAt;
  @override

  /// Twitter
  @nullable
  Map<String, dynamic> get twitter;
  @override

  /// Twitter
  @nullable
  Map<String, dynamic> get qiita;
  @override

  /// Twitter
  @nullable
  Map<String, dynamic> get zenn;
  @override

  /// Twitter
  @nullable
  Map<String, dynamic> get note;
  @override

  /// 週報生成日時
  @nullable
  DateTime get lastGeneratedAt;
  @override
  _$ReportCopyWith<_Report> get copyWith;
}
