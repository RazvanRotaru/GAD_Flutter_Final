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
  TypedReducer<AppState, GetProductByBarcodeAction>(_getProductByBarcode),
  TypedReducer<AppState, GetProductByBarcodeActionSuccessful>(_getProductByBarcodeSuccessful),
  TypedReducer<AppState, CreateReceptionAction>(_createReception),
  TypedReducer<AppState, CreateReceptionActionSuccessful>(_createReceptionSuccessful),
  TypedReducer<AppState, ReloadProductsAction>(_clearProducts),
  TypedReducer<AppState, ReloadProductsActionSuccessful>(_replaceProducts),
  TypedReducer<AppState, SelectProductEntrySuccessful>(_selectProductEntry),
  TypedReducer<AppState, CreateNewEntryActionSuccessful>(_appendEntryToReception),
  TypedReducer<AppState, FinalizeReceptionAction>(_finalizeReception),
  TypedReducer<AppState, FinalizeReceptionActionSuccessful>(_finalizeReceptionSuccessful),
  TypedReducer<AppState, ShowFeedbackActionSuccessful>(_clearReceptionResult),
  TypedReducer<AppState, ErrorAction>(_getError),
]);

AppState _getProducts(AppState state, GetProductsAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.isLoading = true;
  });
}

AppState _getProductsSuccessful(AppState state, GetProductsActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..products.replace(action.products)
      ..feedbackMessage = '${action.products.length} produse actualizate'
      ..isLoading = false;
  });
}

AppState _clearProducts(AppState state, ReloadProductsAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..products.clear()
      ..isLoading = true;
  });
}

AppState _replaceProducts(AppState state, ReloadProductsActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..products.addAll(action.products)
      ..isLoading = false;
  });
}

AppState _getProductByBarcode(AppState state, GetProductByBarcodeAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.isLoading = true;
  });
}

AppState _getProductByBarcodeSuccessful(AppState state, GetProductByBarcodeActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..newProductEntry.quantity = state.newProductEntry?.quantity ?? 0
      ..newProductEntry.product.name = action.product.name
      ..newProductEntry.product.barcode = action.product.barcode
      ..newProductEntry.product.price = action.product.price
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
    // TODO: Use index builder.selectedProductsEntryId = action.entry.id;
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
      ..ongoingReception.company = action.reception.company
      ..ongoingReception.creatorName = action.reception.creatorName
      ..ongoingReception.invoiceNr = action.reception.invoiceNr
      ..isLoading = false;
  });
}

AppState _appendEntryToReception(AppState state, CreateNewEntryActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..newProductEntry = null
      ..ongoingReception.entries.add(action.entry);
  });
}

AppState _finalizeReception(AppState state, FinalizeReceptionAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.isLoading = true;
  });
}

AppState _finalizeReceptionSuccessful(AppState state, FinalizeReceptionActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..ongoingReception = null
      ..feedbackMessage = action.message
      ..isLoading = false;
  });
}

AppState _clearReceptionResult(AppState state, ShowFeedbackActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.feedbackMessage = null;
  });
}
