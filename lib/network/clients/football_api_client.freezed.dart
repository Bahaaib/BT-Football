// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'football_api_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FootballApiClientTearOff {
  const _$FootballApiClientTearOff();

  _Matches matches(String competition) {
    return _Matches(
      competition,
    );
  }

  _Competiotion competition(String competition) {
    return _Competiotion(
      competition,
    );
  }

  _Team team(int teamId) {
    return _Team(
      teamId,
    );
  }
}

/// @nodoc
const $FootballApiClient = _$FootballApiClientTearOff();

/// @nodoc
mixin _$FootballApiClient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String competition) matches,
    required TResult Function(String competition) competition,
    required TResult Function(int teamId) team,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Matches value) matches,
    required TResult Function(_Competiotion value) competition,
    required TResult Function(_Team value) team,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FootballApiClientCopyWith<$Res> {
  factory $FootballApiClientCopyWith(
          FootballApiClient value, $Res Function(FootballApiClient) then) =
      _$FootballApiClientCopyWithImpl<$Res>;
}

/// @nodoc
class _$FootballApiClientCopyWithImpl<$Res>
    implements $FootballApiClientCopyWith<$Res> {
  _$FootballApiClientCopyWithImpl(this._value, this._then);

  final FootballApiClient _value;
  // ignore: unused_field
  final $Res Function(FootballApiClient) _then;
}

/// @nodoc
abstract class _$MatchesCopyWith<$Res> {
  factory _$MatchesCopyWith(_Matches value, $Res Function(_Matches) then) =
      __$MatchesCopyWithImpl<$Res>;
  $Res call({String competition});
}

/// @nodoc
class __$MatchesCopyWithImpl<$Res> extends _$FootballApiClientCopyWithImpl<$Res>
    implements _$MatchesCopyWith<$Res> {
  __$MatchesCopyWithImpl(_Matches _value, $Res Function(_Matches) _then)
      : super(_value, (v) => _then(v as _Matches));

  @override
  _Matches get _value => super._value as _Matches;

  @override
  $Res call({
    Object? competition = freezed,
  }) {
    return _then(_Matches(
      competition == freezed
          ? _value.competition
          : competition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Matches extends _Matches {
  const _$_Matches(this.competition) : super._();

  @override
  final String competition;

  @override
  String toString() {
    return 'FootballApiClient.matches(competition: $competition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Matches &&
            const DeepCollectionEquality()
                .equals(other.competition, competition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(competition));

  @JsonKey(ignore: true)
  @override
  _$MatchesCopyWith<_Matches> get copyWith =>
      __$MatchesCopyWithImpl<_Matches>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String competition) matches,
    required TResult Function(String competition) competition,
    required TResult Function(int teamId) team,
  }) {
    return matches(this.competition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
  }) {
    return matches?.call(this.competition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
    required TResult orElse(),
  }) {
    if (matches != null) {
      return matches(this.competition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Matches value) matches,
    required TResult Function(_Competiotion value) competition,
    required TResult Function(_Team value) team,
  }) {
    return matches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
  }) {
    return matches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
    required TResult orElse(),
  }) {
    if (matches != null) {
      return matches(this);
    }
    return orElse();
  }
}

abstract class _Matches extends FootballApiClient {
  const factory _Matches(String competition) = _$_Matches;
  const _Matches._() : super._();

  String get competition;
  @JsonKey(ignore: true)
  _$MatchesCopyWith<_Matches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CompetiotionCopyWith<$Res> {
  factory _$CompetiotionCopyWith(
          _Competiotion value, $Res Function(_Competiotion) then) =
      __$CompetiotionCopyWithImpl<$Res>;
  $Res call({String competition});
}

/// @nodoc
class __$CompetiotionCopyWithImpl<$Res>
    extends _$FootballApiClientCopyWithImpl<$Res>
    implements _$CompetiotionCopyWith<$Res> {
  __$CompetiotionCopyWithImpl(
      _Competiotion _value, $Res Function(_Competiotion) _then)
      : super(_value, (v) => _then(v as _Competiotion));

  @override
  _Competiotion get _value => super._value as _Competiotion;

  @override
  $Res call({
    Object? competition = freezed,
  }) {
    return _then(_Competiotion(
      competition == freezed
          ? _value.competition
          : competition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Competiotion extends _Competiotion {
  const _$_Competiotion(this.competition) : super._();

  @override
  final String competition;

  @override
  String toString() {
    return 'FootballApiClient.competition(competition: $competition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Competiotion &&
            const DeepCollectionEquality()
                .equals(other.competition, competition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(competition));

  @JsonKey(ignore: true)
  @override
  _$CompetiotionCopyWith<_Competiotion> get copyWith =>
      __$CompetiotionCopyWithImpl<_Competiotion>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String competition) matches,
    required TResult Function(String competition) competition,
    required TResult Function(int teamId) team,
  }) {
    return competition(this.competition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
  }) {
    return competition?.call(this.competition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
    required TResult orElse(),
  }) {
    if (competition != null) {
      return competition(this.competition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Matches value) matches,
    required TResult Function(_Competiotion value) competition,
    required TResult Function(_Team value) team,
  }) {
    return competition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
  }) {
    return competition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
    required TResult orElse(),
  }) {
    if (competition != null) {
      return competition(this);
    }
    return orElse();
  }
}

abstract class _Competiotion extends FootballApiClient {
  const factory _Competiotion(String competition) = _$_Competiotion;
  const _Competiotion._() : super._();

  String get competition;
  @JsonKey(ignore: true)
  _$CompetiotionCopyWith<_Competiotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  $Res call({int teamId});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$FootballApiClientCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object? teamId = freezed,
  }) {
    return _then(_Team(
      teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Team extends _Team {
  const _$_Team(this.teamId) : super._();

  @override
  final int teamId;

  @override
  String toString() {
    return 'FootballApiClient.team(teamId: $teamId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Team &&
            const DeepCollectionEquality().equals(other.teamId, teamId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(teamId));

  @JsonKey(ignore: true)
  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String competition) matches,
    required TResult Function(String competition) competition,
    required TResult Function(int teamId) team,
  }) {
    return team(teamId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
  }) {
    return team?.call(teamId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String competition)? matches,
    TResult Function(String competition)? competition,
    TResult Function(int teamId)? team,
    required TResult orElse(),
  }) {
    if (team != null) {
      return team(teamId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Matches value) matches,
    required TResult Function(_Competiotion value) competition,
    required TResult Function(_Team value) team,
  }) {
    return team(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
  }) {
    return team?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Matches value)? matches,
    TResult Function(_Competiotion value)? competition,
    TResult Function(_Team value)? team,
    required TResult orElse(),
  }) {
    if (team != null) {
      return team(this);
    }
    return orElse();
  }
}

abstract class _Team extends FootballApiClient {
  const factory _Team(int teamId) = _$_Team;
  const _Team._() : super._();

  int get teamId;
  @JsonKey(ignore: true)
  _$TeamCopyWith<_Team> get copyWith => throw _privateConstructorUsedError;
}
