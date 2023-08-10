import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/core/utils/app_router.dart';
import 'package:shopyapp/features/search/presentation/view_model/search_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dark_mode_outlined,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.searchView);
            BlocProvider.of<SearchCubit>(context).deleteList();
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
