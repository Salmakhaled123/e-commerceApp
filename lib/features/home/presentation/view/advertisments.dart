import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopyapp/core/utils/assets/asset_data.dart';
class Advertisements extends StatelessWidget {
  const Advertisements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images=[
      AssetData.ads1,
      AssetData.ads3,
      AssetData.ads2,
    ];
    return SizedBox(height: MediaQuery.of(context).size.height*0.25,
      width:MediaQuery.of(context).size.width ,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CarouselSlider.builder(itemCount: images.length,
            itemBuilder: (context,index,realIndex){
          return Image.asset(images[index],width: MediaQuery.of(context).size.width,
            height: 100,fit: BoxFit.fill,);
            }, options: CarouselOptions(autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.easeIn),),
      ),
    );
  }
}
