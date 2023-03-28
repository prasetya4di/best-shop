abstract class ShoppingCartState {}

class ShoppingCartIdleState extends ShoppingCartState {}

class ShoppingCartLoadingState extends ShoppingCartState {}

class ShoppingCartLoadedState extends ShoppingCartState {}

class ShoppingCartEmptyState extends ShoppingCartState {}

class ShoppingCartRemovedItemState extends ShoppingCartState {}
