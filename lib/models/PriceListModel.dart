class PriceListModel {
  int id;
  double consulationPrice;
  bool recommend;

  PriceListModel({this.id, this.consulationPrice, this.recommend});

  PriceListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consulationPrice = json['consulationPrice'];
    recommend = json['recommend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consulationPrice'] = this.consulationPrice;
    data['recommend'] = this.recommend;
    return data;
  }
}