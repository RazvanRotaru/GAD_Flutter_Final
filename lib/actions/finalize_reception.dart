part of actions;

@freezed
class FinalizeReceptionAction with _$FinalizeReceptionAction implements AppAction {
  const factory FinalizeReceptionAction() = FinalizeReceptionActionStart;

  const factory FinalizeReceptionAction.successful({
    required Reception reception,
  }) = FinalizeReceptionActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory FinalizeReceptionAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = FinalizeReceptionActionError;
}
