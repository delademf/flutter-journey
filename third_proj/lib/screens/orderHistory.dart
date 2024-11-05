import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third_proj/components/order_card.dart';
import 'package:third_proj/helper/constant.dart';
import 'package:third_proj/models/order.dart';

class Orderhistory extends StatefulWidget {
  const Orderhistory({super.key});

  @override
  State<Orderhistory> createState() => _OrderhistoryState();
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 60);
    path.quadraticBezierTo(width / 2, height, width, height - 60);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _OrderhistoryState extends State<Orderhistory> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    findOrdersByUserId(context);
  }

  Future<dynamic> findOrdersByUserId(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    if (userId != null) {
      var uri = Uri.parse("$baseUrl/order/find-order-by-user/$userId");
      Map<String, String> header = {"Content-Type": "application/json"};
      var response = await http.post(uri, headers: header);




      if (response.statusCode == 200) {
        var parsedJson = jsonDecode(response.body) as Map<String, dynamic>;

        
     
        List<Order> fetchedOrders = Order.fromJson(parsedJson);


        Logger().d(fetchedOrders);

        setState(() {
          orders = fetchedOrders;
        });

        print("Fetched orders for user $userId:");
        for (var order in orders) {
          print("Order ID: ${order.idForOrder}");
        }
      } else {
        print("Failed to fetch orders: ${response.statusCode}");
      }
    } else {
      print("User ID not found in SharedPreferences.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text("            Order History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: orders.isNotEmpty
        //     ? ListView.builder(
        //         itemCount: orders.length,
        //         itemBuilder: (context, index) {
        //           return OrderCard(order: orders[index]);
        //         },
        //       )
        //     : const Center(child: CircularProgressIndicator()),
        child: 
        
        ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return OrderCard(order: orders[index]);
                },
              )
      ),
    );
  }
}