import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
import 'package:shopyapp/features/product_details/presentation/view/widgets/price_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cart_button.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({Key? key, required this.model}) : super(key: key);
  final ProductItemModel model;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: widget.model.images.length,
                itemBuilder: (context, index) => Image.network(
                  widget.model.images[index],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
                effect:
                    const SlideEffect(activeDotColor: Colors.deepOrangeAccent),
                controller: pageController,
                count: widget.model.images.length),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.model.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.model.description,
                style: TextStyle(color: Colors.grey[500]!, fontSize: 21),
              ),
            ),
            RatingBar.builder(
              initialRating: widget.model.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(
              height: 10,
            ),
           const  Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Available in stock ',
                style: const TextStyle(color: Colors.green, fontSize: 21),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
           PriceSection(model: widget.model),
            const Spacer(),
             AddToCartButton(model: widget.model,)
          ],
        ),
      );
    }
  }
}
