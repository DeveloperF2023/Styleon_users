class QuestionModel {
  int? questionId;
  int? questionProductid;
  String? questionTitle;
  String? questionDesc;
  int? productId;
  String? productName;
  String? productNameFr;
  String? productDesc;
  String? productDescFr;
  String? productImage;
  int? productStock;
  int? productStatus;
  int? productPrice;
  int? productDiscount;
  String? createdAtProduct;
  int? productCategory;

  QuestionModel(
      {this.questionId,
      this.questionProductid,
      this.questionTitle,
      this.questionDesc,
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
      this.productCategory});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionProductid = json['question_productid'];
    questionTitle = json['question_title'];
    questionDesc = json['question_desc'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameFr = json['product_name_fr'];
    productDesc = json['product_desc'];
    productDescFr = json['product_desc_fr'];
    productImage = json['product_image'];
    productStock = json['product_stock'];
    productStatus = json['product_status'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    createdAtProduct = json['created_at_product'];
    productCategory = json['product_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['question_productid'] = questionProductid;
    data['question_title'] = questionTitle;
    data['question_desc'] = questionDesc;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_fr'] = productNameFr;
    data['product_desc'] = productDesc;
    data['product_desc_fr'] = productDescFr;
    data['product_image'] = productImage;
    data['product_stock'] = productStock;
    data['product_status'] = productStatus;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['created_at_product'] = createdAtProduct;
    data['product_category'] = productCategory;
    return data;
  }
}
