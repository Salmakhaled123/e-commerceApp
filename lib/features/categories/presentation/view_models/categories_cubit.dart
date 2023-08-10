import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/core/utils/errors/failures.dart';
import 'package:shopyapp/features/categories/data/repos/categories_repo.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());
  CategoriesRepo categoriesRepo;
  List<dynamic>categories=[];
  fetchCategories()async
  {
    emit(CategoriesLoading());
    try {
      var response =await categoriesRepo.fetchAllCategories() ;

      for(var item in response)
        {
         categories.add(item);
        }
      emit(CategoriesSuccess(categories));
    }
    catch (e)
    {
     if(e is DioException)
       {
         return ServerFailure.fromDioError(e);
       }
     print(e.toString());
     emit(CategoriesFailure());
    }
    
  }
  List<ProductItemModel>items=[];

 fetchProductCategory(String category)async
  {
items=[];
    emit(ProductCategoryLoading());
  try {
   var data=await categoriesRepo.fetchProductsCategory(category);
   for(var item in data)
     {
       items.add(item);
     }
   emit(ProductCategorySuccess(items));
   print(items.length);
print('length ${data.length}');

  }  catch (e)
  {
    if( e is DioException)
      {
        ServerFailure.fromDioError(e);

      }
    print(e.toString());
   emit(ProductsCategoriesFailure(e.toString()));
  }

  }
}
