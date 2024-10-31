import 'package:flutter/material.dart';
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
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFF31B2ED),
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
                color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.search, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.shopping_bag_outlined,
                color: Colors.white),
            label: 'Orders',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.shopping_cart, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.chat_outlined,
                color: Colors.white),
            label: 'Chats',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.person_3_rounded, color: Color(0xFF31B2ED),),
            icon: Icon(Icons.person_3_rounded,
                color: Colors.white),
            label: 'Profile',
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
        Profile()

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