import 'package:flutter/cupertino.dart';

class HomeScreenProvider extends ChangeNotifier {
  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
