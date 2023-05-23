class ProductsModel
{
  int? total,skip,limit;
  List<ItemProductModel> items = [] ;

  ProductsModel({this.total, this.skip, this.limit, required this.items});

  factory ProductsModel.fromJson(Map mp)
  {
    return ProductsModel(
        skip: mp['skip'],
        limit: mp['limit'],
        total: mp['total'],
        items: mp['products'].map((e)=>ItemProductModel.fromJson(e)).toList()
    );
  }
}

class ItemProductModel
{
  int? id,price,stock;
  double? rating,discount;
  String? title,description,brand,category,thumbnail;

  ItemProductModel(
      {this.id,
      this.price,
      this.stock,
      this.rating,
      this.discount,
      this.title,
      this.description,
      this.brand,
      this.category,
      this.thumbnail});

  factory ItemProductModel.fromJson(Map mp)
  {
    return ItemProductModel(id:mp['id'], title: mp['title'], price: mp['price'],brand: mp['brand'],category: mp['category'],description: mp['description'],discount: mp['discount'],rating: mp['rating'],stock: mp['stock'],thumbnail: mp['thumbnail'],);
  }
}

// class ImagesModel
// {
//   String? path;
//   ImagesModel({this.path});
//
//   factory ImagesModel.fromJson(List list)
//   {
//     return ImagesModel(path: );
//
//   }
//}