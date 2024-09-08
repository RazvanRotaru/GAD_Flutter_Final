part of actions;

@freezed
class SaveReceptionAction with _$SaveReceptionAction implements AppAction {
  const factory SaveReceptionAction(Reception reception) = SaveReceptionActionStart;

  const factory SaveReceptionAction.successful({
    required String receptionPath,
  }) = SaveReceptionActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory SaveReceptionAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = SaveReceptionActionError;
}
