// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();
Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object?> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'imdb_code',
      serializers.serialize(object.imdbCode,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'title_english',
      serializers.serialize(object.titleEnglish,
          specifiedType: const FullType(String)),
      'title_long',
      serializers.serialize(object.titleLong,
          specifiedType: const FullType(String)),
      'slug',
      serializers.serialize(object.slug, specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(num)),
      'runtime',
      serializers.serialize(object.runtime, specifiedType: const FullType(int)),
      'genres',
      serializers.serialize(object.genres,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'summary',
      serializers.serialize(object.summary,
          specifiedType: const FullType(String)),
      'description_full',
      serializers.serialize(object.descriptionFull,
          specifiedType: const FullType(String)),
      'synopsis',
      serializers.serialize(object.synopsis,
          specifiedType: const FullType(String)),
      'yt_trailer_code',
      serializers.serialize(object.ytTrailerCode,
          specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language,
          specifiedType: const FullType(String)),
      'mpa_rating',
      serializers.serialize(object.mpaRating,
          specifiedType: const FullType(String)),
      'background_image',
      serializers.serialize(object.backgroundImage,
          specifiedType: const FullType(String)),
      'background_image_original',
      serializers.serialize(object.backgroundImageOriginal,
          specifiedType: const FullType(String)),
      'small_cover_image',
      serializers.serialize(object.smallCoverImage,
          specifiedType: const FullType(String)),
      'medium_cover_image',
      serializers.serialize(object.mediumCoverImage,
          specifiedType: const FullType(String)),
      'large_cover_image',
      serializers.serialize(object.largeCoverImage,
          specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'date_uploaded',
      serializers.serialize(object.dateUploaded,
          specifiedType: const FullType(String)),
      'date_uploaded_unix',
      serializers.serialize(object.dateUploadedUnix,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'imdb_code':
          result.imdbCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title_english':
          result.titleEnglish = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title_long':
          result.titleLong = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description_full':
          result.descriptionFull = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'synopsis':
          result.synopsis = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'yt_trailer_code':
          result.ytTrailerCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'mpa_rating':
          result.mpaRating = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'background_image':
          result.backgroundImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'background_image_original':
          result.backgroundImageOriginal = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'small_cover_image':
          result.smallCoverImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'medium_cover_image':
          result.mediumCoverImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'large_cover_image':
          result.largeCoverImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date_uploaded':
          result.dateUploaded = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date_uploaded_unix':
          result.dateUploadedUnix = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable<Object?> serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'short_name',
      serializers.serialize(object.shortName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'bar_code',
      serializers.serialize(object.barCode,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(num)),
      'categories',
      serializers.serialize(object.categories,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'summary',
      serializers.serialize(object.summary,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'short_name':
          result.shortName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'bar_code':
          result.barCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> movies;
  @override
  final bool isLoading;
  @override
  final String? errMessage;
  @override
  final int? selectedMovieId;
  @override
  final int currentPage;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._(
      {required this.movies,
      required this.isLoading,
      this.errMessage,
      this.selectedMovieId,
      required this.currentPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(movies, r'AppState', 'movies');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'AppState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        currentPage, r'AppState', 'currentPage');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        movies == other.movies &&
        isLoading == other.isLoading &&
        errMessage == other.errMessage &&
        selectedMovieId == other.selectedMovieId &&
        currentPage == other.currentPage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, movies.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, errMessage.hashCode);
    _$hash = $jc(_$hash, selectedMovieId.hashCode);
    _$hash = $jc(_$hash, currentPage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('movies', movies)
          ..add('isLoading', isLoading)
          ..add('errMessage', errMessage)
          ..add('selectedMovieId', selectedMovieId)
          ..add('currentPage', currentPage))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  ListBuilder<Movie>? _movies;
  ListBuilder<Movie> get movies => _$this._movies ??= new ListBuilder<Movie>();
  set movies(ListBuilder<Movie>? movies) => _$this._movies = movies;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _errMessage;
  String? get errMessage => _$this._errMessage;
  set errMessage(String? errMessage) => _$this._errMessage = errMessage;

  int? _selectedMovieId;
  int? get selectedMovieId => _$this._selectedMovieId;
  set selectedMovieId(int? selectedMovieId) =>
      _$this._selectedMovieId = selectedMovieId;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movies = $v.movies.toBuilder();
      _isLoading = $v.isLoading;
      _errMessage = $v.errMessage;
      _selectedMovieId = $v.selectedMovieId;
      _currentPage = $v.currentPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              movies: movies.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'AppState', 'isLoading'),
              errMessage: errMessage,
              selectedMovieId: selectedMovieId,
              currentPage: BuiltValueNullFieldError.checkNotNull(
                  currentPage, r'AppState', 'currentPage'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'movies';
        movies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Movie extends Movie {
  @override
  final int id;
  @override
  final String url;
  @override
  final String imdbCode;
  @override
  final String title;
  @override
  final String titleEnglish;
  @override
  final String titleLong;
  @override
  final String slug;
  @override
  final int year;
  @override
  final num rating;
  @override
  final int runtime;
  @override
  final BuiltList<String> genres;
  @override
  final String summary;
  @override
  final String descriptionFull;
  @override
  final String synopsis;
  @override
  final String ytTrailerCode;
  @override
  final String language;
  @override
  final String mpaRating;
  @override
  final String backgroundImage;
  @override
  final String backgroundImageOriginal;
  @override
  final String smallCoverImage;
  @override
  final String mediumCoverImage;
  @override
  final String largeCoverImage;
  @override
  final String state;
  @override
  final String dateUploaded;
  @override
  final int dateUploadedUnix;

  factory _$Movie([void Function(MovieBuilder)? updates]) =>
      (new MovieBuilder()..update(updates))._build();

  _$Movie._(
      {required this.id,
      required this.url,
      required this.imdbCode,
      required this.title,
      required this.titleEnglish,
      required this.titleLong,
      required this.slug,
      required this.year,
      required this.rating,
      required this.runtime,
      required this.genres,
      required this.summary,
      required this.descriptionFull,
      required this.synopsis,
      required this.ytTrailerCode,
      required this.language,
      required this.mpaRating,
      required this.backgroundImage,
      required this.backgroundImageOriginal,
      required this.smallCoverImage,
      required this.mediumCoverImage,
      required this.largeCoverImage,
      required this.state,
      required this.dateUploaded,
      required this.dateUploadedUnix})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Movie', 'id');
    BuiltValueNullFieldError.checkNotNull(url, r'Movie', 'url');
    BuiltValueNullFieldError.checkNotNull(imdbCode, r'Movie', 'imdbCode');
    BuiltValueNullFieldError.checkNotNull(title, r'Movie', 'title');
    BuiltValueNullFieldError.checkNotNull(
        titleEnglish, r'Movie', 'titleEnglish');
    BuiltValueNullFieldError.checkNotNull(titleLong, r'Movie', 'titleLong');
    BuiltValueNullFieldError.checkNotNull(slug, r'Movie', 'slug');
    BuiltValueNullFieldError.checkNotNull(year, r'Movie', 'year');
    BuiltValueNullFieldError.checkNotNull(rating, r'Movie', 'rating');
    BuiltValueNullFieldError.checkNotNull(runtime, r'Movie', 'runtime');
    BuiltValueNullFieldError.checkNotNull(genres, r'Movie', 'genres');
    BuiltValueNullFieldError.checkNotNull(summary, r'Movie', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        descriptionFull, r'Movie', 'descriptionFull');
    BuiltValueNullFieldError.checkNotNull(synopsis, r'Movie', 'synopsis');
    BuiltValueNullFieldError.checkNotNull(
        ytTrailerCode, r'Movie', 'ytTrailerCode');
    BuiltValueNullFieldError.checkNotNull(language, r'Movie', 'language');
    BuiltValueNullFieldError.checkNotNull(mpaRating, r'Movie', 'mpaRating');
    BuiltValueNullFieldError.checkNotNull(
        backgroundImage, r'Movie', 'backgroundImage');
    BuiltValueNullFieldError.checkNotNull(
        backgroundImageOriginal, r'Movie', 'backgroundImageOriginal');
    BuiltValueNullFieldError.checkNotNull(
        smallCoverImage, r'Movie', 'smallCoverImage');
    BuiltValueNullFieldError.checkNotNull(
        mediumCoverImage, r'Movie', 'mediumCoverImage');
    BuiltValueNullFieldError.checkNotNull(
        largeCoverImage, r'Movie', 'largeCoverImage');
    BuiltValueNullFieldError.checkNotNull(state, r'Movie', 'state');
    BuiltValueNullFieldError.checkNotNull(
        dateUploaded, r'Movie', 'dateUploaded');
    BuiltValueNullFieldError.checkNotNull(
        dateUploadedUnix, r'Movie', 'dateUploadedUnix');
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        url == other.url &&
        imdbCode == other.imdbCode &&
        title == other.title &&
        titleEnglish == other.titleEnglish &&
        titleLong == other.titleLong &&
        slug == other.slug &&
        year == other.year &&
        rating == other.rating &&
        runtime == other.runtime &&
        genres == other.genres &&
        summary == other.summary &&
        descriptionFull == other.descriptionFull &&
        synopsis == other.synopsis &&
        ytTrailerCode == other.ytTrailerCode &&
        language == other.language &&
        mpaRating == other.mpaRating &&
        backgroundImage == other.backgroundImage &&
        backgroundImageOriginal == other.backgroundImageOriginal &&
        smallCoverImage == other.smallCoverImage &&
        mediumCoverImage == other.mediumCoverImage &&
        largeCoverImage == other.largeCoverImage &&
        state == other.state &&
        dateUploaded == other.dateUploaded &&
        dateUploadedUnix == other.dateUploadedUnix;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, imdbCode.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, titleEnglish.hashCode);
    _$hash = $jc(_$hash, titleLong.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, runtime.hashCode);
    _$hash = $jc(_$hash, genres.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, descriptionFull.hashCode);
    _$hash = $jc(_$hash, synopsis.hashCode);
    _$hash = $jc(_$hash, ytTrailerCode.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, mpaRating.hashCode);
    _$hash = $jc(_$hash, backgroundImage.hashCode);
    _$hash = $jc(_$hash, backgroundImageOriginal.hashCode);
    _$hash = $jc(_$hash, smallCoverImage.hashCode);
    _$hash = $jc(_$hash, mediumCoverImage.hashCode);
    _$hash = $jc(_$hash, largeCoverImage.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, dateUploaded.hashCode);
    _$hash = $jc(_$hash, dateUploadedUnix.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Movie')
          ..add('id', id)
          ..add('url', url)
          ..add('imdbCode', imdbCode)
          ..add('title', title)
          ..add('titleEnglish', titleEnglish)
          ..add('titleLong', titleLong)
          ..add('slug', slug)
          ..add('year', year)
          ..add('rating', rating)
          ..add('runtime', runtime)
          ..add('genres', genres)
          ..add('summary', summary)
          ..add('descriptionFull', descriptionFull)
          ..add('synopsis', synopsis)
          ..add('ytTrailerCode', ytTrailerCode)
          ..add('language', language)
          ..add('mpaRating', mpaRating)
          ..add('backgroundImage', backgroundImage)
          ..add('backgroundImageOriginal', backgroundImageOriginal)
          ..add('smallCoverImage', smallCoverImage)
          ..add('mediumCoverImage', mediumCoverImage)
          ..add('largeCoverImage', largeCoverImage)
          ..add('state', state)
          ..add('dateUploaded', dateUploaded)
          ..add('dateUploadedUnix', dateUploadedUnix))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _imdbCode;
  String? get imdbCode => _$this._imdbCode;
  set imdbCode(String? imdbCode) => _$this._imdbCode = imdbCode;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _titleEnglish;
  String? get titleEnglish => _$this._titleEnglish;
  set titleEnglish(String? titleEnglish) => _$this._titleEnglish = titleEnglish;

  String? _titleLong;
  String? get titleLong => _$this._titleLong;
  set titleLong(String? titleLong) => _$this._titleLong = titleLong;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  num? _rating;
  num? get rating => _$this._rating;
  set rating(num? rating) => _$this._rating = rating;

  int? _runtime;
  int? get runtime => _$this._runtime;
  set runtime(int? runtime) => _$this._runtime = runtime;

  ListBuilder<String>? _genres;
  ListBuilder<String> get genres =>
      _$this._genres ??= new ListBuilder<String>();
  set genres(ListBuilder<String>? genres) => _$this._genres = genres;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _descriptionFull;
  String? get descriptionFull => _$this._descriptionFull;
  set descriptionFull(String? descriptionFull) =>
      _$this._descriptionFull = descriptionFull;

  String? _synopsis;
  String? get synopsis => _$this._synopsis;
  set synopsis(String? synopsis) => _$this._synopsis = synopsis;

  String? _ytTrailerCode;
  String? get ytTrailerCode => _$this._ytTrailerCode;
  set ytTrailerCode(String? ytTrailerCode) =>
      _$this._ytTrailerCode = ytTrailerCode;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _mpaRating;
  String? get mpaRating => _$this._mpaRating;
  set mpaRating(String? mpaRating) => _$this._mpaRating = mpaRating;

  String? _backgroundImage;
  String? get backgroundImage => _$this._backgroundImage;
  set backgroundImage(String? backgroundImage) =>
      _$this._backgroundImage = backgroundImage;

  String? _backgroundImageOriginal;
  String? get backgroundImageOriginal => _$this._backgroundImageOriginal;
  set backgroundImageOriginal(String? backgroundImageOriginal) =>
      _$this._backgroundImageOriginal = backgroundImageOriginal;

  String? _smallCoverImage;
  String? get smallCoverImage => _$this._smallCoverImage;
  set smallCoverImage(String? smallCoverImage) =>
      _$this._smallCoverImage = smallCoverImage;

  String? _mediumCoverImage;
  String? get mediumCoverImage => _$this._mediumCoverImage;
  set mediumCoverImage(String? mediumCoverImage) =>
      _$this._mediumCoverImage = mediumCoverImage;

  String? _largeCoverImage;
  String? get largeCoverImage => _$this._largeCoverImage;
  set largeCoverImage(String? largeCoverImage) =>
      _$this._largeCoverImage = largeCoverImage;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _dateUploaded;
  String? get dateUploaded => _$this._dateUploaded;
  set dateUploaded(String? dateUploaded) => _$this._dateUploaded = dateUploaded;

  int? _dateUploadedUnix;
  int? get dateUploadedUnix => _$this._dateUploadedUnix;
  set dateUploadedUnix(int? dateUploadedUnix) =>
      _$this._dateUploadedUnix = dateUploadedUnix;

  MovieBuilder();

  MovieBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _url = $v.url;
      _imdbCode = $v.imdbCode;
      _title = $v.title;
      _titleEnglish = $v.titleEnglish;
      _titleLong = $v.titleLong;
      _slug = $v.slug;
      _year = $v.year;
      _rating = $v.rating;
      _runtime = $v.runtime;
      _genres = $v.genres.toBuilder();
      _summary = $v.summary;
      _descriptionFull = $v.descriptionFull;
      _synopsis = $v.synopsis;
      _ytTrailerCode = $v.ytTrailerCode;
      _language = $v.language;
      _mpaRating = $v.mpaRating;
      _backgroundImage = $v.backgroundImage;
      _backgroundImageOriginal = $v.backgroundImageOriginal;
      _smallCoverImage = $v.smallCoverImage;
      _mediumCoverImage = $v.mediumCoverImage;
      _largeCoverImage = $v.largeCoverImage;
      _state = $v.state;
      _dateUploaded = $v.dateUploaded;
      _dateUploadedUnix = $v.dateUploadedUnix;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Movie build() => _build();

  _$Movie _build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Movie', 'id'),
              url: BuiltValueNullFieldError.checkNotNull(url, r'Movie', 'url'),
              imdbCode: BuiltValueNullFieldError.checkNotNull(
                  imdbCode, r'Movie', 'imdbCode'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'Movie', 'title'),
              titleEnglish: BuiltValueNullFieldError.checkNotNull(
                  titleEnglish, r'Movie', 'titleEnglish'),
              titleLong: BuiltValueNullFieldError.checkNotNull(
                  titleLong, r'Movie', 'titleLong'),
              slug:
                  BuiltValueNullFieldError.checkNotNull(slug, r'Movie', 'slug'),
              year:
                  BuiltValueNullFieldError.checkNotNull(year, r'Movie', 'year'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, r'Movie', 'rating'),
              runtime: BuiltValueNullFieldError.checkNotNull(
                  runtime, r'Movie', 'runtime'),
              genres: genres.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'Movie', 'summary'),
              descriptionFull: BuiltValueNullFieldError.checkNotNull(
                  descriptionFull, r'Movie', 'descriptionFull'),
              synopsis: BuiltValueNullFieldError.checkNotNull(
                  synopsis, r'Movie', 'synopsis'),
              ytTrailerCode: BuiltValueNullFieldError.checkNotNull(
                  ytTrailerCode, r'Movie', 'ytTrailerCode'),
              language:
                  BuiltValueNullFieldError.checkNotNull(language, r'Movie', 'language'),
              mpaRating: BuiltValueNullFieldError.checkNotNull(mpaRating, r'Movie', 'mpaRating'),
              backgroundImage: BuiltValueNullFieldError.checkNotNull(backgroundImage, r'Movie', 'backgroundImage'),
              backgroundImageOriginal: BuiltValueNullFieldError.checkNotNull(backgroundImageOriginal, r'Movie', 'backgroundImageOriginal'),
              smallCoverImage: BuiltValueNullFieldError.checkNotNull(smallCoverImage, r'Movie', 'smallCoverImage'),
              mediumCoverImage: BuiltValueNullFieldError.checkNotNull(mediumCoverImage, r'Movie', 'mediumCoverImage'),
              largeCoverImage: BuiltValueNullFieldError.checkNotNull(largeCoverImage, r'Movie', 'largeCoverImage'),
              state: BuiltValueNullFieldError.checkNotNull(state, r'Movie', 'state'),
              dateUploaded: BuiltValueNullFieldError.checkNotNull(dateUploaded, r'Movie', 'dateUploaded'),
              dateUploadedUnix: BuiltValueNullFieldError.checkNotNull(dateUploadedUnix, r'Movie', 'dateUploadedUnix'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genres';
        genres.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Product extends Product {
  @override
  final int id;
  @override
  final String shortName;
  @override
  final String name;
  @override
  final String barCode;
  @override
  final num price;
  @override
  final BuiltList<String> categories;
  @override
  final String summary;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates))._build();

  _$Product._(
      {required this.id,
      required this.shortName,
      required this.name,
      required this.barCode,
      required this.price,
      required this.categories,
      required this.summary})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Product', 'id');
    BuiltValueNullFieldError.checkNotNull(shortName, r'Product', 'shortName');
    BuiltValueNullFieldError.checkNotNull(name, r'Product', 'name');
    BuiltValueNullFieldError.checkNotNull(barCode, r'Product', 'barCode');
    BuiltValueNullFieldError.checkNotNull(price, r'Product', 'price');
    BuiltValueNullFieldError.checkNotNull(categories, r'Product', 'categories');
    BuiltValueNullFieldError.checkNotNull(summary, r'Product', 'summary');
  }

  @override
  Product rebuild(void Function(ProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        id == other.id &&
        shortName == other.shortName &&
        name == other.name &&
        barCode == other.barCode &&
        price == other.price &&
        categories == other.categories &&
        summary == other.summary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, shortName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, barCode.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Product')
          ..add('id', id)
          ..add('shortName', shortName)
          ..add('name', name)
          ..add('barCode', barCode)
          ..add('price', price)
          ..add('categories', categories)
          ..add('summary', summary))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _shortName;
  String? get shortName => _$this._shortName;
  set shortName(String? shortName) => _$this._shortName = shortName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _barCode;
  String? get barCode => _$this._barCode;
  set barCode(String? barCode) => _$this._barCode = barCode;

  num? _price;
  num? get price => _$this._price;
  set price(num? price) => _$this._price = price;

  ListBuilder<String>? _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String>? categories) =>
      _$this._categories = categories;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _shortName = $v.shortName;
      _name = $v.name;
      _barCode = $v.barCode;
      _price = $v.price;
      _categories = $v.categories.toBuilder();
      _summary = $v.summary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Product;
  }

  @override
  void update(void Function(ProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Product build() => _build();

  _$Product _build() {
    _$Product _$result;
    try {
      _$result = _$v ??
          new _$Product._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Product', 'id'),
              shortName: BuiltValueNullFieldError.checkNotNull(
                  shortName, r'Product', 'shortName'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Product', 'name'),
              barCode: BuiltValueNullFieldError.checkNotNull(
                  barCode, r'Product', 'barCode'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'Product', 'price'),
              categories: categories.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'Product', 'summary'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        categories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Product', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
