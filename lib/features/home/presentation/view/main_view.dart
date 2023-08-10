import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/features/home/presentation/view_model/home_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(bottomNavigationBar:  BottomNavigationBar(items: cubit.items,
          currentIndex: cubit.currentIndex,
          unselectedItemColor: Colors.grey,

          type: BottomNavigationBarType.fixed,
          onTap: (index){
            cubit.changeIndex(index);
          },),
          body: cubit.views[cubit.currentIndex],


        );
      },
    );
  }
}
