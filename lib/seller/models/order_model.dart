import 'cart_model.dart';
import 'grocery_item.dart';

class Order {
  final String orderId;
  final List<GroceryItem> itemsList;
  final double totalPrice;
  final String status;

  Order({
    required this.orderId,
    required this.itemsList,
    required this.totalPrice,
    required this.status,
  });

  List<GroceryItem> get items => itemsList;

  factory Order.fromCart(Cart2 cart) {
    return Order(
      orderId: generateOrderId(),
      itemsList: cart.items.toList(),
      totalPrice: cart.totalPrice,
      status: 'pending',
    );
  }

  List printAllItems() {
    List itemNames = [];
    for (int i = 0; i < items.length; i++) {
      itemNames[i] = items[i].name;
    }
    return itemNames;
  }

  static int _orderIdCounter = 0;

  static String generateOrderId() {
    _orderIdCounter++;
    return 'ORD$_orderIdCounter';
  }
}