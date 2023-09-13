import 'package:flutter/material.dart';
import 'package:shopyapp/features/favorite/presentation/view/widgets/profile_view_body.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return    Scaffold(appBar: AppBar(title: const Text('Favorites'),centerTitle: true,),
      body:
    const FavoriteViewBody(),);
  }
}
