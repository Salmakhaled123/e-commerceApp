import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopyapp/core/utils/api_service.dart';
import 'package:shopyapp/features/categories/data/repos/categories_repo_imp.dart';
import 'package:shopyapp/features/home/data/repos/home_repo_imp.dart';
import 'package:shopyapp/features/product_details/data/repos/details_repo_imp.dart';

import '../../features/search/data/search_repo/search_repo_imp.dart';

final getIt=GetIt.instance;
void setUp()
{
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton<DetailsRepoImp>(DetailsRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton<CategoriesRepoImp>(CategoriesRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(getIt.get<ApiService>()));

}