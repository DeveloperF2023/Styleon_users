class RatingDetailModel {
  int? ratingId;
  String? ratingDescription;
  int? ratingNumber;
  int? ratingUsers;
  int? ratingOrders;
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
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
  num? ordersTotalPrice;
  int? ordersCoupon;
  String? ordersDate;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? ordersDelivery;
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;
  int? userId;
  String? username;
  String? email;
  String? password;
  String? phone;
  int? verifyCode;
  int? approve;
  String? createdAt;

  RatingDetailModel(
      {this.ratingId,
        this.ratingDescription,
        this.ratingNumber,
        this.ratingUsers,
        this.ratingOrders,
        this.countPrice,
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
        this.ordersId,
        this.ordersUserid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPriceDelivery,
        this.ordersPrice,
        this.ordersTotalPrice,
        this.ordersCoupon,
        this.ordersDate,
        this.ordersPaymentmethod,
        this.ordersStatus,
        this.ordersDelivery,
        this.addressId,
        this.addressUserid,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressName,
        this.userId,
        this.username,
        this.email,
        this.password,
        this.phone,
        this.verifyCode,
        this.approve,
        this.createdAt});

  RatingDetailModel.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    ratingDescription = json['rating_description'];
    ratingNumber = json['rating_number'];
    ratingUsers = json['rating_users'];
    ratingOrders = json['rating_orders'];
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
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_priceDelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_totalPrice'];
    ordersCoupon = json['orders_coupon'];
    ordersDate = json['orders_date'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDelivery = json['orders_delivery'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    verifyCode = json['verify_code'];
    approve = json['approve'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_id'] = ratingId;
    data['rating_description'] = ratingDescription;
    data['rating_number'] = ratingNumber;
    data['rating_users'] = ratingUsers;
    data['rating_orders'] = ratingOrders;
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
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_priceDelivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalPrice'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_date'] = ordersDate;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_delivery'] = ordersDelivery;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['verify_code'] = verifyCode;
    data['approve'] = approve;
    data['created_at'] = createdAt;
    return data;
  }
}