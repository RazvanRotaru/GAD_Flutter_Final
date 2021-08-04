part of actions;

@freezed
class ReloadMoviesAction with _$ReloadMoviesAction implements AppAction {
  factory ReloadMoviesAction() = ReloadMoviesAction$;

  ReloadMoviesAction._();

  int get randomPage => Random().nextInt(100) + 1;
}
