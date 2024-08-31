part of actions;

@freezed
class SelectProductEntry with _$SelectProductEntry implements AppAction {
  const factory SelectProductEntry() = SelectProductEntryStart;

  const factory SelectProductEntry.successful({
    required ProductEntry entry,
  }) = SelectProductEntrySuccessful;

  @Implements.fromString('ErrorAction')
  const factory SelectProductEntry.error({
    required Object error,
    required StackTrace stackTrace,
  }) = SelectProductEntryError;
}
