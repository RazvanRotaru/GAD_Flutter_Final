part of actions;

@freezed
class CreateReceptionAction with _$CreateReceptionAction implements AppAction {
  const factory CreateReceptionAction() = CreateReceptionActionStart;

  const factory CreateReceptionAction.successful({
    required String receptionId,
  }) = CreateReceptionActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory CreateReceptionAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = CreateReceptionActionError;
}
