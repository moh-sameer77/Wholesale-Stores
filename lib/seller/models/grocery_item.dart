
import 'package:flutter/cupertino.dart';

class GroceryItem with ChangeNotifier{
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });


}

class GroceryItemsProvider extends ChangeNotifier {
  // List<GroceryItem> itemList = [];
  var exclusiveOffers = [demoItems[0], demoItems[1]];

  var bestSelling = [demoItems[2], demoItems[3]];

  var groceries = [demoItems[4], demoItems[5]];

  void addGroceryItem(List<GroceryItem> itemsList, GroceryItem newItem) {
    itemsList.add(newItem);
    notifyListeners();
  }

  void removeGroceryItem(List<GroceryItem> itemsList, GroceryItem newItem) {
    itemsList.remove(newItem);
    notifyListeners();
  }


}

  var demoItems = [
    GroceryItem(
        id: 1,
        name: "Pepsi Pack",
        description: "6 cans of Pepsi 355 mL",
        price: 6.99,
        imagePath: "assets/images/product_images/Pepsi-Cola-355mL-Cans-12-Pack.jpg"),
    GroceryItem(
        id: 2,
        name: "BOOM BOOM",
        description: "24pcs",
        price: 12.99,
        imagePath: "assets/images/product_images/boob-boom-24-pcs.jpg"),
    GroceryItem(
        id: 3,
        name: "Ferero Rocher",
        description: "42pcs, 10oz per pc",
        price: 19.99,
        imagePath: "assets/images/product_images/fereroRocher42x10oz.jpg"),
    GroceryItem(
        id: 4,
        name: "Cheetos pack",
        description: "6pcs, 10oz",
        price: 4.99,
        imagePath: "assets/images/product_images/cheetos1OZx6pcs.png"),
    GroceryItem(
        id: 5,
        name: "Kinder Bueno pack",
        description: "20pcs, 30g",
        price: 19.99,
        imagePath: "assets/images/product_images/kinderBueno20x43g.jpg"),
    GroceryItem(
        id: 6,
        name: "Lays chips",
        description: "Lays mix potato chips variety pack",
        price: 4.99,
        imagePath: "assets/images/product_images/Lays-Mix-Potato-Chips-Variety-Pack-6101774.jpg"),
  ];


  var beverages = [
    GroceryItem(
        id: 7,
        name: "Dite Coke",
        description: "355ml, Price",
        price: 1.99,
        imagePath: "assets/images/beverages_images/diet_coke.png"),
    GroceryItem(
        id: 8,
        name: "Sprite Can",
        description: "325ml, Price",
        price: 1.50,
        imagePath: "assets/images/beverages_images/sprite.png"),
    GroceryItem(
        id: 8,
        name: "Apple Juice",
        description: "2L, Price",
        price: 15.99,
        imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
    GroceryItem(
        id: 9,
        name: "Orange Juice",
        description: "2L, Price",
        price: 1.50,
        imagePath: "assets/images/beverages_images/orange_juice.png"),
    GroceryItem(
        id: 10,
        name: "Coca Cola Can",
        description: "325ml, Price",
        price: 4.99,
        imagePath: "assets/images/beverages_images/coca_cola.png"),
    GroceryItem(
        id: 11,
        name: "Pepsi Can",
        description: "330ml, Price",
        price: 4.99,
        imagePath: "assets/images/beverages_images/pepsi.png"),
  ];
