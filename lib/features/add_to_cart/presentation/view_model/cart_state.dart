part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartSuccess extends CartState {
  final List<ProductItemModel>cart;

  CartSuccess(this.cart);
}
class CartFailure extends CartState {
  final String errorMessage;

  CartFailure(this.errorMessage);
}
class DeleteFromCart extends CartState{
  final int counter;

  DeleteFromCart(this.counter);

}

