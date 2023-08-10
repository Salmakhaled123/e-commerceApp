import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/features/add_to_cart/presentation/view/widgets/add_to_cart_view_body.dart';
import 'package:shopyapp/features/add_to_cart/presentation/view_model/cart_cubit.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(appBar: AppBar(title: Text('My Cart (${BlocProvider
            .of<CartCubit>(context)
            .counter})'),
            centerTitle: true),
          body: const AddToCartViewBody(),);
      },
    );
  }
}

