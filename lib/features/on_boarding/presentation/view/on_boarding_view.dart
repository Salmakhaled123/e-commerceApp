import 'package:flutter/material.dart';
import 'package:shopyapp/features/on_boarding/presentation/view/widgets/onBoardingViewBody.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnBoardingViewBody()),);
  }
}
