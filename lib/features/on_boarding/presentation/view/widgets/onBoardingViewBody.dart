import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/core/utils/app_router.dart';
import 'package:shopyapp/features/on_boarding/data/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  int currentIndex = 0;
  PageController pageController=PageController();

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
      SizedBox(height: 400,
      child: PageView.builder(
          itemCount: onBoarding.length,
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    onBoarding[index].image,
                  ),
                ),
                Text(
                  onBoarding[index].text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            );
          }),
    ),
        const SizedBox(height: 20,),
        SmoothPageIndicator(
            effect: const SlideEffect(activeDotColor: Colors.deepOrangeAccent),
            controller: pageController,
            count: onBoarding.length),
        const SizedBox(
          height: 60,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.mainView);
                },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Colors.deepOrangeAccent),
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Text('Skip',style:
                  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )),
            const SizedBox(
              width: 60,
            ),
            ElevatedButton(
                onPressed: () {
                  pageController.nextPage(duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOut);
                  if(pageController.position.maxScrollExtent==pageController.position.pixels)
                    {
                      GoRouter.of(context).push(AppRouter.registerView);
                    }
                },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    backgroundColor: Colors.deepOrangeAccent),
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:   Text('Next',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                )),
          ],
        )
      ],
    );
  }
}
