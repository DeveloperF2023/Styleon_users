class DataCartModel {
  String? countPrice;
  int? countProducts;
  int? cartId;
  int? cartUserid;
  int? cartProductId;
  int? productId;
  String? productName;
  String? productNameFr;
  String? productDesc;
  String? productDescFr;
  String? productImage;
  int? productStock;
  int? productStatus;
  int? productPrix;
  int? productDiscount;
  String? createdAtProduct;
  int? productCategory;
  double? productRating;

  DataCartModel(
      {this.countPrice,
        this.countProducts,
        this.cartId,
        this.cartUserid,
        this.cartProductId,
        this.productId,
        this.productName,
        this.productNameFr,
        this.productDesc,
        this.productDescFr,
        this.productImage,
        this.productStock,
        this.productStatus,
        this.productPrix,
        this.productDiscount,
        this.createdAtProduct,
        this.productCategory,
        this.productRating});

  DataCartModel.fromJson(Map<String, dynamic> json) {
    countPrice = json['countPrice'];
    countProducts = json['countProducts'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProductId = json['cart_productid'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameFr = json['product_name_fr'];
    productDesc = json['product_desc'];
    productDescFr = json['product_desc_fr'];
    productImage = json['product_image'];
    productStock = json['product_stock'];
    productStatus = json['product_status'];
    productPrix = json['product_price'];
    productDiscount = json['product_discount'];
    createdAtProduct = json['created_at_product'];
    productCategory = json['product_category'];
    productRating = json['product_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countPrice'] = countPrice;
    data['countProducts'] = countProducts;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_productid'] = cartProductId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_fr'] = productNameFr;
    data['product_desc'] = productDesc;
    data['product_desc_fr'] = productDescFr;
    data['product_image'] = productImage;
    data['product_stock'] = productStock;
    data['product_status'] = productStatus;
    data['product_price'] = productPrix;
    data['product_discount'] = productDiscount;
    data['created_at_product'] = createdAtProduct;
    data['product_category'] = productCategory;
    data['product_rating'] = productRating;
    return data;
  }
}