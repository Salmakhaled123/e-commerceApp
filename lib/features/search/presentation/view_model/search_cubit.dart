import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shopyapp/core/utils/errors/failures.dart';
import 'package:shopyapp/features/search/data/search_repo/search_repos.dart';

import '../../../home/data/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;
  List<ProductItemModel>items=[];

  fetchSearchResults(String input)async
  {
    items=[];
    emit(SearchLoading());
    try {
    List<ProductItemModel> data=await searchRepo.fetchSearchedProductList(input);
          for(var item in data)
            {
              items.add(item);
            }
      print(data.length);
      emit(SearchSuccess(items));
    } catch (e)
    {
     if(e is DioException)
       {
         ServerFailure.fromDioError(e);
         emit(SearchFailure(e.toString()));
       }
     print(e.toString());
     emit(SearchFailure(e.toString()));
    }

  }
  deleteList()
  {
    items=[];
    emit(EmptySearch());
  }
}
