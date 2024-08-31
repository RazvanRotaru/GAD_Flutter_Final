// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();
Serializer<Product> _$productSerializer = new _$ProductSerializer();
Serializer<ProductEntry> _$productEntrySerializer =
    new _$ProductEntrySerializer();
Serializer<Reception> _$receptionSerializer = new _$ReceptionSerializer();
Serializer<ReceptionRecord> _$receptionRecordSerializer =
    new _$ReceptionRecordSerializer();

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
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'bar_code',
      serializers.serialize(object.barCode,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price, specifiedType: const FullType(num)),
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
      }
    }

    return result.build();
  }
}

class _$ProductEntrySerializer implements StructuredSerializer<ProductEntry> {
  @override
  final Iterable<Type> types = const [ProductEntry, _$ProductEntry];
  @override
  final String wireName = 'ProductEntry';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductEntry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'product',
      serializers.serialize(object.product,
          specifiedType: const FullType(Product)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(num)),
    ];

    return result;
  }

  @override
  ProductEntry deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductEntryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product':
          result.product.replace(serializers.deserialize(value,
              specifiedType: const FullType(Product))! as Product);
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
      }
    }

    return result.build();
  }
}

class _$ReceptionSerializer implements StructuredSerializer<Reception> {
  @override
  final Iterable<Type> types = const [Reception, _$Reception];
  @override
  final String wireName = 'Reception';

  @override
  Iterable<Object?> serialize(Serializers serializers, Reception object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entries',
      serializers.serialize(object.entries,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ProductEntry)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Reception deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReceptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entries':
          result.entries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductEntry)]))!
              as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ReceptionRecordSerializer
    implements StructuredSerializer<ReceptionRecord> {
  @override
  final Iterable<Type> types = const [ReceptionRecord, _$ReceptionRecord];
  @override
  final String wireName = 'ReceptionRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReceptionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(Reception)),
      'filePath',
      serializers.serialize(object.filePath,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ReceptionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReceptionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Reception))! as Reception);
          break;
        case 'filePath':
          result.filePath = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Product> products;
  @override
  final BuiltMap<String, ReceptionRecord>? receptions;
  @override
  final Reception? ongoingReception;
  @override
  final bool isLoading;
  @override
  final String? errMessage;
  @override
  final String? selectedProductsEntryId;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._(
      {required this.products,
      this.receptions,
      this.ongoingReception,
      required this.isLoading,
      this.errMessage,
      this.selectedProductsEntryId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(products, r'AppState', 'products');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'AppState', 'isLoading');
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
        products == other.products &&
        receptions == other.receptions &&
        ongoingReception == other.ongoingReception &&
        isLoading == other.isLoading &&
        errMessage == other.errMessage &&
        selectedProductsEntryId == other.selectedProductsEntryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jc(_$hash, receptions.hashCode);
    _$hash = $jc(_$hash, ongoingReception.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, errMessage.hashCode);
    _$hash = $jc(_$hash, selectedProductsEntryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('products', products)
          ..add('receptions', receptions)
          ..add('ongoingReception', ongoingReception)
          ..add('isLoading', isLoading)
          ..add('errMessage', errMessage)
          ..add('selectedProductsEntryId', selectedProductsEntryId))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  ListBuilder<Product>? _products;
  ListBuilder<Product> get products =>
      _$this._products ??= new ListBuilder<Product>();
  set products(ListBuilder<Product>? products) => _$this._products = products;

  MapBuilder<String, ReceptionRecord>? _receptions;
  MapBuilder<String, ReceptionRecord> get receptions =>
      _$this._receptions ??= new MapBuilder<String, ReceptionRecord>();
  set receptions(MapBuilder<String, ReceptionRecord>? receptions) =>
      _$this._receptions = receptions;

  ReceptionBuilder? _ongoingReception;
  ReceptionBuilder get ongoingReception =>
      _$this._ongoingReception ??= new ReceptionBuilder();
  set ongoingReception(ReceptionBuilder? ongoingReception) =>
      _$this._ongoingReception = ongoingReception;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _errMessage;
  String? get errMessage => _$this._errMessage;
  set errMessage(String? errMessage) => _$this._errMessage = errMessage;

  String? _selectedProductsEntryId;
  String? get selectedProductsEntryId => _$this._selectedProductsEntryId;
  set selectedProductsEntryId(String? selectedProductsEntryId) =>
      _$this._selectedProductsEntryId = selectedProductsEntryId;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products.toBuilder();
      _receptions = $v.receptions?.toBuilder();
      _ongoingReception = $v.ongoingReception?.toBuilder();
      _isLoading = $v.isLoading;
      _errMessage = $v.errMessage;
      _selectedProductsEntryId = $v.selectedProductsEntryId;
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
              products: products.build(),
              receptions: _receptions?.build(),
              ongoingReception: _ongoingReception?.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'AppState', 'isLoading'),
              errMessage: errMessage,
              selectedProductsEntryId: selectedProductsEntryId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
        _$failedField = 'receptions';
        _receptions?.build();
        _$failedField = 'ongoingReception';
        _ongoingReception?.build();
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
  final String name;
  @override
  final String barCode;
  @override
  final num price;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates))._build();

  _$Product._({required this.name, required this.barCode, required this.price})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Product', 'name');
    BuiltValueNullFieldError.checkNotNull(barCode, r'Product', 'barCode');
    BuiltValueNullFieldError.checkNotNull(price, r'Product', 'price');
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
        name == other.name &&
        barCode == other.barCode &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, barCode.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Product')
          ..add('name', name)
          ..add('barCode', barCode)
          ..add('price', price))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _barCode;
  String? get barCode => _$this._barCode;
  set barCode(String? barCode) => _$this._barCode = barCode;

  num? _price;
  num? get price => _$this._price;
  set price(num? price) => _$this._price = price;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _barCode = $v.barCode;
      _price = $v.price;
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
    final _$result = _$v ??
        new _$Product._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Product', 'name'),
            barCode: BuiltValueNullFieldError.checkNotNull(
                barCode, r'Product', 'barCode'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'Product', 'price'));
    replace(_$result);
    return _$result;
  }
}

class _$ProductEntry extends ProductEntry {
  @override
  final Product product;
  @override
  final num quantity;

  factory _$ProductEntry([void Function(ProductEntryBuilder)? updates]) =>
      (new ProductEntryBuilder()..update(updates))._build();

  _$ProductEntry._({required this.product, required this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(product, r'ProductEntry', 'product');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'ProductEntry', 'quantity');
  }

  @override
  ProductEntry rebuild(void Function(ProductEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductEntryBuilder toBuilder() => new ProductEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductEntry &&
        product == other.product &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, product.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductEntry')
          ..add('product', product)
          ..add('quantity', quantity))
        .toString();
  }
}

class ProductEntryBuilder
    implements Builder<ProductEntry, ProductEntryBuilder> {
  _$ProductEntry? _$v;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  ProductEntryBuilder();

  ProductEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _product = $v.product.toBuilder();
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductEntry;
  }

  @override
  void update(void Function(ProductEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductEntry build() => _build();

  _$ProductEntry _build() {
    _$ProductEntry _$result;
    try {
      _$result = _$v ??
          new _$ProductEntry._(
              product: product.build(),
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, r'ProductEntry', 'quantity'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        product.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductEntry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Reception extends Reception {
  @override
  final BuiltList<ProductEntry> entries;
  @override
  final String id;

  factory _$Reception([void Function(ReceptionBuilder)? updates]) =>
      (new ReceptionBuilder()..update(updates))._build();

  _$Reception._({required this.entries, required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(entries, r'Reception', 'entries');
    BuiltValueNullFieldError.checkNotNull(id, r'Reception', 'id');
  }

  @override
  Reception rebuild(void Function(ReceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceptionBuilder toBuilder() => new ReceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reception && entries == other.entries && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, entries.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Reception')
          ..add('entries', entries)
          ..add('id', id))
        .toString();
  }
}

class ReceptionBuilder implements Builder<Reception, ReceptionBuilder> {
  _$Reception? _$v;

  ListBuilder<ProductEntry>? _entries;
  ListBuilder<ProductEntry> get entries =>
      _$this._entries ??= new ListBuilder<ProductEntry>();
  set entries(ListBuilder<ProductEntry>? entries) => _$this._entries = entries;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ReceptionBuilder();

  ReceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entries = $v.entries.toBuilder();
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reception other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Reception;
  }

  @override
  void update(void Function(ReceptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Reception build() => _build();

  _$Reception _build() {
    _$Reception _$result;
    try {
      _$result = _$v ??
          new _$Reception._(
              entries: entries.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'Reception', 'id'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Reception', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ReceptionRecord extends ReceptionRecord {
  @override
  final Reception data;
  @override
  final String filePath;

  factory _$ReceptionRecord([void Function(ReceptionRecordBuilder)? updates]) =>
      (new ReceptionRecordBuilder()..update(updates))._build();

  _$ReceptionRecord._({required this.data, required this.filePath})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ReceptionRecord', 'data');
    BuiltValueNullFieldError.checkNotNull(
        filePath, r'ReceptionRecord', 'filePath');
  }

  @override
  ReceptionRecord rebuild(void Function(ReceptionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceptionRecordBuilder toBuilder() =>
      new ReceptionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceptionRecord &&
        data == other.data &&
        filePath == other.filePath;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, filePath.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceptionRecord')
          ..add('data', data)
          ..add('filePath', filePath))
        .toString();
  }
}

class ReceptionRecordBuilder
    implements Builder<ReceptionRecord, ReceptionRecordBuilder> {
  _$ReceptionRecord? _$v;

  ReceptionBuilder? _data;
  ReceptionBuilder get data => _$this._data ??= new ReceptionBuilder();
  set data(ReceptionBuilder? data) => _$this._data = data;

  String? _filePath;
  String? get filePath => _$this._filePath;
  set filePath(String? filePath) => _$this._filePath = filePath;

  ReceptionRecordBuilder();

  ReceptionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _filePath = $v.filePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceptionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReceptionRecord;
  }

  @override
  void update(void Function(ReceptionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceptionRecord build() => _build();

  _$ReceptionRecord _build() {
    _$ReceptionRecord _$result;
    try {
      _$result = _$v ??
          new _$ReceptionRecord._(
              data: data.build(),
              filePath: BuiltValueNullFieldError.checkNotNull(
                  filePath, r'ReceptionRecord', 'filePath'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReceptionRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
