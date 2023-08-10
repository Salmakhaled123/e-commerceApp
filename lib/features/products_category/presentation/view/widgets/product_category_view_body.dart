import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../categories/presentation/view_models/categories_cubit.dart';
import '../../../../home/presentation/view/product_item.dart';
import '../../../../product_details/presentation/view_models/details_cubit.dart';

class ProductCategoryViewBody extends StatelessWidget {
  const ProductCategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return
          GridView.builder(
              itemCount: cubit.items.length, physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ), itemBuilder: (context, index) {
          return  GestureDetector(onTap: (){
              BlocProvider.of<DetailsCubit>(context).fetchProductDetails(cubit.items[index].id);
              GoRouter.of(context).push(AppRouter.details,extra: cubit.items[index]);
            },
                child: ProductItem(model: cubit.items[index],));
          });
      },
    );
  }
}
