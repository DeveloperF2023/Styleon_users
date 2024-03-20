class BrandsModel {
  int? brandsId;
  String? brandsImages;
  String? brandsTitle;

  BrandsModel({this.brandsId, this.brandsImages, this.brandsTitle});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    brandsId = json['brands_id'];
    brandsImages = json['brands_images'];
    brandsTitle = json['brands_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brands_id'] = brandsId;
    data['brands_images'] = brandsImages;
    data['brands_title'] = brandsTitle;
    return data;
  }
}