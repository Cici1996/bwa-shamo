import 'package:mobile_app/models/product_model.dart';

class MessageModel {
  String? message;
  int? userId;
  String? username;
  String? userImage;
  bool isFromuser = true;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProductModel? product;

  MessageModel(
      {this.message,
      this.userId,
      this.userImage,
      this.username,
      this.isFromuser = true,
      this.createdAt,
      this.updatedAt,
      this.product});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    userId = json["userId"];
    userImage = json["userImage"];
    username = json["userName"];
    isFromuser = json["isFromUser"];
    createdAt = DateTime.parse(json["createdAt"]);
    updatedAt = DateTime.parse(json["updatedAt"]);
    product = json["product"].isEmpty
        ? UnitialiazeProductModel()
        : ProductModel.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "userId": userId,
      "userImage": userImage,
      "username": username,
      "isFromuser": isFromuser,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      "product": product is UnitialiazeProductModel ? {} : product?.toJson(),
    };
  }
}
