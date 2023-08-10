import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/core/utils/app_router.dart';
import '../../view_models/categories_cubit.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state)
      {
        return ListView.builder(physics: const BouncingScrollPhysics(),
            itemCount: cubit.categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(decoration: BoxDecoration(
                    color: const Color(0xffF3AA60),
                    borderRadius: BorderRadius.circular(16)),
                  child: ListTile(onTap: ()async {
                  await  BlocProvider.of<CategoriesCubit>(context).fetchProductCategory(
                        cubit.categories[index]);
                    GoRouter.of(context).push(AppRouter.productCategory );


                  },
                    leading: const Icon(Icons.shopping_basket,),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    title: Text(cubit.categories[index], style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold,
                    ),),),
                ),
              );
            });
      },
    );
  }
}
