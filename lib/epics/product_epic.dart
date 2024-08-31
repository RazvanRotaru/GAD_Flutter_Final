import 'package:flutter/material.dart';
import 'package:movie_db/actions/app_actions.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/data/product_api.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class ProductEpics {
  ProductEpics({required ProductApi api}) : _productApi = api;

  final ProductApi _productApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetProductsActionStart>(_getProducts),
      TypedEpic<AppState, CreateReceptionActionStart>(_createReception),
      // TypedEpic<AppState, ReloadProducts>(_reloadMovies),
    ]);
  }

  Stream<AppAction> _getProducts(Stream<GetProductsActionStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetProductsActionStart action) => _productApi.getProducts())
        .map((List<Product> products) => GetProductsAction.successful(products: products))
        .onErrorReturnWith(
      (Object error, StackTrace stackTrace) {
        return GetProductsAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }

  // Stream<AppAction> _reloadMovies(Stream<ReloadMoviesAction> actions, EpicStore<AppState> store) {
  //   return actions //
  //       .flatMap(
  //     (ReloadMoviesAction action) => Stream<void>.value(null)
  //         .asyncMap((_) => _movieApi.getMovies(page: action.randomPage))
  //         .map((List<Movie> movies) => GetMoviesAction.successful(movies: movies))
  //         .onErrorReturnWith(
  //       (Object error, StackTrace stackTrace) {
  //         return GetMoviesAction.error(error: error, stackTrace: stackTrace);
  //       },
  //     ),
  //   );
  // }

  Stream<AppAction> _createReception(Stream<CreateReceptionActionStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((CreateReceptionActionStart action) => UniqueKey().toString())
        .map((String id) => CreateReceptionAction.successful(receptionId: id))
        .onErrorReturnWith(
      (Object error, StackTrace stackTrace) {
        return CreateReceptionAction.error(error: error, stackTrace: stackTrace);
      },
    );
  }
}
