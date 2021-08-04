part of actions;

@freezed
class GetMoviesAction with _$GetMoviesAction implements AppAction {
  const factory GetMoviesAction() = GetMoviesActionStart;

  const factory GetMoviesAction.successful({
    required List<Movie> movies,
  }) = GetMoviesActionSuccessful;

  @Implements(ErrorAction)
  const factory GetMoviesAction.error({
    required Object error,
    required StackTrace stackTrace,
  }) = GetMoviesActionError;
}
