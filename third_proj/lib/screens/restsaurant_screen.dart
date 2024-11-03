import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:second_proj/models/Card.dart';
// import 'package:second_proj/models/food.dart';
// import 'package:second_proj/models/restaurant.dart';
import 'package:http/http.dart' as http;
// import 'package:second_proj/models/restaurant_card.dart';
import 'package:third_proj/components/card.dart';
import 'package:third_proj/components/food_card.dart';
// import 'package:third_proj/components/food.dart';


class RestaurantScreen extends StatefulWidget {
  final int id;

  // const RestaurantScreen({super.key});

  RestaurantScreen({required this.id});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  
  List<Food> foods= [];

  @override
  void initState() {
    super.initState();
    // Call your function here
    retrieveAllFoodsByRestaurantId(widget.id, context);
  }
  
Future<bool> retrieveAllFoodsByRestaurantId(int id,BuildContext context) async {
    //create uri
    var uri = Uri.parse("https://c8aa-196-61-37-18.ngrok-free.app/food/find-by-restaurantid/$id");
    //header
    Map<String, String> header = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: header);

    List jsonResponse = jsonDecode(response.body);

    var foodList = jsonResponse.map((food) => Food.fromJson(food)).toList();


    // Update state to trigger a rebuild
    setState(() {
      foods = foodList;
    });


    for (var food in foods) {
      print(food.name);
    }
    //print the response body
    print("${response.body}");
    print("hello......................................................................................");
    return true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF31B2ED),
                  
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            );
          },
        ),
        automaticallyImplyLeading: true,
        title: Column(
          children: [
           
          ],
        ),
        
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF31B2ED),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Order');
                },
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(color: Color(0xFF31B2ED)),
              child: Text(
                'X',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.person_2_sharp,
                  color: Color(0xFF31B2ED),
                ),
                title: Text('Profile'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
              leading: Icon(
                Icons.delivery_dining_outlined,
                color: Color(0xFF31B2ED),
              ),
              title: Text('Online order'),
              shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
            ),
            ListTile(
                leading:
                    Icon(Icons.menu_open_outlined, color: Color(0xFF31B2ED)),
                title: Text('Menu'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
                leading: Icon(Icons.track_changes_outlined,
                    color: Color(0xFF31B2ED)),
                    onTap: () {
                      Navigator.pushNamed(context, '/tracker');
                    },
                title: Text('Tracker'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
                leading: Icon(Icons.update,
                    color: Color(0xFF31B2ED)),
                    onTap: () {
                      Navigator.pushNamed(context, '/update');
                    },
                title: Text('update user'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
                leading: Icon(Icons.delete_forever,
                    color: Color(0xFF31B2ED)),
                    onTap: () {
                      Navigator.pushNamed(context, '');
                    },
                title: Text('Delete'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
                leading:
                    Icon(Icons.contacts_outlined, color: Color(0xFF31B2ED)),
                title: Text('Contacts'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
                leading: Icon(Icons.info_outline, color: Color(0xFF31B2ED)),
                title: Text('About us '),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
          ],
        ),
      ),


      body: Container(
                height:
                    400, // Set a fixed height or use MediaQuery to make it responsive
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: Color(0xFF0E3F6),
                    // ),
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return GeneralCard(
                      id: foods[index].id,
                      price: foods[index].price,
                      name: foods[index].name,
                      image: foods[index].image,
                    );
                  },
                ),
              ),



    );
  }
}