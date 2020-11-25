// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

// ignore: unused_element
  _Profile call(
      {@required String id,
      @nullable String noteId,
      @nullable String twitterId,
      @nullable String qiitaId}) {
    return _Profile(
      id: id,
      noteId: noteId,
      twitterId: twitterId,
      qiitaId: qiitaId,
    );
  }

// ignore: unused_element
  Profile fromJson(Map<String, Object> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  String get id;
  @nullable
  String get noteId;
  @nullable
  String get twitterId;
  @nullable
  String get qiitaId;

  Map<String, dynamic> toJson();
  $ProfileCopyWith<Profile> get copyWith;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @nullable String noteId,
      @nullable String twitterId,
      @nullable String qiitaId});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object id = freezed,
    Object noteId = freezed,
    Object twitterId = freezed,
    Object qiitaId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      noteId: noteId == freezed ? _value.noteId : noteId as String,
      twitterId: twitterId == freezed ? _value.twitterId : twitterId as String,
      qiitaId: qiitaId == freezed ? _value.qiitaId : qiitaId as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @nullable String noteId,
      @nullable String twitterId,
      @nullable String qiitaId});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object id = freezed,
    Object noteId = freezed,
    Object twitterId = freezed,
    Object qiitaId = freezed,
  }) {
    return _then(_Profile(
      id: id == freezed ? _value.id : id as String,
      noteId: noteId == freezed ? _value.noteId : noteId as String,
      twitterId: twitterId == freezed ? _value.twitterId : twitterId as String,
      qiitaId: qiitaId == freezed ? _value.qiitaId : qiitaId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Profile extends _Profile with DiagnosticableTreeMixin {
  const _$_Profile(
      {@required this.id,
      @nullable this.noteId,
      @nullable this.twitterId,
      @nullable this.qiitaId})
      : assert(id != null),
        super._();

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$_$_ProfileFromJson(json);

  @override
  final String id;
  @override
  @nullable
  final String noteId;
  @override
  @nullable
  final String twitterId;
  @override
  @nullable
  final String qiitaId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Profile(id: $id, noteId: $noteId, twitterId: $twitterId, qiitaId: $qiitaId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Profile'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('noteId', noteId))
      ..add(DiagnosticsProperty('twitterId', twitterId))
      ..add(DiagnosticsProperty('qiitaId', qiitaId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Profile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.noteId, noteId) ||
                const DeepCollectionEquality().equals(other.noteId, noteId)) &&
            (identical(other.twitterId, twitterId) ||
                const DeepCollectionEquality()
                    .equals(other.twitterId, twitterId)) &&
            (identical(other.qiitaId, qiitaId) ||
                const DeepCollectionEquality().equals(other.qiitaId, qiitaId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(noteId) ^
      const DeepCollectionEquality().hash(twitterId) ^
      const DeepCollectionEquality().hash(qiitaId);

  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProfileToJson(this);
  }
}

abstract class _Profile extends Profile {
  const _Profile._() : super._();
  const factory _Profile(
      {@required String id,
      @nullable String noteId,
      @nullable String twitterId,
      @nullable String qiitaId}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String get id;
  @override
  @nullable
  String get noteId;
  @override
  @nullable
  String get twitterId;
  @override
  @nullable
  String get qiitaId;
  @override
  _$ProfileCopyWith<_Profile> get copyWith;
}
