// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of actions;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GetMoviesActionTearOff {
  const _$GetMoviesActionTearOff();

  GetMoviesActionStart call() {
    return const GetMoviesActionStart();
  }

  GetMoviesActionSuccessful successful({required List<Movie> movies}) {
    return GetMoviesActionSuccessful(
      movies: movies,
    );
  }

  GetMoviesActionError error({required Object error, required StackTrace stackTrace}) {
    return GetMoviesActionError(
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// @nodoc
const $GetMoviesAction = _$GetMoviesActionTearOff();

/// @nodoc
mixin _$GetMoviesAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Movie> movies) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Movie> movies)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value) $default, {
    required TResult Function(GetMoviesActionSuccessful value) successful,
    required TResult Function(GetMoviesActionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value)? $default, {
    TResult Function(GetMoviesActionSuccessful value)? successful,
    TResult Function(GetMoviesActionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMoviesActionCopyWith<$Res> {
  factory $GetMoviesActionCopyWith(GetMoviesAction value, $Res Function(GetMoviesAction) then) =
      _$GetMoviesActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetMoviesActionCopyWithImpl<$Res> implements $GetMoviesActionCopyWith<$Res> {
  _$GetMoviesActionCopyWithImpl(this._value, this._then);

  final GetMoviesAction _value;
  // ignore: unused_field
  final $Res Function(GetMoviesAction) _then;
}

/// @nodoc
abstract class $GetMoviesActionStartCopyWith<$Res> {
  factory $GetMoviesActionStartCopyWith(GetMoviesActionStart value, $Res Function(GetMoviesActionStart) then) =
      _$GetMoviesActionStartCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetMoviesActionStartCopyWithImpl<$Res> extends _$GetMoviesActionCopyWithImpl<$Res>
    implements $GetMoviesActionStartCopyWith<$Res> {
  _$GetMoviesActionStartCopyWithImpl(GetMoviesActionStart _value, $Res Function(GetMoviesActionStart) _then)
      : super(_value, (v) => _then(v as GetMoviesActionStart));

  @override
  GetMoviesActionStart get _value => super._value as GetMoviesActionStart;
}

/// @nodoc

class _$GetMoviesActionStart implements GetMoviesActionStart {
  const _$GetMoviesActionStart();

  @override
  String toString() {
    return 'GetMoviesAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetMoviesActionStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Movie> movies) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Movie> movies)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value) $default, {
    required TResult Function(GetMoviesActionSuccessful value) successful,
    required TResult Function(GetMoviesActionError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value)? $default, {
    TResult Function(GetMoviesActionSuccessful value)? successful,
    TResult Function(GetMoviesActionError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class GetMoviesActionStart implements GetMoviesAction {
  const factory GetMoviesActionStart() = _$GetMoviesActionStart;
}

/// @nodoc
abstract class $GetMoviesActionSuccessfulCopyWith<$Res> {
  factory $GetMoviesActionSuccessfulCopyWith(
          GetMoviesActionSuccessful value, $Res Function(GetMoviesActionSuccessful) then) =
      _$GetMoviesActionSuccessfulCopyWithImpl<$Res>;
  $Res call({List<Movie> movies});
}

/// @nodoc
class _$GetMoviesActionSuccessfulCopyWithImpl<$Res> extends _$GetMoviesActionCopyWithImpl<$Res>
    implements $GetMoviesActionSuccessfulCopyWith<$Res> {
  _$GetMoviesActionSuccessfulCopyWithImpl(
      GetMoviesActionSuccessful _value, $Res Function(GetMoviesActionSuccessful) _then)
      : super(_value, (v) => _then(v as GetMoviesActionSuccessful));

  @override
  GetMoviesActionSuccessful get _value => super._value as GetMoviesActionSuccessful;

  @override
  $Res call({
    Object? movies = freezed,
  }) {
    return _then(GetMoviesActionSuccessful(
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$GetMoviesActionSuccessful implements GetMoviesActionSuccessful {
  const _$GetMoviesActionSuccessful({required this.movies});

  @override
  final List<Movie> movies;

  @override
  String toString() {
    return 'GetMoviesAction.successful(movies: $movies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetMoviesActionSuccessful &&
            (identical(other.movies, movies) || const DeepCollectionEquality().equals(other.movies, movies)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(movies);

  @JsonKey(ignore: true)
  @override
  $GetMoviesActionSuccessfulCopyWith<GetMoviesActionSuccessful> get copyWith =>
      _$GetMoviesActionSuccessfulCopyWithImpl<GetMoviesActionSuccessful>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Movie> movies) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return successful(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Movie> movies)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value) $default, {
    required TResult Function(GetMoviesActionSuccessful value) successful,
    required TResult Function(GetMoviesActionError value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value)? $default, {
    TResult Function(GetMoviesActionSuccessful value)? successful,
    TResult Function(GetMoviesActionError value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class GetMoviesActionSuccessful implements GetMoviesAction {
  const factory GetMoviesActionSuccessful({required List<Movie> movies}) = _$GetMoviesActionSuccessful;

  List<Movie> get movies => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetMoviesActionSuccessfulCopyWith<GetMoviesActionSuccessful> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMoviesActionErrorCopyWith<$Res> {
  factory $GetMoviesActionErrorCopyWith(GetMoviesActionError value, $Res Function(GetMoviesActionError) then) =
      _$GetMoviesActionErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$GetMoviesActionErrorCopyWithImpl<$Res> extends _$GetMoviesActionCopyWithImpl<$Res>
    implements $GetMoviesActionErrorCopyWith<$Res> {
  _$GetMoviesActionErrorCopyWithImpl(GetMoviesActionError _value, $Res Function(GetMoviesActionError) _then)
      : super(_value, (v) => _then(v as GetMoviesActionError));

  @override
  GetMoviesActionError get _value => super._value as GetMoviesActionError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(GetMoviesActionError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

@Implements(ErrorAction)
class _$GetMoviesActionError implements GetMoviesActionError {
  const _$GetMoviesActionError({required this.error, required this.stackTrace});

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'GetMoviesAction.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetMoviesActionError &&
            (identical(other.error, error) || const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stackTrace, stackTrace) ||
                const DeepCollectionEquality().equals(other.stackTrace, stackTrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stackTrace);

  @JsonKey(ignore: true)
  @override
  $GetMoviesActionErrorCopyWith<GetMoviesActionError> get copyWith =>
      _$GetMoviesActionErrorCopyWithImpl<GetMoviesActionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Movie> movies) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Movie> movies)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value) $default, {
    required TResult Function(GetMoviesActionSuccessful value) successful,
    required TResult Function(GetMoviesActionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetMoviesActionStart value)? $default, {
    TResult Function(GetMoviesActionSuccessful value)? successful,
    TResult Function(GetMoviesActionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetMoviesActionError implements GetMoviesAction, ErrorAction {
  const factory GetMoviesActionError({required Object error, required StackTrace stackTrace}) = _$GetMoviesActionError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetMoviesActionErrorCopyWith<GetMoviesActionError> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$SelectMovieActionTearOff {
  const _$SelectMovieActionTearOff();

  SelectMovieAction$ call({required int id}) {
    return SelectMovieAction$(
      id: id,
    );
  }
}

/// @nodoc
const $SelectMovieAction = _$SelectMovieActionTearOff();

/// @nodoc
mixin _$SelectMovieAction {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectMovieActionCopyWith<SelectMovieAction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectMovieActionCopyWith<$Res> {
  factory $SelectMovieActionCopyWith(SelectMovieAction value, $Res Function(SelectMovieAction) then) =
      _$SelectMovieActionCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class _$SelectMovieActionCopyWithImpl<$Res> implements $SelectMovieActionCopyWith<$Res> {
  _$SelectMovieActionCopyWithImpl(this._value, this._then);

  final SelectMovieAction _value;
  // ignore: unused_field
  final $Res Function(SelectMovieAction) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $SelectMovieAction$CopyWith<$Res> implements $SelectMovieActionCopyWith<$Res> {
  factory $SelectMovieAction$CopyWith(SelectMovieAction$ value, $Res Function(SelectMovieAction$) then) =
      _$SelectMovieAction$CopyWithImpl<$Res>;
  @override
  $Res call({int id});
}

/// @nodoc
class _$SelectMovieAction$CopyWithImpl<$Res> extends _$SelectMovieActionCopyWithImpl<$Res>
    implements $SelectMovieAction$CopyWith<$Res> {
  _$SelectMovieAction$CopyWithImpl(SelectMovieAction$ _value, $Res Function(SelectMovieAction$) _then)
      : super(_value, (v) => _then(v as SelectMovieAction$));

  @override
  SelectMovieAction$ get _value => super._value as SelectMovieAction$;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(SelectMovieAction$(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectMovieAction$ implements SelectMovieAction$ {
  const _$SelectMovieAction$({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'SelectMovieAction(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectMovieAction$ &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $SelectMovieAction$CopyWith<SelectMovieAction$> get copyWith =>
      _$SelectMovieAction$CopyWithImpl<SelectMovieAction$>(this, _$identity);
}

abstract class SelectMovieAction$ implements SelectMovieAction {
  const factory SelectMovieAction$({required int id}) = _$SelectMovieAction$;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SelectMovieAction$CopyWith<SelectMovieAction$> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ReloadMoviesActionTearOff {
  const _$ReloadMoviesActionTearOff();

  ReloadMoviesAction$ call() {
    return ReloadMoviesAction$();
  }
}

/// @nodoc
const $ReloadMoviesAction = _$ReloadMoviesActionTearOff();

/// @nodoc
mixin _$ReloadMoviesAction {}

/// @nodoc
abstract class $ReloadMoviesActionCopyWith<$Res> {
  factory $ReloadMoviesActionCopyWith(ReloadMoviesAction value, $Res Function(ReloadMoviesAction) then) =
      _$ReloadMoviesActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReloadMoviesActionCopyWithImpl<$Res> implements $ReloadMoviesActionCopyWith<$Res> {
  _$ReloadMoviesActionCopyWithImpl(this._value, this._then);

  final ReloadMoviesAction _value;
  // ignore: unused_field
  final $Res Function(ReloadMoviesAction) _then;
}

/// @nodoc
abstract class $ReloadMoviesAction$CopyWith<$Res> {
  factory $ReloadMoviesAction$CopyWith(ReloadMoviesAction$ value, $Res Function(ReloadMoviesAction$) then) =
      _$ReloadMoviesAction$CopyWithImpl<$Res>;
}

/// @nodoc
class _$ReloadMoviesAction$CopyWithImpl<$Res> extends _$ReloadMoviesActionCopyWithImpl<$Res>
    implements $ReloadMoviesAction$CopyWith<$Res> {
  _$ReloadMoviesAction$CopyWithImpl(ReloadMoviesAction$ _value, $Res Function(ReloadMoviesAction$) _then)
      : super(_value, (v) => _then(v as ReloadMoviesAction$));

  @override
  ReloadMoviesAction$ get _value => super._value as ReloadMoviesAction$;
}

/// @nodoc

class _$ReloadMoviesAction$ extends ReloadMoviesAction$ {
  _$ReloadMoviesAction$() : super._();

  @override
  String toString() {
    return 'ReloadMoviesAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReloadMoviesAction$);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ReloadMoviesAction$ extends ReloadMoviesAction {
  factory ReloadMoviesAction$() = _$ReloadMoviesAction$;
  ReloadMoviesAction$._() : super._();
}
