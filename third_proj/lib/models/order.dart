// import 'package:food/models/order_item.dart';
import 'package:third_proj/models/order_item.dart';

class Order {
  String idForOrder;
  List<OrderItem> items;

  Order({required this.idForOrder, required this.items});

  // Method to parse a map of orders from JSON
  static List<Order> fromJson(Map<String, dynamic> json) {
    return json.entries.map((entry) {
      return Order(
        idForOrder: entry.key,
        items: (entry.value as List<dynamic>)
            .map((item) => OrderItem.fromJson(item))
            .toList(),
      );
    }).toList();
  }
}