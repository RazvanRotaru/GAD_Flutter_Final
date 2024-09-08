part of actions;

@freezed
class EmailReceptionAction with _$EmailReceptionAction implements AppAction {
  const factory EmailReceptionAction(String receptionPath) = EmailReceptionActionStart;

  const factory EmailReceptionAction.successful({
    required String platformMessage,
  }) = EmailReceptionActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory EmailReceptionAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = EmailReceptionActionError;
}
