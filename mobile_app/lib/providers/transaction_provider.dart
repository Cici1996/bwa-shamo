import 'package:flutter/cupertino.dart';
import 'package:mobile_app/models/cart_model.dart';
import 'package:mobile_app/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
