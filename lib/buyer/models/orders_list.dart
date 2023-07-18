import 'package:flutter/material.dart';
import 'order_model.dart';

class OrdersList with ChangeNotifier{
  List<Order> _ordersList = [];

  List<Order> get orders => _ordersList;

  void addOrder(Order order){
    _ordersList.add(order);
    notifyListeners();
  }

  int get count{
    return _ordersList.length;
  }

  void clear(){
    _ordersList.clear();
  }


}