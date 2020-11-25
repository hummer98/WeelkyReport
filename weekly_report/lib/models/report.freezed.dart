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
      @required DateTime createdAt,
      @required DateTime startAt,
      @required DateTime endAt,
      @nullable DateTime lastGeneratedAt}) {
    return _Report(
      id: id,
      createdAt: createdAt,
      startAt: startAt,
      endAt: endAt,
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
  DateTime get createdAt;

  /// 集計開始日
  DateTime get startAt;

  /// 集計最終日(開始日+7day - 1sec)
  DateTime get endAt;

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
      DateTime createdAt,
      DateTime startAt,
      DateTime endAt,
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
    Object startAt = freezed,
    Object endAt = freezed,
    Object lastGeneratedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      startAt: startAt == freezed ? _value.startAt : startAt as DateTime,
      endAt: endAt == freezed ? _value.endAt : endAt as DateTime,
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
      DateTime createdAt,
      DateTime startAt,
      DateTime endAt,
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
    Object startAt = freezed,
    Object endAt = freezed,
    Object lastGeneratedAt = freezed,
  }) {
    return _then(_Report(
      id: id == freezed ? _value.id : id as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      startAt: startAt == freezed ? _value.startAt : startAt as DateTime,
      endAt: endAt == freezed ? _value.endAt : endAt as DateTime,
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
      @required this.createdAt,
      @required this.startAt,
      @required this.endAt,
      @nullable this.lastGeneratedAt})
      : assert(createdAt != null),
        assert(startAt != null),
        assert(endAt != null),
        super._();

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$_$_ReportFromJson(json);

  @override
  @nullable
  final String id;
  @override

  /// レコード作成日
  final DateTime createdAt;
  @override

  /// 集計開始日
  final DateTime startAt;
  @override

  /// 集計最終日(開始日+7day - 1sec)
  final DateTime endAt;
  @override

  /// 週報生成日時
  @nullable
  final DateTime lastGeneratedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Report(id: $id, createdAt: $createdAt, startAt: $startAt, endAt: $endAt, lastGeneratedAt: $lastGeneratedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Report'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('endAt', endAt))
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
            (identical(other.startAt, startAt) ||
                const DeepCollectionEquality()
                    .equals(other.startAt, startAt)) &&
            (identical(other.endAt, endAt) ||
                const DeepCollectionEquality().equals(other.endAt, endAt)) &&
            (identical(other.lastGeneratedAt, lastGeneratedAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastGeneratedAt, lastGeneratedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(startAt) ^
      const DeepCollectionEquality().hash(endAt) ^
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
      @required DateTime createdAt,
      @required DateTime startAt,
      @required DateTime endAt,
      @nullable DateTime lastGeneratedAt}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  @nullable
  String get id;
  @override

  /// レコード作成日
  DateTime get createdAt;
  @override

  /// 集計開始日
  DateTime get startAt;
  @override

  /// 集計最終日(開始日+7day - 1sec)
  DateTime get endAt;
  @override

  /// 週報生成日時
  @nullable
  DateTime get lastGeneratedAt;
  @override
  _$ReportCopyWith<_Report> get copyWith;
}
