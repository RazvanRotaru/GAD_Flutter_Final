part of actions;

@freezed
class ReloadProductsAction with _$ReloadProductsAction implements AppAction {
  const factory ReloadProductsAction() = ReloadProductsActionStart;

  const factory ReloadProductsAction.successful({
    required List<Product> products,
  }) = ReloadProductsActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory ReloadProductsAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = ReloadProductsActionError;
}
