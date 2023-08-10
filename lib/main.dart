import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/core/utils/app_router.dart';
import 'package:shopyapp/core/utils/cache.dart';
import 'package:shopyapp/core/utils/service_locator.dart';
import 'package:shopyapp/features/add_to_cart/presentation/view_model/cart_cubit.dart';
import 'package:shopyapp/features/categories/data/repos/categories_repo_imp.dart';
import 'package:shopyapp/features/categories/presentation/view_models/bloc_observer.dart';
import 'package:shopyapp/features/categories/presentation/view_models/categories_cubit.dart';
import 'package:shopyapp/features/product_details/data/repos/details_repo_imp.dart';
import 'package:shopyapp/features/product_details/presentation/view_models/details_cubit.dart';
import 'package:shopyapp/features/search/data/search_repo/search_repo_imp.dart';
import 'package:shopyapp/features/search/presentation/view_model/search_cubit.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  Bloc.observer = MyObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();

runApp( const ShopApp());
}
class ShopApp extends StatelessWidget {
  const  ShopApp({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CartCubit(),),
      BlocProvider(create: (context)=>CategoriesCubit(getIt.get<CategoriesRepoImp>())..fetchCategories(),),
      BlocProvider(create: (context)=>DetailsCubit(getIt.get<DetailsRepoImp>())),
      BlocProvider(create: (context)=>SearchCubit(getIt.get<SearchRepoImp>()))

    ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

            primarySwatch: Colors.deepOrange,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange)),
      ),
    );
  }
}
