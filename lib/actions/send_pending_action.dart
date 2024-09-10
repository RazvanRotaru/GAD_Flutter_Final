part of actions;

@freezed
class SendPendingAction with _$SendPendingAction implements AppAction {
  const factory SendPendingAction(List<String> pendingReceptions) = SendPendingActionStart;

  const factory SendPendingAction.successful() = SendPendingActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory SendPendingAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = SendPendingActionError;
}
