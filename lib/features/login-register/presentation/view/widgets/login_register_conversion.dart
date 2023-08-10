import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class LoginRegisterConversion extends StatelessWidget {
  const LoginRegisterConversion({
    Key? key, required this.text1, required this.text2, required this.location,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push(location);
            },
            child:  Text(
              text2,
              style:const  TextStyle(
                  fontSize: 18,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}

