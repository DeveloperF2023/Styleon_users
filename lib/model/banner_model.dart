class BannerModel {
  int? bannersId;
  String? bannersTitle;
  String? bannersTitle1;
  String? bannersSubtitle;
  String? bannersSubtitle1;
  String? bannersBody;
  String? bannersBody1;
  String? bannersImage;
  String? bannersBackground;

  BannerModel(
      {this.bannersId,
      this.bannersTitle,
      this.bannersTitle1,
      this.bannersSubtitle,
      this.bannersSubtitle1,
      this.bannersBody,
      this.bannersBody1,
      this.bannersImage,
      this.bannersBackground});

  BannerModel.fromJson(Map<String, dynamic> json) {
    bannersId = json['banners_id'];
    bannersTitle = json['banners_title'];
    bannersTitle1 = json['banners_title1'];
    bannersSubtitle = json['banners_subtitle'];
    bannersSubtitle1 = json['banners_subtitle1'];
    bannersBody = json['banners_body'];
    bannersBody1 = json['banners_body1'];
    bannersImage = json['banners_image'];
    bannersBackground = json['banners_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banners_id'] = this.bannersId;
    data['banners_title'] = this.bannersTitle;
    data['banners_title1'] = this.bannersTitle1;
    data['banners_subtitle'] = this.bannersSubtitle;
    data['banners_subtitle1'] = this.bannersSubtitle1;
    data['banners_body'] = this.bannersBody;
    data['banners_body1'] = this.bannersBody1;
    data['banners_image'] = this.bannersImage;
    data['banners_background'] = this.bannersBackground;
    return data;
  }
}
