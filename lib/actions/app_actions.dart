abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  ErrorAction(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;
}
