import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.formKey, required this.text, this.onPressed,

  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child:  Text(
          text,
          style: const TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold),
        ));
  }
}
