import 'dart:convert';
import 'package:mobile_app/contants/general_constans.dart';
import 'package:mobile_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = GeneralConstants.baseUrl;

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse("$baseUrl/products");
    var headers = {"Content-Type": "application/json"};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"]["data"];
      List<ProductModel> products = [];
      for (var e in data) {
        products.add(ProductModel.fromJson(e));
      }
      return products;
    } else {
      throw Exception("Gagal Get  Products");
    }
  }
}
