part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesSuccess extends CategoriesState {
  final List <dynamic>categories;

  CategoriesSuccess(this.categories);
}
class CategoriesFailure extends CategoriesState {}

class ProductCategoryLoading extends CategoriesState {}
class ProductCategorySuccess extends CategoriesState {
  final List<ProductItemModel>items;
  ProductCategorySuccess(this.items);
}
class ProductsCategoriesFailure extends CategoriesState{
  final String errorMessage;
  ProductsCategoriesFailure(this.errorMessage);
}
