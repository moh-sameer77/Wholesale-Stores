import 'package:flutter/material.dart';

import '../my_details.dart';
import '../notifications_screen.dart';
import '../orders_screen.dart';

class AccountItem {
  final String label;
  final String iconPath;
  final Widget screen;

  AccountItem(this.label, this.iconPath, this.screen);
}

List<AccountItem> accountItems = [
  AccountItem("Orders", "assets/icons/account_icons/orders_icon.svg", OrdersScreen()),
  AccountItem("My Details", "assets/icons/account_icons/details_icon.svg", EditProfilePage()),
  AccountItem("Notifications", "assets/icons/account_icons/notification_icon.svg", std_notificatio()),
  AccountItem("About", "assets/icons/account_icons/about_icon.svg", EditProfilePage()),
];