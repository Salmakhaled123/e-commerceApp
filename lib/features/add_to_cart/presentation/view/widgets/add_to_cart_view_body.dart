import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/core/utils/assets/asset_data.dart';
import 'package:shopyapp/features/add_to_cart/presentation/view_model/cart_cubit.dart';

class AddToCartViewBody extends StatelessWidget {
  const AddToCartViewBody({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if(state is CartSuccess && state.cart.isNotEmpty)
          {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(itemCount: state.cart.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>ListTile(

                            trailing:IconButton(onPressed: (){
                              BlocProvider.of<CartCubit>(context).deleteFromCart(state.cart[index]);
                            }, icon:const  Icon(Icons.delete)),
                            leading:
                            Image.network(state.cart[index].thumbnail,),
                            title:  Text(state.cart[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                            subtitle: Text('${state.cart[index].price.toString()} \$',
                              style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),))

                    ),
                  ),
                  Row(children:  [
                    const  Text('Total ',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                    const   Spacer(),
                    Text('${BlocProvider.of<CartCubit>(context).total} \$',style: const
                    TextStyle(fontSize: 21,fontWeight: FontWeight.bold))
                  ],),
                  ElevatedButton(onPressed: (){
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
                  }, child:const  Text('Buy now'))

                ],
              ),
            );

          }
        return Center(child: Image.asset(AssetData.emptyCart),);
      },
    );
  }
}
