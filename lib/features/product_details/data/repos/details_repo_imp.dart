import 'package:shopyapp/core/utils/api_service.dart';
import 'package:shopyapp/features/product_details/data/repos/details_repo.dart';

class DetailsRepoImp implements DetailsRepo{
  ApiService apiService;
  DetailsRepoImp(this.apiService);
  @override
  fetchProductDetails({required int id}) async{
    var response=await apiService.get(endPoint: '/$id');
    print(response);
  }

}