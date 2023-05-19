class CartModel
{
  int? id,userId,v;
  String? date;
  List<ProductModel>? productlist;

  CartModel({this.id, this.userId, this.v, this.date,this.productlist});


  factory CartModel.fromJson(Map mp)
  {
    List list = mp['products'] ;

    List<ProductModel> items = list.map((e) => ProductModel.fromJson(e)).toList();

    return CartModel(v: mp['__v'],id:mp['id'] ,date:mp['date'] ,userId:mp['userId'],
        productlist: items );
  }

}


class ProductModel
{
  int? productId,quantity;
  ProductModel({this.productId, this.quantity});
  factory ProductModel.fromJson(Map mp)
  {
    return ProductModel(productId: mp['productId'],quantity: mp['quantity']);
  }
}




