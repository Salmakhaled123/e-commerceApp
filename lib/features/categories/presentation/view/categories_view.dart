import 'package:flutter/material.dart';
import 'package:shopyapp/features/categories/presentation/view/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(appBar: AppBar(centerTitle: true,
        title: const Text('Categories')),
      body: const CategoriesViewBody()
    );
  }
}
