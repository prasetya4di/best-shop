abstract class ProductPerCategoryState {}

class ProductIdleState extends ProductPerCategoryState {}

class ProductLoadingState extends ProductPerCategoryState {}

class ProductLoadedState extends ProductPerCategoryState {}

class ProductEmptyState extends ProductPerCategoryState {}

class CategoryNotFoundState extends ProductPerCategoryState {}
