import 'package:flutter/material.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
class ProductItemSection extends StatelessWidget {
  const ProductItemSection({Key? key, required this.model}) : super(key: key);
final ProductItemModel model;
  @override
  Widget build(BuildContext context) {
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

          Text(model.title,maxLines: 1,
            style: const TextStyle(overflow: TextOverflow.ellipsis,

                fontSize: 21,fontWeight: FontWeight.bold),),
          Text('${model.price} \$',style: const
          TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),


        ]);
  }
}
