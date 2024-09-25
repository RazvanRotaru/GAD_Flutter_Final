import 'package:flutter/material.dart';
import 'package:movie_db/actions/app_actions.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    print(action);
    return state;
  },
  TypedReducer<AppState, GetProductsAction>(_getProducts),
  TypedReducer<AppState, GetProductsActionSuccessful>(_getProductsSuccessful),
  TypedReducer<AppState, GetProductByBarcodeAction>(_getProductByBarcode),
  TypedReducer<AppState, ClearCurrentEntryAction>(_clearCurrentEntry),
  TypedReducer<AppState, GetProductByBarcodeActionSuccessful>(_getProductByBarcodeSuccessful),
  TypedReducer<AppState, GetProductByBarcodeActionError>(_getProductByBarcodeError),
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
  TypedReducer<AppState, RemoveEntryActionSuccessful>(_removeEntry),
  TypedReducer<AppState, LoadPendingReceptionsActionSuccessful>(_loadPendingReceptionsSuccessful),
  TypedReducer<AppState, SendPendingActionSuccessful>(_sendPendingReceptionsSuccessful),
  TypedReducer<AppState, FinalizeInventoryAction>(_finalizeInventory),
  TypedReducer<AppState, FinalizeInventoryActionSuccessful>(_finalizeInventorySuccessful),
  TypedReducer<AppState, CreateInventoryAction>(_createInventory),
  TypedReducer<AppState, CreateInventoryActionSuccessful>(_createInventorySuccessful),
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
      ..products.clear()
      ..products.addAll(action.products)
      ..feedbackMessage = '${action.products.length} produse actualizate'
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
      ..newProductEntry.id = const Uuid().v1()
      ..newProductEntry.quantity = state.newProductEntry?.quantity ?? 0
      ..newProductEntry.product.name = action.product.name
      ..newProductEntry.product.barcode = action.product.barcode
      ..newProductEntry.product.price = action.product.price
      ..isLoading = false;
  });
}

AppState _getProductByBarcodeError(AppState state, GetProductByBarcodeActionError action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..newProductEntry = null
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
      ..ongoingReception.documentType = action.reception.documentType
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

AppState _removeEntry(AppState state, RemoveEntryActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.ongoingReception.entries.remove(action.entry);
  });
}

AppState _loadPendingReceptionsSuccessful(AppState state, LoadPendingReceptionsActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.pendingReceptions = action.receptions;
  });
}

AppState _sendPendingReceptionsSuccessful(AppState state, SendPendingActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..pendingReceptions = null
      ..feedbackMessage = 'Receptiile au fost trimise cu succes';
  });
}

AppState _clearCurrentEntry(AppState state, ClearCurrentEntryAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.newProductEntry = null;
  });
}

AppState _finalizeInventorySuccessful(AppState state, FinalizeInventoryActionSuccessful action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..ongoingReception = null
      ..feedbackMessage = action.message
      ..isLoading = false;
  });
}

AppState _createInventory(AppState state, CreateInventoryAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder
      ..ongoingReception = null
      ..isLoading = true;
  });
}

AppState _createInventorySuccessful(AppState state, CreateInventoryActionSuccessful action) {
    return state.rebuild((AppStateBuilder builder) {
      builder
        ..ongoingReception.location = action.document.location
        ..ongoingReception.creatorName = action.document.creatorName
        ..ongoingReception.invoiceNr = action.document.invoiceNr
        ..ongoingReception.documentType = action.document.documentType
        ..isLoading = false;
    });
}

AppState _finalizeInventory(AppState state, FinalizeInventoryAction action) {
  return state.rebuild((AppStateBuilder builder) {
    builder.isLoading = true;
  });

}
