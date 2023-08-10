import 'package:flutter/material.dart';
class TitleView extends StatelessWidget {
  const TitleView({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Center(
        child: Text(
          title,
          style:const  TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
