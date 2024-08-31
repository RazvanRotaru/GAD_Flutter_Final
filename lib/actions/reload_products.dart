part of actions;

@freezed
class ReloadProductsAction with _$ReloadProductsAction implements AppAction {
  factory ReloadProductsAction() = ReloadProductsAction$;

  ReloadProductsAction._();

  int get randomPage => Random().nextInt(100) + 1;
}
