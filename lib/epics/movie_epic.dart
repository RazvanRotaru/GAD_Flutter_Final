import 'package:movie_db/actions/app_actions.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/data/movie_api.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class MovieEpics {
  MovieEpics({required MovieApi api}) : _movieApi = api;

  final MovieApi _movieApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesActionStart>(_getMovies),
      TypedEpic<AppState, ReloadMoviesAction>(_reloadMovies),
    ]);
  }

  Stream<AppAction> _getMovies(Stream<GetMoviesActionStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesActionStart action) => _movieApi.getMovies(page: store.state.currentPage))
        .map((List<Movie> movies) => GetMoviesAction.successful(movies: movies))
        .onErrorReturnWith(
      (Object error, StackTrace stackTrace) {
        return GetMoviesAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }

  Stream<AppAction> _reloadMovies(Stream<ReloadMoviesAction> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap(
      (ReloadMoviesAction action) => Stream<void>.value(null)
          .asyncMap((_) => _movieApi.getMovies(page: action.randomPage))
          .map((List<Movie> movies) => GetMoviesAction.successful(movies: movies))
          .onErrorReturnWith(
        (Object error, StackTrace stackTrace) {
          return GetMoviesAction.error(error: error, stackTrace: stackTrace);
        },
      ),
    );
  }
}
