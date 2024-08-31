part of actions;

@freezed
class GetProductsAction with _$GetProductsAction implements AppAction {
  const factory GetProductsAction() = GetProductsActionStart;

  const factory GetProductsAction.successful({
    required List<Product> products,
  }) = GetProductsActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory GetProductsAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = GetProductsActionError;
}
