import 'package:flutter/cupertino.dart';

class PageProvider with ChangeNotifier {
  int _curentIndex = 0;
  int get currentIndex => _curentIndex;

  set currentIndex(int index) {
    _curentIndex = index;
    notifyListeners();
  }
}
