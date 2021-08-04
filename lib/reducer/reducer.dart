import 'package:movie_db/actions/index.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    print(action);
    return state;
  },
  TypedReducer<AppState, GetMoviesAction>(_getMovies),
  TypedReducer<AppState, ReloadMoviesAction>(_clearMovies),
  TypedReducer<AppState, GetMoviesActionSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMoviesActionError>(_getMoviesError),
  TypedReducer<AppState, SelectMovieAction>(_selectMovie),
]);

AppState _getMovies(AppState state, GetMoviesAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.isLoading = true;
  });
}

AppState _clearMovies(AppState state, ReloadMoviesAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..movies.clear()
      ..isLoading = true;
  });
}

AppState _getMoviesSuccessful(AppState state, GetMoviesActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..currentPage = state.currentPage + 1;
  });
}

AppState _getMoviesError(AppState state, GetMoviesActionError action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..isLoading = false
      ..errMessage = '${action.error}';
  });
}

AppState _selectMovie(AppState state, SelectMovieAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.selectedMovieId = action.id;
  });
}
