import 'package:flutter/material.dart';
import 'package:shopyapp/features/home/presentation/view/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(appBar: AppBar(centerTitle: true,
        title:const Text('Home')),
      body:
            const HomeViewBody(),
    );



  }
}
