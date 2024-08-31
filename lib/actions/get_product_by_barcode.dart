part of actions;

@freezed
class GetProductByBarcodeAction with _$GetProductByBarcodeAction implements AppAction {
  const factory GetProductByBarcodeAction(String barcode) = GetProductByBarcodeActionStart;

  const factory GetProductByBarcodeAction.successful({
    Product? product,
  }) = GetProductByBarcodeActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory GetProductByBarcodeAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = GetProductByBarcodeActionError;
}
