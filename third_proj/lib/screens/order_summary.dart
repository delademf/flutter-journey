import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:food/models/food.dart';
// import 'package:food/models/food_card_new.dart';
// import 'package:food/models/food_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third_proj/components/food_card.dart';
import 'package:third_proj/components/foodprovider.dart';
import 'package:third_proj/helper/constant.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  List<Food> foodsList = [];

  @override
  void initState() {
    super.initState();
    fetchFoodDetails(context);
  }

  Future<void> fetchFoodDetails(BuildContext context) async {
    final foodCounts = context.read<FoodCartProvider>().foodCounts;
    for (var entry in foodCounts.entries.where((entry) => entry.value > 0)) {
      final foodId = entry.key;
      findFoodById(foodId, context);
    }
  }

  Future<bool> findFoodById(int id, BuildContext context) async {
    var uri = Uri.parse("$baseUrl/food/find-by-id/$id");
    Map<String, String> header = {"Content-Type": "application/json"};
    var response = await http.post(uri, headers: header);
    var parsedJson = jsonDecode(response.body);
    Food food = Food.fromJson(parsedJson);

    setState(() {
      foodsList.add(food);
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final foodCounts = context.watch<FoodCartProvider>().foodCounts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 5,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFF31B2ED)              )
                        ,child: IconButton(onPressed:(){
                          Navigator.pushNamed(context, "/Mainscreen");
                        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,) )),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text("Order Summary", style: TextStyle(color: Color(0xFF31B2ED),fontSize: 20),),
                        )
                  ],
                ),
              ),
              SizedBox(height: 20,),
            // const Text(
            //   "Your Selected Items",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Color(0xFF31B2ED)
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 10),
            foodsList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: foodsList.length,
                    itemBuilder: (context, index) {
                      final food = foodsList[index];
                      final imageBytes = base64Decode(food.image);
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Image.memory(imageBytes),
                          title: Text(
                            food.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                              "Quantity: ${foodCounts[food.id]}",style: TextStyle(color: Colors.black),),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: const Color(0xFF31B2ED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                makeOrder(context);
                // Timer.periodic(10 as Duration, print);
                await Future.delayed(Duration(seconds: 5));
                context.read<FoodCartProvider>().clearCart();

                Navigator.pushNamed(context, '/successful');
              },
              child: const Text(
                "Make Order",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> makeOrder(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userId = prefs.getInt('userId');
  final foodCounts = context.read<FoodCartProvider>().foodCounts;

  var uri = Uri.parse("$baseUrl/order/create-order");
  Map<String, String> headers = {"Content-Type": "application/json"};

  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  final random = Random();
  String uniqueId = List.generate(
      20, (index) => characters[random.nextInt(characters.length)]).join();

  for (var entry in foodCounts.entries) {
    final body = jsonEncode({
      'foodId': entry.key,
      'quantity': entry.value,
      'userId': userId,
      'idForOrder': uniqueId,
    });

    await http.post(uri, headers: headers, body: body);
  }

  return true;
}