part of actions;

@freezed
class ShowProductDetailsAction with _$ShowProductDetailsAction implements AppAction {
  const factory ShowProductDetailsAction() = ShowProductDetailsActionStart;

  const factory ShowProductDetailsAction.successful({
    required List<Product> products,
  }) = ShowProductDetailsActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory ShowProductDetailsAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = ShowProductDetailsActionError;
}
