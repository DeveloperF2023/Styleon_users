class OffersModel {
  int? offersId;
  int? offersTime;
  String? offersTitle;
  String? offersSubtitle;
  String? offersBody;

  OffersModel(
      {this.offersId,
      this.offersTime,
      this.offersTitle,
      this.offersSubtitle,
      this.offersBody});

  OffersModel.fromJson(Map<String, dynamic> json) {
    offersId = json['offers_id'];
    offersTime = json['offers_time'];
    offersTitle = json['offers_title'];
    offersSubtitle = json['offers_subtitle'];
    offersBody = json['offers_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offers_id'] = offersId;
    data['offers_time'] = offersTime;
    data['offers_title'] = offersTitle;
    data['offers_subtitle'] = offersSubtitle;
    data['offers_body'] = offersBody;
    return data;
  }
}
