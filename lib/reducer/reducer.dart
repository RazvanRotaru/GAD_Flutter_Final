import 'package:movie_db/actions/app_actions.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    print(action);
    return state;
  },
  TypedReducer<AppState, GetProductsAction>(_getProducts),
  TypedReducer<AppState, GetProductsActionSuccessful>(_getProductsSuccessful),
  TypedReducer<AppState, CreateReceptionAction>(_createReception),
  TypedReducer<AppState, CreateReceptionActionSuccessful>(_createReceptionSuccessful),
  TypedReducer<AppState, ReloadProductsAction>(_clearProducts),
  TypedReducer<AppState, SelectProductEntrySuccessful>(_selectProductEntry),
  
  TypedReducer<AppState, CreateNewEntryActionSuccessful>(_appendEntryToReception),
  
  TypedReducer<AppState, ErrorAction>(_getError),
]);

AppState _getProducts(AppState state, GetProductsAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.isLoading = true;
  });
}

AppState _clearProducts(AppState state, ReloadProductsAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..products.clear()
      ..isLoading = true;
  });
}

AppState _getProductsSuccessful(AppState state, GetProductsActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..products.addAll(action.products)
      ..isLoading = false;
  });
}

AppState _getError(AppState state, ErrorAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..isLoading = false
      ..errMessage = '${action.error}';
  });
}

AppState _selectProductEntry(AppState state, SelectProductEntrySuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.selectedProductsEntryId = action.entry.id;
  });
}

AppState _createReception(AppState state, CreateReceptionAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..ongoingReception = null
      ..isLoading = true;
  });
}

AppState _createReceptionSuccessful(AppState state, CreateReceptionActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..ongoingReception.id = action.receptionId
      // ..ongoingReception.entries.add(ProductEntry((ProductEntryBuilder b) {
      //   b.quantity = 3;
      //   b.id = '1000';
      //   b.product
      //     ..barCode = '1'
      //     ..name = "Dsafa"
      //     ..price = 2;
      // }))
      // ..ongoingReception.entries.add(ProductEntry((ProductEntryBuilder b) {
      //   b.quantity = 3;
      //   b.id = '1000';
      //   b.product
      //     ..barCode = '1'
      //     ..name = "dfgagag"
      //     ..price = 2;
      // }))
      // ..ongoingReception.entries.add(ProductEntry((ProductEntryBuilder b) {
      //   b.quantity = 3;
      //   b.id = '1000';
      //   b.product
      //     ..barCode = '1'
      //     ..name = "Dsaewqrqwrqwwetfa"
      //     ..price = 2;
      // }))
      // ..ongoingReception.entries.add(ProductEntry((ProductEntryBuilder b) {
      //   b.quantity = 3;
      //   b.id = '1000';
      //   b.product
      //     ..barCode = '1'
      //     ..name = "WWWWWWWWWDsaxxxxxxzsfa"
      //     ..price = 2;
      // }))
      ..isLoading = false;
  });
}

AppState _appendEntryToReception(AppState state, CreateNewEntryActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.ongoingReception.entries.add(action.entry);
  });
}
