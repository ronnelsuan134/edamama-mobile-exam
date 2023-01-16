class SingleProductModel {
  Data? data;

  SingleProductModel({this.data});

  SingleProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  int? price;
  int? stock;
  String? title;
  String? description;
  String? photo;
  String? dir;
  Null? category;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? itemId;

  Data(
      {this.id,
      this.price,
      this.stock,
      this.title,
      this.description,
      this.photo,
      this.dir,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.itemId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    stock = json['stock'];
    title = json['title'];
    description = json['description'];
    photo = json['photo'];
    dir = json['dir'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    itemId = json['itemId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['title'] = this.title;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['dir'] = this.dir;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['itemId'] = this.itemId;
    return data;
  }
}