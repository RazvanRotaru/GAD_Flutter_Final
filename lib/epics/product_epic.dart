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
      TypedEpic<AppState, GetProductByBarcodeActionStart>(_getProductByBarcode),
      TypedEpic<AppState, ReloadProductsActionStart>(_overrideLocalData),
      TypedEpic<AppState, CreateReceptionActionStart>(_createReception),
      TypedEpic<AppState, CreateNewEntryActionStart>(_createEntry)
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

  Stream<AppAction> _getProductByBarcode(Stream<GetProductByBarcodeActionStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetProductByBarcodeActionStart action) =>
            store.state.products.firstWhere((Product p) => p.barcode == action.barcode))
        .map((Product product) => GetProductByBarcodeAction.successful(product: product))
        .onErrorReturnWith((Object error, StackTrace stackTrace) {
      return GetProductByBarcodeAction.error(error: error, stackTrace: stackTrace);
    });
  }

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

  Stream<AppAction> _createEntry(Stream<CreateNewEntryActionStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((CreateNewEntryActionStart action) {
          return ProductEntry((ProductEntryBuilder b) {
            b
              ..quantity = num.tryParse(action.quantity)
              ..product.price = num.tryParse(action.price)
              ..product.barcode = num.tryParse(action.barcode)
              ..product.name = action.name;
          });
        })
        .map((ProductEntry entry) => CreateNewEntryAction.successful(entry: entry))
        .onErrorReturnWith((Object error, StackTrace stackTrace) {
          return CreateNewEntryAction.error(error: error, stackTrace: stackTrace);
        });
  }

  Stream<AppAction> _overrideLocalData(Stream<ReloadProductsActionStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((ReloadProductsActionStart action) => _productApi.getProductsFromRemote())
        .map((List<Product> products) => ReloadProductsAction.successful(products: products))
        .onErrorReturnWith((Object error, StackTrace stackTrace) {
      return ReloadProductsAction.error(error: error, stackTrace: stackTrace);
    });
  }
}
