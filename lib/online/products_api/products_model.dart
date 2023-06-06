class ShoppingModel {
  num? id,price;
  String? title, description, category, image;
  RatingModel? ratingModel;

  ShoppingModel({this.id,
    this.price,
    this.title,
    this.description,
    this.category,
    this.image,
    this.ratingModel});

  factory ShoppingModel.fromJson(Map mp)
  {
    return ShoppingModel(id: mp['id'],
        title: mp['title'],
        description: mp['description'],
        category: mp['category'],
        price: mp['price'],
        image: mp['image'],
        ratingModel: RatingModel.fromJson(mp['rating']),
        );
  }
}

class RatingModel {
  num? count,rate;

  RatingModel({this.count, this.rate});

  factory RatingModel.fromJson(Map mp)
  {
    return RatingModel(count: mp['count'], rate: mp['rate']);
  }
}
//    num? id,price; -- id
//   String? title, description, category, image;  -- category
//   num? count,rate; --

// category  = women's clothing   electronics   jewelery    men's clothing