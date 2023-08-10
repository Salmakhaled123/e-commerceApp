import 'package:flutter/material.dart';
import 'package:shopyapp/features/home/data/product_model.dart';
class PriceSection extends StatefulWidget {
  const PriceSection({Key? key, required this.model}) : super(key: key);
final ProductItemModel model;
  @override
  State<PriceSection> createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(children: [
              const TextSpan(
                text: 'Price :',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              TextSpan(
                text: ' ${widget.model.price} \$',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black),
              ),
            ])),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
              color: Colors.amber, shape: BoxShape.rectangle),
          child: Text(
            '${widget.model.discountPercentage.ceil()} % offer',
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
