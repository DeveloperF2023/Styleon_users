
class OrderModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
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

  OrderModel(
      {this.ordersId,
        this.ordersUserid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPriceDelivery,
        this.ordersPrice,
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

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_priceDelivery'];
    ordersPrice = json['orders_price'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_priceDelivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
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

