class ProductModel {
  int? productId;
  String? productName;
  String? productNameFr;
  String? productDesc;
  String? productDescFr;
  String? productImage;
  int? productStock;
  int? productStatus;
  double? productPrice;
  double? productRating;
  String? countPrice;
  int? productDiscount;
  String? createdAtProduct;
  int? productCategory;
  int? categoryId;
  String? categoryName;
  String? categoryNameFr;
  String? categoryImage;
  String? createdAtCat;
  int? favorite;

  ProductModel(
      {this.productId,
        this.productName,
        this.productNameFr,
        this.productDesc,
        this.productDescFr,
        this.productImage,
        this.productStock,
        this.productStatus,
        this.productPrice,
        this.productRating,
        this.productDiscount,
        this.createdAtProduct,
        this.productCategory,
        this.categoryId,
        this.categoryName,
        this.categoryNameFr,
        this.categoryImage,
        this.createdAtCat,
        this.favorite,
        this.countPrice
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameFr = json['product_name_fr'];
    productDesc = json['product_desc'];
    productDescFr = json['product_desc_fr'];
    productImage = json['product_image'];
    productStock = json['product_stock'];
    productRating = json['product_rating'];
    productStatus = json['product_status'];
    productPrice = json['product_price'].toDouble();
    productDiscount = json['product_discount'];
    createdAtProduct = json['created_at_product'];
    productCategory = json['product_category'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameFr = json['category_name_fr'];
    categoryImage = json['category_image'];
    createdAtCat = json['created_at_cat'];
    favorite = json['favorite'];
    countPrice = json['countPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_fr'] = productNameFr;
    data['product_desc'] = productDesc;
    data['product_desc_fr'] = productDescFr;
    data['product_image'] = productImage;
    data['product_stock'] = productStock;
    data['product_rating'] = productRating;
    data['product_status'] = productStatus;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['created_at_product'] = createdAtProduct;
    data['product_category'] = productCategory;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_name_fr'] = categoryNameFr;
    data['category_image'] = categoryImage;
    data['created_at_cat'] = createdAtCat;
    data['favorite'] = favorite;
    data['countPrice'] = countPrice;
    return data;
  }
}