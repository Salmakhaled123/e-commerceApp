import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/core/utils/service_locator.dart';
import 'package:shopyapp/features/add_to_cart/presentation/view/add_to_cart_view.dart';
import 'package:shopyapp/features/categories/presentation/view/categories_view.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
import 'package:shopyapp/features/home/presentation/view/main_view.dart';
import 'package:shopyapp/features/home/presentation/view_model/home_cubit.dart';
import 'package:shopyapp/features/login-register/presentation/view_model/login_register_cubit.dart';
import 'package:shopyapp/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:shopyapp/features/product_details/presentation/view/product_details_view.dart';
import 'package:shopyapp/features/products_category/presentation/view/product_category_view.dart';
import 'package:shopyapp/features/search/data/search_repo/search_repo_imp.dart';
import 'package:shopyapp/features/search/presentation/view_model/search_cubit.dart';

import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/login-register/presentation/view/login_view.dart';
import '../../features/login-register/presentation/view/register_view.dart';
import '../../features/search/presentation/view/search_view.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const mainView = '/mainView';
  static const productCategory='/productCategory';
  static const categories = '/Categories';
  static const details = '/Details';
  static const addToCart = '/Cart';
  static const searchView = '/SearchView';
  static const registerView='/RegisterView';
  static const loginView='/LoginView';

  static final router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const OnBoardingView();
        }),
    GoRoute(
        path: homeView,
        builder: (context, state) {
          return const HomeView();
        }),
    GoRoute(
        path: categories,
        builder: (context, state) {
          return const CategoriesView();
        }),
    GoRoute(
        path: details,
        builder: (context, state) {
          return ProductDetailsView(
            model: state.extra as ProductItemModel,
          );
        }),
    GoRoute(
        path: addToCart,
        builder: (context, state) {
          return const AddToCartView();
        }),
    GoRoute(
        path: mainView,
        builder: (context, state) {
          return MultiBlocProvider(providers: [
            BlocProvider(create: (context) =>
            HomeCubit(
                getIt.get<HomeRepoImp>())
              ..fetchHomeProducts(),),
          ], child: const MainView());
        }),
    GoRoute(
        path: productCategory,
        builder: (context, state) {
          return  const ProductCategoryView();
        }),
    GoRoute(
        path: searchView,
        builder: (context, state) {
          return  const SearchView();
        }),
    GoRoute(
        path: registerView,
        builder: (context, state) {
          return  BlocProvider(create: (context)=>LoginRegisterCubit(),
              child: const RegisterView());
        }),
    GoRoute(
        path: loginView,
        builder: (context, state) {
          return  BlocProvider(create: (context)=>LoginRegisterCubit(),
              child: const LoginView());
        }),

  ]);
}
