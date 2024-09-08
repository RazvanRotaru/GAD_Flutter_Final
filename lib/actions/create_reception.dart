part of actions;

@freezed
class CreateReceptionAction with _$CreateReceptionAction implements AppAction {
  const factory CreateReceptionAction({required String user, required String company, required String invoiceNr}) =
      CreateReceptionActionStart;

  const factory CreateReceptionAction.successful(
      {required Reception reception}) = CreateReceptionActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory CreateReceptionAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = CreateReceptionActionError;
}
