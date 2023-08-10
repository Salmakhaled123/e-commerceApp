import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopyapp/core/utils/assets/asset_data.dart';
import 'package:shopyapp/features/search/presentation/view_model/search_cubit.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TextField(controller:searchController ,
                onSubmitted: (value)  {
             BlocProvider.of<SearchCubit>(context).fetchSearchResults(searchController.text);


                },
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                hintText: 'Search for product'),
          ),
          const SizedBox(height: 10,),
          BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    if(state is SearchLoading)
      {
        return const LinearProgressIndicator();
      }
    else if( state is SearchSuccess)
      {

        return Expanded(
          child: ListView.builder(itemCount: state.resultsList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return Card(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(children:
                    [
                      SizedBox(width: 75,height: 120,
                        child: Padding(padding: const EdgeInsets.all(8),
                          child: Image.network(fit: BoxFit.cover,
                              state.resultsList[index].thumbnail),
                        ),
                      ),
                      const  SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(state.resultsList[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          const  SizedBox(height: 10,),
                          Text('${state.resultsList[index].price} \$',
                            style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.orange),),

                        ],
                      ),

                    ]),
                  ),
                );
              }),
        );

      }
    else
      {
      return  Expanded(child:
      Image.asset(AssetData.searchEngine));
      }

  },
), 

             
         

        ],
      );
  },
),
    );
  }
}
