import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/contants/general_constans.dart';
import 'package:mobile_app/models/cart_model.dart';

class TransactionService {
  String baseUrl = GeneralConstants.baseUrl;

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse("$baseUrl/checkout");
    var headers = {"Content-Type": "application/json", "Authorization": token};
    var body = jsonEncode({
      "address": "Marsemoon",
      "items": carts
          .map((e) => {"id": e.product?.id, "quantity": e.quantity})
          .toList(),
      "status": "PENDING",
      "total_price": totalPrice,
      "shipping_price": 0
    });
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Checkout");
    }
  }
}
