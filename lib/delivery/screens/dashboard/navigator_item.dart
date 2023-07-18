import 'package:flutter/material.dart';
import 'package:grocery_app/delivery/screens/account/account_screen.dart';

import '../../../seller/screens/orders_screen.dart';


class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Home", "assets/icons/shop_icon.svg", 0, OrdersScreen()),

  NavigatorItem("Account", "assets/icons/account_icon.svg", 1, AccountScreen()),
];
