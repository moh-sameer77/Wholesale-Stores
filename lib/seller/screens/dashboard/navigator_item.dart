import 'package:flutter/material.dart';
import '../account/account_screen.dart';
import '../category_items_screen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Home", "assets/icons/shop_icon.svg", 0, CategoryItemsScreen()),

  NavigatorItem("Account", "assets/icons/account_icon.svg", 4, AccountScreen()),
];
