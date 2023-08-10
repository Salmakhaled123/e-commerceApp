import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/core/utils/app_router.dart';
import 'package:shopyapp/features/home/presentation/view/advertisments.dart';
import 'package:shopyapp/features/home/presentation/view/custom_app_bar.dart';
import 'package:shopyapp/features/home/presentation/view/product_item.dart';
import 'package:shopyapp/features/home/presentation/view_model/home_cubit.dart';
import 'package:shopyapp/features/product_details/presentation/view_models/details_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const Advertisements(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Text(
                  'Top Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.categories);
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 10,),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state)
            {
              if (state is HomeSuccess)
              {
                return Expanded(
                  child: GridView.builder(
                      itemCount: state.products.length, physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          ), itemBuilder: (context, index) {
                    return  GestureDetector(onTap: (){
                      BlocProvider.of<DetailsCubit>(context).fetchProductDetails(state.products[index].id);
                      GoRouter.of(context).push(AppRouter.details,extra: state.products[index]);
                    },
                        child: ProductItem(model: state.products[index],));
                  }),
                );
              }
              return const Center(child: CircularProgressIndicator(),);
            },
          )
        ],
      ),
    );
  }
}
