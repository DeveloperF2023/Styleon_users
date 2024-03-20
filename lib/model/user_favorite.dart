class UserFavorite {
  int? favoriteId;
  int? favoriteUserid;
  int? favoriteProductid;
  int? productId;
  String? productName;
  String? productNameFr;
  String? productDesc;
  String? productDescFr;
  String? productImage;
  int? productStock;
  int? productStatus;
  double? productPrice;
  int? productDiscount;
  String? createdAtProduct;
  int? productCategory;
  int? userId;

  UserFavorite(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteProductid,
      this.productId,
      this.productName,
      this.productNameFr,
      this.productDesc,
      this.productDescFr,
      this.productImage,
      this.productStock,
      this.productStatus,
      this.productPrice,
      this.productDiscount,
      this.createdAtProduct,
      this.productCategory,
      this.userId});

  UserFavorite.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteProductid = json['favorite_productid'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameFr = json['product_name_fr'];
    productDesc = json['product_desc'];
    productDescFr = json['product_desc_fr'];
    productImage = json['product_image'];
    productStock = json['product_stock'];
    productStatus = json['product_status'];
    productPrice = json['product_price'].toDouble();
    productDiscount = json['product_discount'];
    createdAtProduct = json['created_at_product'];
    productCategory = json['product_category'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_productid'] = this.favoriteProductid;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_fr'] = this.productNameFr;
    data['product_desc'] = this.productDesc;
    data['product_desc_fr'] = this.productDescFr;
    data['product_image'] = this.productImage;
    data['product_stock'] = this.productStock;
    data['product_status'] = this.productStatus;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['created_at_product'] = this.createdAtProduct;
    data['product_category'] = this.productCategory;
    data['user_id'] = this.userId;
    return data;
  }
}
