part of actions;

@freezed
class CreateNewEntryAction with _$CreateNewEntryAction implements AppAction {
  const factory CreateNewEntryAction(String name, String barcode, String quantity, String price) = CreateNewEntryActionStart;

  const factory CreateNewEntryAction.successful({
    required ProductEntry entry,
  }) = CreateNewEntryActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory CreateNewEntryAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = CreateNewEntryActionError;
}
