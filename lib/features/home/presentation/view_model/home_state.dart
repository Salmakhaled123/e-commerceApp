part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final List<ProductItemModel>products;

  HomeSuccess(this.products);
}
class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure(this.errorMessage);
}
class ChangedIndexSuccessfully extends HomeState{}
