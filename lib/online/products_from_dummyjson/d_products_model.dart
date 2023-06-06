class D_ProductsModel
{
  num? total,skip,limit;
  List<ProductItemModel>? productlist;

  D_ProductsModel({this.total, this.skip, this.limit, this.productlist});

  factory D_ProductsModel.fromJson(Map pim)
  {
    List temp = pim['products'];
    List<ProductItemModel> products = [];
    products = temp.map((e) => ProductItemModel.fromJson(e)).toList();

    return D_ProductsModel(total: pim['total'], limit: pim['limit'],skip: pim['skip'],productlist: products);
  }
}

class ProductItemModel
{
  num? id,stock,price,discount;
  String? title,description,brand,category,thumbnail;
  List<dynamic>? imagelist;

  ProductItemModel({this.id,
    this.stock,
    this.price,
    this.discount,
    this.title,
    this.description,
    this.brand,
    this.category,
    this.thumbnail,
    this.imagelist});

  factory ProductItemModel.fromJson(Map pim)
  {
    return ProductItemModel(id:pim['id'],
        stock:pim['stock'], price:pim['price'], discount:pim['discountPercentage'],
        title:pim['title'], description:pim['description'], brand:pim['brand'],
        category:pim['category'], thumbnail:pim['thumbnail'], imagelist:pim['images']);
  }
}
