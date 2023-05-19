class CartModel
{
  int? id,userId,v;
  String? date;
  List? products;

  CartModel({this.id, this.userId, this.v, this.date,this.products});

  factory CartModel.fromJson(Map mp)
  {
    return CartModel(v: mp['__v'],id:mp['id'] ,date:mp['date'] ,userId:mp['userId'] );
  }

  void productfilter()
  {

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


// List<ProductModel> productlist = [];
//



