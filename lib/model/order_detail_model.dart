class OrderDetailModel {
  String? countPrice;
  int? countProducts;
  int? cartId;
  int? cartUserid;
  int? cartProductid;
  int? cartOrders;
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
  double? productRating;
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
  double? ordersTotalPrice;
  int? ordersCoupon;
  String? ordersDate;
  int? ordersPaymentMethod;
  int? ordersStatus;
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;

  OrderDetailModel(
      {this.countPrice,
      this.countProducts,
      this.cartId,
      this.cartUserid,
      this.cartProductid,
      this.cartOrders,
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
      this.productRating,
      this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPriceDelivery,
      this.ordersPrice,
      this.ordersTotalPrice,
      this.ordersCoupon,
      this.ordersDate,
      this.ordersPaymentMethod,
      this.ordersStatus,
      this.addressId,
      this.addressUserid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    countPrice = json['countPrice'];
    countProducts = json['countProducts'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProductid = json['cart_productid'];
    cartOrders = json['cart_orders'];
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
    productRating = json['product_rating'];
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_priceDelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_totalPrice'].toDouble();
    ordersCoupon = json['orders_coupon'];
    ordersDate = json['orders_date'];
    ordersPaymentMethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countPrice'] = countPrice;
    data['countProducts'] = countProducts;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_productid'] = cartProductid;
    data['cart_orders'] = cartOrders;
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
    data['product_rating'] = productRating;
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_priceDelivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalPrice'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_date'] = ordersDate;
    data['orders_paymentmethod'] = ordersPaymentMethod;
    data['orders_status'] = ordersStatus;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    return data;
  }
}
