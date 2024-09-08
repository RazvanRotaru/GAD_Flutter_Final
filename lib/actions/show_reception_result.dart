part of actions;

@freezed
class ShowFeedbackAction with _$ShowFeedbackAction implements AppAction {
  const factory ShowFeedbackAction(BuildContext context, String message) = ShowFeedbackActionStart;

  const factory ShowFeedbackAction.successful() = ShowFeedbackActionSuccessful;

  @Implements.fromString('ErrorAction')
  const factory ShowFeedbackAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = ShowFeedbackActionError;
}
