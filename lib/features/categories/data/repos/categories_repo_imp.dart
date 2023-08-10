
import 'package:dio/dio.dart';
import 'package:shopyapp/core/utils/api_service.dart';
import 'package:shopyapp/features/home/data/product_model.dart';

import 'categories_repo.dart';

class CategoriesRepoImp implements CategoriesRepo{
  ApiService apiService;
  CategoriesRepoImp(this.apiService);
  @override
  Future fetchAllCategories() async
  {
  List<dynamic>categories= await apiService.get(endPoint: '/categories');
  return categories;
  }

  @override
 Future fetchProductsCategory(String category) async
  {
   dynamic productsCategory=await apiService.get(endPoint: '/category/$category');
   var data =ProductModel.fromJson(productsCategory);
      print(data.products[0].category);
   return data.products;
  }

}

