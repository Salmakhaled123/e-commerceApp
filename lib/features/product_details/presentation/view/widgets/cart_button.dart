import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/features/home/data/product_model.dart';

import '../../../../../core/utils/assets/asset_data.dart';
import '../../../../add_to_cart/presentation/view_model/cart_cubit.dart';
class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.model}) : super(key: key);
final ProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addToCart(model);
              showDialog(
                  context: context,
                  builder: (context) {
                    return  AlertDialog(contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title:
                        const  Text('Success',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 21),),content:
                        Image.asset(AssetData.addToCart,
                          width: 150,height: 150,));
                  });
            },
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
              )),
            ),
            child: const Text('Add to Cart')),
      ),
    );
  }
}
