import 'package:shopyapp/core/utils/api_service.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
import 'package:shopyapp/features/search/data/search_repo/search_repos.dart';

class SearchRepoImp implements SearchRepo{
  final ApiService apiService;
  SearchRepoImp(this.apiService);
  @override
  fetchSearchedProductList(String input) async
  {
    var data = await apiService.get(endPoint: '/search?q=$input');
    return ProductModel.fromJson(data).products;

  }
  
}