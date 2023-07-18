import 'package:flutter/material.dart';
import 'package:grocery_app/delivery/models/grocery_item.dart';

class Cart with ChangeNotifier{
  List<GroceryItem> _items = [];

  List<GroceryItem> get items => _items;

  double _price = 0.0;
  void addItems(GroceryItem item){
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }
  void removeItem(GroceryItem item){
    _items.remove(item);
    _price = _price - item.price;
    notifyListeners();
  }
  void clearCart() {
    _items.clear();
    _price = 0.0;
    notifyListeners();
  }

  int get count{
    return _items.length;
  }
  double get totalPrice{
    return _price;
  }

}