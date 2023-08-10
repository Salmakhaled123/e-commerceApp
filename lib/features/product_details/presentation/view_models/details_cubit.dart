import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shopyapp/core/utils/errors/failures.dart';
import 'package:shopyapp/features/product_details/data/repos/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitial());
  DetailsRepo detailsRepo;
  fetchProductDetails(int id)
  {
    emit(DetailsLoading());
    try {
      dynamic item=detailsRepo.fetchProductDetails(id: id);
      emit(DetailsSuccess());
    }  catch (e)
    {
      if(e is DioException)
        {
          return ServerFailure.fromDioError(e);
        }
      print(e.toString());
      emit(DetailsFailure(e.toString()));
    }
  }
}
