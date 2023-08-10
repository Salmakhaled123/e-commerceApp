import 'package:shopyapp/core/utils/api_service.dart';
import 'package:shopyapp/features/home/data/repos/home_repo.dart';

import '../product_model.dart';

class HomeRepoImp implements HomeRepo{
  ApiService apiService;
  HomeRepoImp(this.apiService);
  
  @override
  fetchProducts() async{
   var response=await apiService.get(endPoint: '?skip=0&limit=10');
  dynamic data =ProductModel.fromJson(response) ;
    return data.products;
    
  }
  
}