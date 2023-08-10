import 'package:flutter/material.dart';
import 'package:shopyapp/features/search/presentation/view/widgets/search_view_body.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child:
    SearchViewBody()),);
  }
}
