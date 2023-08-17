import 'package:flutter/foundation.dart';

class FavouriteItemProvider extends ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(value) {
    selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(value) {
    selectedItem.remove(value);
    notifyListeners();
  }
}
