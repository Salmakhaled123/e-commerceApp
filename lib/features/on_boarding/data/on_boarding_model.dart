import 'package:shopyapp/core/utils/assets/asset_data.dart';

class BoardingModel {
  final String image;
  final String text;

  BoardingModel(this.image, this.text);
}

List<BoardingModel> onBoarding = [
  BoardingModel(AssetData.onBoardingImage1, 'Welcome to our App'),
  BoardingModel(AssetData.onBoardingImage2, 'Discover new products '),
  BoardingModel(AssetData.onBoardingImage3, 'make online shopping'),
];