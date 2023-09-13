import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyapp/core/utils/assets/asset_data.dart';
import 'package:shopyapp/features/home/presentation/view_model/home_cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<HomeCubit>(context);
        if(cubit.favProducts.isNotEmpty)
          {
            return ListView.builder(physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return ListTile(leading: Image.network(cubit.favProducts[index].thumbnail),
                  trailing: IconButton(onPressed: (){
                    cubit.deleteProduct(cubit.favProducts[index]);
                  }, icon: const Icon(Icons.delete)),
                  title: Text(cubit.favProducts[index].title,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                  subtitle: Text('${cubit.favProducts[index].price}\$',style: const TextStyle(fontSize: 21,)),);
              },
              itemCount: cubit.favProducts.length,

            );
          }
       return Center(child: Image.asset(AssetData.addToCart));

      },
    );
  }
}
