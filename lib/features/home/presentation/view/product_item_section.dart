import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
import 'package:shopyapp/features/home/presentation/view_model/home_cubit.dart';
class ProductItemSection extends StatelessWidget {
  const ProductItemSection({Key? key, required this.model}) : super(key: key);
final ProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    var cubit =BlocProvider.of<HomeCubit>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.yellow,
            child: Text('${model.discountPercentage.ceil()}%-discount',
              style:const  TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
          Expanded(
            child: Image.network(model.thumbnail
              ,
              width: 80,height:100,fit: BoxFit.fill,),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
          Row(
            children: [
              Expanded(
                child: Text(model.title,maxLines: 1,
                  style: const TextStyle(overflow: TextOverflow.ellipsis,

                      fontSize: 21,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(width: 5,),
    IconButton(padding: EdgeInsets.zero,
    onPressed: (){
    cubit.isFavorite(model);
    }, icon: model.isFav?

    const Icon(Icons.favorite,color: Colors.red,):
    const Icon(Icons.favorite_border_outlined)),
            ],
          ),
          Text('${model.price} \$',style: const
          TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),


        ]);
  },
);
  }
}
