import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopyapp/core/utils/errors/failures.dart';
import 'package:shopyapp/features/home/data/repos/home_repo.dart';
import 'package:shopyapp/features/home/presentation/view/home_view.dart';
import '../../../add_to_cart/presentation/view/add_to_cart_view.dart';
import '../../../favorite/presentation/view/profile_view.dart';
import '../../data/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  List<ProductItemModel>products=[];
  fetchHomeProducts()async
  {
    emit(HomeLoading());
    try {
      var response=await homeRepo.fetchProducts();
      print(response);
      products=[];
      for(var item in response)
        {
          products.add(item);
        }
     emit(HomeSuccess(products));
    }  catch (e)
    {
     if( e is DioException)
       {
         return ServerFailure.fromDioError(e);
       }
     print(e.toString());
     emit(HomeFailure(e.toString()));
    }
  }
  int currentIndex=0;
  changeIndex(int index)
  {
    currentIndex=index;
    emit(ChangedIndexSuccessfully());
  }
  List<Widget>views=const [
    HomeView(),
    AddToCartView(),
    FavoriteView()
  ];
  List<BottomNavigationBarItem>items=const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorite'),
  ];
  List<ProductItemModel>favProducts=[];
  bool isFavorite(ProductItemModel model)
  {
    model.isFav=!model.isFav;
    if(model.isFav)
      {
        favProducts.add(model);
      }
    else  if(!model.isFav){
      favProducts.remove(model);
    }
    emit(AddToFav());
    return model.isFav;

  }
  deleteProduct(ProductItemModel model)
  {
    model.isFav=false;
    favProducts.remove(model);
    emit(DeletedSuccessfully());
  }
  bool isDark=false;
  changeTheme()
  {
    isDark=!isDark;
    emit(ChangeTheme());
  }


}
