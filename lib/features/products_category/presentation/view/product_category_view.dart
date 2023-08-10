import 'package:flutter/material.dart';
import 'package:shopyapp/features/products_category/presentation/view/widgets/product_category_view_body.dart';
class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
    body:  ProductCategoryViewBody(),);
  }
}
