part of actions;

@freezed
class FinalizeReceptionAction/* extends CallableThunkAction<AppState>*/ with _$FinalizeReceptionAction implements AppAction  {
  const factory FinalizeReceptionAction(Reception reception) = FinalizeReceptionActionStart;

  const factory FinalizeReceptionAction.successful({
    required String message,
  }) = FinalizeReceptionActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory FinalizeReceptionAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = FinalizeReceptionActionError;
}
