class ProductModel{
final List<ProductItemModel> products;

  ProductModel({required this.products});
  factory ProductModel.fromJson(dynamic json)
  {
    List<ProductItemModel>items=[];
    json['products'].map((item){
      items.add(ProductItemModel.fromJson(item));
    }).toList();
    return ProductModel( products: items);
  }

}
class ProductItemModel{
final int id;
final String description;
final int price;
final String title;
final String thumbnail;
final List<String>images;
final double discountPercentage;
final double rating;
final int stock;
final String category;
bool isFav=false;


ProductItemModel(
    {required this.stock,required this.category,isFav,
  required this.id,required this.description,required this.title,
  required this.thumbnail,required this.price,required this.rating,
   required this.images, required this.discountPercentage,});
factory ProductItemModel.fromJson(dynamic json)
{
  return ProductItemModel(category: json['category'],
      id: json['id'],
      stock: json['stock'] ?? 0,
      rating: json['rating'].toDouble(),
      price: json['price'].toInt() ,
      description: json['description'], 
      title: json['title'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
      discountPercentage: json['discountPercentage'].toDouble()  );
}

}