import 'package:flutter/material.dart';
import 'package:third_proj/screens/account.dart';
import 'package:third_proj/screens/chats.dart';
import 'package:third_proj/screens/dashboard.dart';
import 'package:third_proj/screens/orders.dart';
import 'package:third_proj/screens/profile.dart';
// import 'package:second_proj/screens/Account.dart';
// import 'package:second_proj/screens/Order.dart';
// import 'package:second_proj/screens/dashboard.dart';
// import 'package:second_proj/screens/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      bottomNavigationBar:NavigationBar(

        indicatorShape: CircleBorder(side: BorderSide(color: Colors.white),),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF31B2ED),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.home),
          //   icon: Icon(Icons.home_outlined),
          //   label: 'Home',
          // ),
          // NavigationDestination(
          //   icon: Badge(child: Icon(Icons.notifications_sharp)),
          //   label: 'Notifications',
          // ),
          
          NavigationDestination(
            selectedIcon:
                Icon(Icons.home, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.home_outlined,
                color: Color(0xFF31B2ED)),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.shopping_cart_outlined, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.shopping_cart_rounded,
                color: Color(0xFF31B2ED)),
            label: 'Orders',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.search, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.search,
                color: Color(0xFF31B2ED)),
            label: 'Search',

          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.account_circle, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.account_circle_rounded,
                color: Color(0xFF31B2ED)),
            label: 'Account',
          ),
          // NavigationDestination(
          //   icon: Badge(
          //     label: Text('2'),
          //     child: Icon(Icons.messenger_sharp),
          //   ),
          //   label: 'Messages',
          // ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Dashboard(),
        Orders(),
        Chats(),
        Account()

        /// Notifications page
        

        /// Messages page
      ][currentPageIndex],
    );
  }
} 





// decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                   ),
//                   color: Color(0xFF31B2ED),
//               ),

//  shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.only(
//       topRight: Radius.circular(15.0),
//       topLeft: Radius.circular(15.0),
//     ),


