class GetCartModel {
  Data? data;

  GetCartModel({this.data});

  GetCartModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Items>? items;

  Data(
      {this.id,
      this.userId,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    totalPrice = json['totalPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['totalPrice'] = this.totalPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? name;
  int? quantity;
  int? price;
  int? subTotalPrice;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? cartId;
  String? productId;

  Items(
      {this.id,
      this.name,
      this.quantity,
      this.price,
      this.subTotalPrice,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.cartId,
      this.productId});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    subTotalPrice = json['subTotalPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    cartId = json['cartId'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['subTotalPrice'] = this.subTotalPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['cartId'] = this.cartId;
    data['productId'] = this.productId;
    return data;
  }
}