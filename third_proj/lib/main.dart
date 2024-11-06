import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_proj/components/foodprovider.dart';
import 'package:third_proj/helper/api_services.dart';
import 'package:third_proj/screens/burger_spot.dart';
import 'package:third_proj/screens/chats.dart';
import 'package:third_proj/screens/location.dart';
import 'package:third_proj/screens/logIn_screen.dart';
import 'package:third_proj/screens/main_screen.dart';
import 'package:third_proj/screens/onboarding1.dart';
import 'package:third_proj/screens/onboarding2.dart';
import 'package:third_proj/screens/onboarding3.dart';
import 'package:third_proj/screens/orderHistory.dart';
import 'package:third_proj/screens/order_summary.dart';
import 'package:third_proj/screens/orders.dart';
import 'package:third_proj/screens/pizza_spot.dart';
import 'package:third_proj/screens/profile.dart';
import 'package:third_proj/screens/restaurant_screen.dart';
import 'package:third_proj/screens/sandwich_spot.dart';
import 'package:third_proj/screens/signup_screen.dart';
import 'package:third_proj/screens/splash.dart';
import 'package:third_proj/screens/successful.dart';
import 'package:third_proj/screens/update.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
        ChangeNotifierProvider(create: (_) => FoodCartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/splash': (context) => Splash(),
        '/onboarding1': (context) => Onboarding1(),
        '/onboarding2': (context) => Onboarding2(),
        '/onboarding3': (context) => Onboarding3(),
        '/signUp': (context) => SignUp(),
        '/logIn': (context) => LogIn(),
        '/Order': (context) => Orders(),
        '/Chats': (context) => Chats(),
        '/Profile': (context) => Profile(),
        '/Mainscreen': (context) => MainScreen(),
        '/BurgerSpot': (context) => BurgerSpot(),
        '/pizzaSpot': (context) => PizzaSpot(),
        '/SandwichSpot': (context) => SandwichSpot(),
        '/update': (context) => UpdateProfileScreen(),
        '/location': (context) => Location(),
        '/odersSummary': (context) => OrderSummaryScreen(),
        '/successful': (context) => Successful(),

        // '/restaurant_screen': (context) => RestaurantScreen(id: 0),

        // Add more routes as needed
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 108, 108, 108)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
