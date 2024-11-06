import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:third_proj/components/restaurant.dart';
import 'package:third_proj/components/restaurant_card.dart';
import 'package:third_proj/helper/constant.dart';
import 'package:third_proj/screens/account.dart';
import 'package:third_proj/screens/chats.dart';
import 'package:third_proj/screens/delete.dart';
import 'package:third_proj/screens/orderHistory.dart';
import 'package:third_proj/screens/orders.dart';
import 'package:http/http.dart' as http;
import 'package:third_proj/screens/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  get labelBehavior => null;
  int currentPageIndex = 0;
  final List<Widget> pages =[
        Orderhistory(),
        Chats(),
        // Profile(),
        Account()
  ];


 List<Restaurant> restaurants= [];

  @override
  void initState() {
    super.initState();
    // Call your function here
    retrieveAllRestaurants(context);
  }



Future<bool> retrieveAllRestaurants(BuildContext context) async {
    //create uri
    var uri = Uri.parse("$baseUrl/restaurant/find-all-restaurants");
    //header
   Map<String, String> header = {"Content-Type": "application/json"};

    var response = await http.post(uri, headers: header);

    List jsonResponse = json.decode(response.body);

    var restaurantList = jsonResponse
        .map((restaurant) => Restaurant.fromJson(restaurant))
        .toList();

    // Update state to trigger a rebuild
    setState(() {
      restaurants = restaurantList;
    });


    for (var restaurant in restaurants) {
      print(restaurant.name);
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
                  Navigator.pushNamed(context, '/odersSummary');
                  // Navigator.pushNamed(context, '/location');
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
              onTap: () {
                      Navigator.pushNamed(context, '/odersSummary');
                    },
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
                      _showAlertDialog(context);
                    },
                title: Text('update user'),
                shape:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            ListTile(
                leading: Icon(Icons.delete_forever,
                    color: Color(0xFF31B2ED)),
                    onTap: () {
                      _showAlertDialogdelete(context);
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
      body: Padding(padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            TextField(

                        decoration: InputDecoration(
                          
                            filled: true,
                            fillColor: Color(0xFF31B2ED),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF31B2ED), width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            hintText: "Search for a vendor or product",hintStyle: TextStyle(color: Colors.white))),
            
            SizedBox(height: 10,),

            CarouselSlider(
              options: CarouselOptions(height: 150.0,
              autoPlayInterval: Duration(seconds: 3),
              autoPlay: true,),
              items:[
                   Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      
                      child: Image.asset("assets/images/burgerAd.png",fit: BoxFit.fill,),

                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      
                      child: Image.asset("assets/images/burgerAd.png",fit: BoxFit.fill,),

                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      
                      child: Image.asset("assets/images/burgerAd.png",fit: BoxFit.fill,),

                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      
                      child: Image.asset("assets/images/burgerAd.png",fit: BoxFit.fill,),

                    ),
              ]
              
            ),
SizedBox(height: 20,),

            // Container(
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Container(
            //         width: 161,
            //         height: 41,
            //         color: Color(0xFF31B2ED),
            //         child: Row(
            //           children: [
            //             Icon(Icons.fastfood,color: Colors.white,),
            //             Text("Burgers",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            //           ],
            //         )
            //       ),
            //       Container(
            //          width: 161,
            //         height: 41,
            //         color: Color(0xFF31B2ED),
            //         child: Row(
            //           children: [
            //             Icon(Icons.fastfood,color: Colors.white,),
            //             Text("Burgers",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            //           ],
            //         )
            //       ),
            //       Container(
            //          width: 161,
            //         height: 41,
            //         color: Color(0xFF31B2ED),
            //         child: Row(
            //           children: [
            //             Icon(Icons.fastfood,color: Colors.white,),
            //             Text("Burgers",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            //           ],
            //         )
            //       ),
            //       Container(
            //          width: 161,
            //         height: 41,
            //         color: Color(0xFF31B2ED),
            //         child: Row(
            //           children: [
            //             Icon(Icons.fastfood,color: Colors.white,),
            //             Text("Burgers",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            //           ],
            //         )
            //       ),
            //     ],
            //   ),
            // )

            Container(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
          height: 41,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, "/BurgerSpot");
              },
              style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF31B2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                      ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/burger.png',),
                      SizedBox(height: 10,),
                      Text('Burger',style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Nunito',fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/pizzaSpot');
              },
              style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF31B2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                      ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Pizza.png',width:40,fit: BoxFit.cover,),
                      SizedBox(height: 10,),
                      Text('Pizza',style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Nunito',fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, "/SandwichSpot");
              },
              style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF31B2ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                      ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/sandwich_icon.png',),
                      SizedBox(height: 10,),
                      Text('Sandwhich',style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Nunito',fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              ]
              )
              ),
          ),
          SizedBox(height: 20,),

          Container(
                height:
                    400, 
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: Colors.white),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantCard(
                      restaurantName: restaurants[index].name,
                      restaurantImage: restaurants[index].image,
                      restaurantId: restaurants[index].id,
                    );
                  },
                ),
              ),




//  Container(
//   height: 400,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [Image.asset('assets/images/r2.jpg'),
//                       ElevatedButton(onPressed: (){},
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         )  ),
//                         child: Container(
//                           // decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
//                           // borderRadius: BorderRadius.circular(8)),
//                           // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//                           child: Text('KFC',style: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.w800))),
//                       )
//                       ]),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/like-shapes.png"),
//                           Text(
//                             '97%',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
                  
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [Image.asset('assets/images/r1.jpg'),
//                       ElevatedButton(onPressed: (){},
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         )  ),
//                         child: Container(
//                           // decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
//                           // borderRadius: BorderRadius.circular(8)),
//                           // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
//                           child: Text('McDonalds',style: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.w800))),
//                       )
//                       ]),
                  
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/like-shapes.png"),
//                           Text(
//                             '98%',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
                      
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [
//                           Image.asset('assets/images/r1.jpg'),
//                       ElevatedButton(onPressed: (){},
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         )  ),
//                         child: Container(
//                           // decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
//                           // borderRadius: BorderRadius.circular(8)),
//                           // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//                           child: Text('Currys',style: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.w800))),
//                       )
//                       ]),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/like-shapes.png"),
//                           Text(
//                             '92%',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
                      
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [Image.asset('assets/images/r3.jpg'),
//                       ElevatedButton( onPressed: (){},
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         )  ),
//                         child: Container(
//                           // decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
//                           // borderRadius: BorderRadius.circular(8)),
//                           // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

//                           child: Text('Posh Foods',style: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.w800))),
//                       )
//                       ]),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/like-shapes.png"),
//                           Text(
//                             '75%',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
                  
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [
//                           Image.asset('assets/images/r4.jpg'),
//                       ElevatedButton(onPressed: (){},
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         )  ),
//                         child: Container(
//                           // decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
//                           // borderRadius: BorderRadius.circular(8)),
//                           // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//                           child: Text('AMALA',style: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.w800))),
//                       )
//                       ]),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/like-shapes.png"),
//                           Text(
//                             '94%',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
                  
                  
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: [
//                           Container(decoration: 
//                           BoxDecoration(
//                              borderRadius: BorderRadius.all(Radius.circular(20))
//                           ),child: Image.asset('assets/images/r2.jpg')),
//                       Container(
//                         // decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
//                         // borderRadius: BorderRadius.circular(8)),
//                         // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//                         child: ElevatedButton(onPressed: (){},
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         )  ),
                        
//                         child: Text('RICE',style: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.w800))))
//                       ]),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/like-shapes.png"),
//                           Text(
//                             '98%',
//                             style: TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
            

            
          ],

        ),
      ),),
    );
  }
}


// Future<bool> retrieveAllRestaurants(BuildContext context) async {
//     //create uri
//     var uri = Uri.parse("$baseUrl/restaurant/find-all-restaurants");
//     //header
//    Map<String, String> header = {"Content-Type": "application/json"};

//     var response = await http.post(uri, headers: header);

//     List jsonResponse = json.decode(response.body);

//     var restaurantList = jsonResponse
//         .map((restaurant) => Restaurant.fromJson(restaurant))
//         .toList();

//     // Update state to trigger a rebuild
//     setState(() {
//       restaurants = restaurantList;
//     });


//     for (var restaurant in restaurants) {
//       print(restaurant.name);
//     }
//     //print the response body
//     print("${response.body}");
//     print("hello......................................................................................");


//     return true;
//   }



// logger.d('Log message with 2 methods');

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Update User',),
        content: Text('Are you  sure you want to update user?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/update");
            },
            child: Text('Yes',style: TextStyle(color: Color(0xFF31B2ED))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Add functionality for the "OK" button
            },
            child: Text('No',style: TextStyle(color: Color(0xFF31B2ED)),),
          ),
        ],
      );
    },
  );
}
void _showAlertDialogdelete(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Delete Account',),
        content: Text('Are you  sure you want to delete your account?'),
        actions: [
          TextButton(
            onPressed: () {
              deleteUser(context);
            },
            child: Text('Yes',style: TextStyle(color: Color(0xFF31B2ED))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Add functionality for the "OK" button
            },
            child: Text('No',style: TextStyle(color: Color(0xFF31B2ED)),),
          ),
        ],
      );
    },
  );
}


