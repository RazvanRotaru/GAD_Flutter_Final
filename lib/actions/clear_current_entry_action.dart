part of actions;

@freezed
class ClearCurrentEntryAction with _$ClearCurrentEntryAction implements AppAction {
  const factory ClearCurrentEntryAction() = ClearCurrentEntryActionStart;

  const factory ClearCurrentEntryAction.successful() = ClearCurrentEntryActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory ClearCurrentEntryAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = ClearCurrentEntryActionError;
}
