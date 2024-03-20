class CategoriesModel{
  int? categoryId;
  String? categoryName;
  String? categoryNameFr;
  String? categoryImage;
  String? createdAt;

  CategoriesModel(
      {this.categoryId,
        this.categoryName,
        this.categoryNameFr,
        this.categoryImage,
        this.createdAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameFr = json['category_name_fr'];
    categoryImage = json['category_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_name_fr'] = categoryNameFr;
    data['category_image'] = categoryImage;
    data['created_at'] = createdAt;
    return data;
  }
}