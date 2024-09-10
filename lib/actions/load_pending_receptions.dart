part of actions;

@freezed
class LoadPendingReceptionsAction with _$LoadPendingReceptionsAction implements AppAction {
  const factory LoadPendingReceptionsAction() = LoadPendingReceptionsActionStart;

  const factory LoadPendingReceptionsAction.successful({required List<String> receptions}) = LoadPendingReceptionsActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory LoadPendingReceptionsAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = LoadPendingReceptionsActionError;
}
