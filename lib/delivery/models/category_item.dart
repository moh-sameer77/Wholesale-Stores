import 'package:flutter/cupertino.dart';
import 'package:grocery_app/delivery/models/grocery_item.dart';

class CategoryItem extends ChangeNotifier {
  final int? id;
  final String name;
  final String imagePath;
  List<GroceryItem> listOfProducts;

  CategoryItem({this.id, required this.name, required this.imagePath, required this.listOfProducts});
}

var categoryItemsDemo = [
  CategoryItem(
    name: "Wholesale Store 1",
    imagePath: "assets/images/categories_images/wholesale_Logo.png",
    listOfProducts: beverages
  ),
  CategoryItem(
    name: "Wholesale Store 2",
    imagePath: "assets/images/categories_images/oil.png",
    listOfProducts: GroceryItemsProvider().groceries
  ),
  // CategoryItem(
  //   name: "Meat & Fish",
  //   imagePath: "assets/images/categories_images/meat.png",
  // ),
  // CategoryItem(
  //   name: "Bakery & Snacks",
  //   imagePath: "assets/images/categories_images/bakery.png",
  // ),
  // CategoryItem(
  //   name: "Dairy & Eggs",
  //   imagePath: "assets/images/categories_images/dairy.png",
  // ),
  // CategoryItem(
  //   name: "Beverages",
  //   imagePath: "assets/images/categories_images/beverages.png",
  // ),
];
