class MarsModel {
  int? price;
  String? id;
  String? type;
  String? imgSrc;

  MarsModel({this.price, this.id, this.type, this.imgSrc});

  MarsModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    id = json['id'];
    type = json['type'];
    imgSrc = json['img_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['id'] = this.id;
    data['type'] = this.type;
    data['img_src'] = this.imgSrc;
    return data;
  }
}