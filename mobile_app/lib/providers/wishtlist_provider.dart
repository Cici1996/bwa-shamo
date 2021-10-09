import 'package:flutter/cupertino.dart';
import 'package:mobile_app/models/product_model.dart';

class WishtListProvider with ChangeNotifier {
  List<ProductModel> _wishList = [];

  List<ProductModel> get wishList => _wishList;

  set wishList(List<ProductModel> list) {
    _wishList = list;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishList(product)) {
      _wishList.add(product);
    } else {
      _wishList.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  isWishList(ProductModel productModel) {
    if (_wishList.indexWhere((element) => element.id == productModel.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
