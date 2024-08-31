part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {

  factory AppState() {
    return _$AppState((AppStateBuilder builder) {
      builder
        .isLoading = false;
    });
  }

  AppState._();

  BuiltList<Product> get products;

  BuiltMap<String, ReceptionRecord>? get receptions;

  Reception? get ongoingReception;

  bool get isLoading;

  String? get errMessage;

  String? get selectedProductsEntryId;
}
