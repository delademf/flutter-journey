import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:food/models/food.dart';
// import 'package:food/models/food_card.dart';
// import 'package:food/models/food_cart_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:third_proj/components/food_card.dart';
import 'package:third_proj/components/food_card_new.dart';
import 'package:third_proj/components/foodprovider.dart';
import 'package:third_proj/helper/constant.dart';

class RestaurantScreen extends StatefulWidget {
  final int id;

  RestaurantScreen({required this.id});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Food> foods = [];
  Map<int, int> foodCounts = {}; // Map to store count for each food item

  @override
  void initState() {
    super.initState();
    getFoodsRestaurantById(widget.id, context);
  }

  Future<bool> getFoodsRestaurantById(int id, BuildContext context) async {
    var uri =
        Uri.parse("$baseUrl/food/find-by-restaurantid/$id");

    Map<String, String> headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: headers);

    List jsonResponse = jsonDecode(response.body);

    var foodList = jsonResponse.map((food) => Food.fromJson(food)).toList();

    setState(() {
      foods = foodList;
      foodCounts = {for (var food in foods) food.id: 0}; // Initialize counts
    });

    return true;
  }

  void incrementFoodCount(int id) {
    setState(() {
      foodCounts[id] = (foodCounts[id] ?? 0) + 1;
    });
  }

  void decrementFoodCount(int id) {
    setState(() {
      if ((foodCounts[id] ?? 0) > 0) {
        foodCounts[id] = (foodCounts[id] ?? 0) - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1,top: 40),
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
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Text("Place your order", style: TextStyle(color: Color(0xFF31B2ED),fontSize: 20),),
                        )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       "Chicken and Chips",
              //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              //     ),
              //     Image.asset("assets/images/chicken and chips.jpeg")
              //   ],
              // ),
              // Food List with increment and decrement buttons
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return Column(
                      children: [
                        FoodCardNew(
                          id: food.id,
                          price: food.price,
                          name: food.name,
                          image: food.image,
                          quantity: food.id,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<FoodCartProvider>()
                                    .decrementFoodCount(food.id);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '${context.watch<FoodCartProvider>().foodCounts[food.id] ?? 0}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<FoodCartProvider>()
                                    .incrementFoodCount(food.id);
                              },
                              icon: Icon(Icons.add,),
                            ),
                          ],
                        ),
                      ],
                    );
                  
                  },
                ),
              ),
              Padding(
            padding: const EdgeInsets.only(top: 250, left: 10, right: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFF31B2ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/odersSummary");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check Order Summary",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          ),
            ],

          ),
        ),
      ),
    );
  }
}
