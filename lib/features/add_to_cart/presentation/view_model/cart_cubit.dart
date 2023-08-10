import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shopyapp/core/utils/errors/failures.dart';

import '../../../home/data/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductItemModel>cart=[];
  int counter=0;
  double total=0;
  void addToCart(ProductItemModel model)
  {
    try {
      cart.add(model);
      counter++;
      total+=model.price;
      emit(CartSuccess(cart));

    }  catch (e)
    {
      if(e is DioException)
        {
          ServerFailure.fromDioError(e);
          emit(CartFailure(e.toString()));
        }
      emit(CartFailure(e.toString()));
    }
  }
  void deleteFromCart(ProductItemModel model)
  {
    total-=model.price;
    cart.remove(model);
    counter--;
    emit(DeleteFromCart(counter));
    emit(CartSuccess(cart));
  }
}
