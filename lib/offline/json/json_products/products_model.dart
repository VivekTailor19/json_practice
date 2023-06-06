class P_model
{
  int? total,skip,limit;
  List<ItemP_model> items = [] ;

  P_model({this.total, this.skip, this.limit, required this.items});

  factory P_model.fromJson(Map mp)
  {
    List l1 =mp['products'];
    return P_model(
        skip: mp['skip'],
        limit: mp['limit'],
        total: mp['total'],
        items: l1.map((e)=>ItemP_model.fromJson(e)).toList(),
    );
  }
}

class ItemP_model
{
  int? id,price,stock;
  num? rating,discount;
  String? title,description,brand,category,thumbnail;

  ItemP_model(
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

  factory ItemP_model.fromJson(Map mp)
  {
    return ItemP_model(id:mp['id'], title: mp['title'], price: mp['price'],brand: mp['brand'],category: mp['category'],description: mp['description'],discount: mp['discount'],rating: mp['rating'],stock: mp['stock'],thumbnail: mp['thumbnail'],);
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