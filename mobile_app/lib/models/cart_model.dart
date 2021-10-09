import 'package:mobile_app/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  late int quantity;

  CartModel({this.id, required this.quantity, this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    quantity = json["quantity"];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "product": product?.toJson(), "quantity": quantity};
  }

  double getTotalPrice() {
    return product?.price ?? 0.0 * quantity;
  }
}
