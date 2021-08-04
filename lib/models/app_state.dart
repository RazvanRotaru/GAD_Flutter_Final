part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder builder) {
      builder
        ..isLoading = false
        ..currentPage = 1;
    });
  }

  AppState._();

  BuiltList<Movie> get movies;

  bool get isLoading;

  String? get errMessage;

  int? get selectedMovieId;

  int get currentPage;
}
