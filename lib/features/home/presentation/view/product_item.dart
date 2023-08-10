import 'package:flutter/material.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
import 'package:shopyapp/features/home/presentation/view/product_item_section.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.model}) : super(key: key);
final ProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,bottom: 8,left: 8),
      child: Container(
          decoration: BoxDecoration(color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ProductItemSection(model: model)
          )),
    );
  }
}
