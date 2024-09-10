part of actions;

@freezed
class RemoveEntryAction with _$RemoveEntryAction implements AppAction {
  const factory RemoveEntryAction(String id) = RemoveEntryActionStart;

  const factory RemoveEntryAction.successful({required ProductEntry entry}) = RemoveEntryActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory RemoveEntryAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = RemoveEntryActionError;
}
