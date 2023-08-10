import 'package:flutter/material.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
import 'package:shopyapp/features/product_details/presentation/view/widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.model}) : super(key: key);
final ProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ProductDetailsBody(model: model,)),
    );
  }
}
